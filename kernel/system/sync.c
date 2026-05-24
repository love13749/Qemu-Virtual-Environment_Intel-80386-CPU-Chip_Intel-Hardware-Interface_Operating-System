#include "sync.h"
#include "../memory/memory.h"
#include "../terminal.h"
#include "../lib/libk.h"

// ==================== 全局同步对象池 ====================
static semaphore_t  semaphore_pool[MAX_SEMAPHORES];
static mutex_t      mutex_pool[MAX_MUTEXES];
static msg_queue_t  msg_queue_pool[MAX_MESSAGE_QUEUES];
static bool sync_initialized = false;

// ==================== 中断上下文检测 ====================
// 简单判断：如果当前进程是 init（PID=1）且不在调度中，可能是中断
// 更精确的方法需要检查 EFLAGS 的 IF 位或 stack 位置
bool is_in_interrupt(void) {
    // 读取 EFLAGS 检查 IF 位
    uint32_t eflags;
    asm volatile("pushf;pop %0" : "=r"(eflags));
    // 在中断处理中 IF 通常为 0（被 cli 关闭）
    return (eflags & 0x200) == 0;
}

// ==================== 等待队列操作（内部辅助） ====================

static void wait_enqueue(tcb_t** head, tcb_t** tail, tcb_t* thread) {
    if (!thread) return;
    thread->next = NULL;
    thread->prev = NULL;
    thread->state = PROCESS_BLOCKED;
    
    if (!*head) {
        *head = thread;
        *tail = thread;
    } else {
        (*tail)->next = thread;
        thread->prev = *tail;
        *tail = thread;
    }
}

static tcb_t* wait_dequeue(tcb_t** head, tcb_t** tail) {
    if (!*head) return NULL;
    
    tcb_t* thread = *head;
    *head = thread->next;
    if (*head) {
        (*head)->prev = NULL;
    } else {
        *tail = NULL;
    }
    
    thread->next = NULL;
    thread->prev = NULL;
    return thread;
}

// ==================== 信号量实现 ====================

void sem_init(semaphore_t* sem, const char* name, int32_t initial_value) {
    if (!sem) return;
    
    memset(sem, 0, sizeof(semaphore_t));
    if (name) {
        strncpy(sem->name, name, SEMAPHORE_NAME_LEN - 1);
        sem->name[SEMAPHORE_NAME_LEN - 1] = '\0';
    }
    sem->value = initial_value;
    sem->wait_queue_head = NULL;
    sem->wait_queue_tail = NULL;
    sem->used = true;
}

void sem_wait(semaphore_t* sem) {
    if (!sem) return;
    
    // 关中断，保证原子操作
    asm volatile("cli");
    
    sem->value--;
    
    if (sem->value < 0) {
        // 阻塞当前线程
        tcb_t* current = get_current_thread();
        if (current) {
            wait_enqueue(&sem->wait_queue_head, &sem->wait_queue_tail, current);
            // 当前线程已被移出就绪队列，调度其他线程
            asm volatile("sti");   // 开中断让调度器正常工作
            schedule();            // 永不返回（被切换后会直接跳到新线程）
        }
    }
    
    asm volatile("sti");
}

void sem_signal(semaphore_t* sem) {
    if (!sem) return;
    
    asm volatile("cli");
    
    sem->value++;
    
    if (sem->value <= 0) {
        // 有线程在等待，唤醒一个
        tcb_t* waiter = wait_dequeue(&sem->wait_queue_head, &sem->wait_queue_tail);
        if (waiter) {
            thread_unblock(waiter);
        }
    }
    
    asm volatile("sti");
}

bool sem_try_wait(semaphore_t* sem) {
    if (!sem) return false;
    
    bool success = false;
    asm volatile("cli");
    
    if (sem->value > 0) {
        sem->value--;
        success = true;
    }
    
    asm volatile("sti");
    return success;
}

void sem_destroy(semaphore_t* sem) {
    if (!sem) return;
    asm volatile("cli");
    
    // 唤醒所有等待的线程
    tcb_t* waiter;
    while ((waiter = wait_dequeue(&sem->wait_queue_head, &sem->wait_queue_tail)) != NULL) {
        thread_unblock(waiter);
    }
    
    memset(sem, 0, sizeof(semaphore_t));
    
    asm volatile("sti");
}

// ==================== 互斥锁实现 ====================

void mutex_init(mutex_t* mtx, const char* name) {
    if (!mtx) return;
    
    memset(mtx, 0, sizeof(mutex_t));
    if (name) {
        strncpy(mtx->name, name, MUTEX_NAME_LEN - 1);
        mtx->name[MUTEX_NAME_LEN - 1] = '\0';
    }
    mtx->locked = false;
    mtx->owner = NULL;
    mtx->wait_queue_head = NULL;
    mtx->wait_queue_tail = NULL;
    mtx->used = true;
}

void mutex_lock(mutex_t* mtx) {
    if (!mtx) return;
    
    asm volatile("cli");
    
    tcb_t* current = get_current_thread();
    
    if (!mtx->locked) {
        // 锁未被持有，直接获取
        mtx->locked = true;
        mtx->owner = current;
        asm volatile("sti");
    } else if (mtx->owner == current) {
        // 同一线程重复加锁（允许重入）
        // 简单实现：允许重入，但不加计数
        asm volatile("sti");
    } else {
        // 锁被其他线程持有，阻塞
        if (current) {
            wait_enqueue(&mtx->wait_queue_head, &mtx->wait_queue_tail, current);
            asm volatile("sti");
            schedule();  // 切换到其他线程
        } else {
            asm volatile("sti");
        }
    }
}

void mutex_unlock(mutex_t* mtx) {
    if (!mtx) return;
    
    asm volatile("cli");
    
    tcb_t* current = get_current_thread();
    
    // 检查是否是锁的持有者
    if (mtx->owner != current) {
        asm volatile("sti");
        return;  // 不是持有者，不能解锁
    }
    
    // 唤醒一个等待的线程（如果有）
    tcb_t* waiter = wait_dequeue(&mtx->wait_queue_head, &mtx->wait_queue_tail);
    if (waiter) {
        // 把锁转给等待的线程
        mtx->owner = waiter;
        thread_unblock(waiter);
    } else {
        // 没有等待者，释放锁
        mtx->locked = false;
        mtx->owner = NULL;
    }
    
    asm volatile("sti");
}

bool mutex_try_lock(mutex_t* mtx) {
    if (!mtx) return false;
    
    bool success = false;
    asm volatile("cli");
    
    if (!mtx->locked) {
        mtx->locked = true;
        mtx->owner = get_current_thread();
        success = true;
    }
    
    asm volatile("sti");
    return success;
}

void mutex_destroy(mutex_t* mtx) {
    if (!mtx) return;
    
    asm volatile("cli");
    
    // 唤醒所有等待的线程
    tcb_t* waiter;
    while ((waiter = wait_dequeue(&mtx->wait_queue_head, &mtx->wait_queue_tail)) != NULL) {
        thread_unblock(waiter);
    }
    
    memset(mtx, 0, sizeof(mutex_t));
    
    asm volatile("sti");
}

// ==================== 消息队列实现 ====================

void msg_queue_init(msg_queue_t* mq, const char* name) {
    if (!mq) return;
    
    memset(mq, 0, sizeof(msg_queue_t));
    if (name) {
        strncpy(mq->name, name, MSG_QUEUE_NAME_LEN - 1);
        mq->name[MSG_QUEUE_NAME_LEN - 1] = '\0';
    }
    mq->head = 0;
    mq->tail = 0;
    mq->count = 0;
    mq->used = true;
    mq->send_wait_head = NULL;
    mq->send_wait_tail = NULL;
    mq->recv_wait_head = NULL;
    mq->recv_wait_tail = NULL;
}

int msg_send(msg_queue_t* mq, uint32_t type, const char* data, uint32_t size) {
    if (!mq || !data) return -1;
    if (size > MSG_MAX_SIZE) size = MSG_MAX_SIZE;
    
    asm volatile("cli");
    
    // 如果队列满，阻塞
    while (mq->count >= MSG_QUEUE_MAX_MSGS) {
        tcb_t* current = get_current_thread();
        if (!current) {
            asm volatile("sti");
            return -2;
        }
        wait_enqueue(&mq->send_wait_head, &mq->send_wait_tail, current);
        asm volatile("sti");
        schedule();  // 永不返回
        asm volatile("cli");
    }
    
    // 写入消息
    message_t* msg = &mq->messages[mq->tail];
    msg->type = type;
    msg->sender_pid = get_current_pid();
    msg->data_size = size;
    memcpy(msg->data, data, size);
    
    mq->tail = (mq->tail + 1) % MSG_QUEUE_MAX_MSGS;
    mq->count++;
    
    // 唤醒一个等待接收的线程
    tcb_t* waiter = wait_dequeue(&mq->recv_wait_head, &mq->recv_wait_tail);
    if (waiter) {
        thread_unblock(waiter);
    }
    
    asm volatile("sti");
    return 0;
}

int msg_recv(msg_queue_t* mq, uint32_t* type, char* data, uint32_t* size) {
    if (!mq) return -1;
    
    asm volatile("cli");
    
    // 如果队列空，阻塞
    while (mq->count == 0) {
        tcb_t* current = get_current_thread();
        if (!current) {
            asm volatile("sti");
            return -2;
        }
        wait_enqueue(&mq->recv_wait_head, &mq->recv_wait_tail, current);
        asm volatile("sti");
        schedule();  // 永不返回
        asm volatile("cli");
    }
    
    // 读取消息
    message_t* msg = &mq->messages[mq->head];
    if (type) *type = msg->type;
    if (data && size) {
        uint32_t copy_size = msg->data_size;
        if (*size < copy_size) copy_size = *size;
        memcpy(data, msg->data, copy_size);
        *size = copy_size;
    } else if (size) {
        *size = msg->data_size;
    }
    
    mq->head = (mq->head + 1) % MSG_QUEUE_MAX_MSGS;
    mq->count--;
    
    // 唤醒一个等待发送的线程
    tcb_t* waiter = wait_dequeue(&mq->send_wait_head, &mq->send_wait_tail);
    if (waiter) {
        thread_unblock(waiter);
    }
    
    asm volatile("sti");
    return 0;
}

int msg_try_send(msg_queue_t* mq, uint32_t type, const char* data, uint32_t size) {
    if (!mq || !data) return -1;
    if (size > MSG_MAX_SIZE) size = MSG_MAX_SIZE;
    
    asm volatile("cli");
    
    if (mq->count >= MSG_QUEUE_MAX_MSGS) {
        asm volatile("sti");
        return -2;  // 队列满
    }
    
    // 写入消息
    message_t* msg = &mq->messages[mq->tail];
    msg->type = type;
    msg->sender_pid = get_current_pid();
    msg->data_size = size;
    memcpy(msg->data, data, size);
    
    mq->tail = (mq->tail + 1) % MSG_QUEUE_MAX_MSGS;
    mq->count++;
    
    // 唤醒一个等待接收的线程
    tcb_t* waiter = wait_dequeue(&mq->recv_wait_head, &mq->recv_wait_tail);
    if (waiter) {
        thread_unblock(waiter);
    }
    
    asm volatile("sti");
    return 0;
}

int msg_try_recv(msg_queue_t* mq, uint32_t* type, char* data, uint32_t* size) {
    if (!mq) return -1;
    
    asm volatile("cli");
    
    if (mq->count == 0) {
        asm volatile("sti");
        return -2;  // 队列空
    }
    
    // 读取消息
    message_t* msg = &mq->messages[mq->head];
    if (type) *type = msg->type;
    if (data && size) {
        uint32_t copy_size = msg->data_size;
        if (*size < copy_size) copy_size = *size;
        memcpy(data, msg->data, copy_size);
        *size = copy_size;
    } else if (size) {
        *size = msg->data_size;
    }
    
    mq->head = (mq->head + 1) % MSG_QUEUE_MAX_MSGS;
    mq->count--;
    
    // 唤醒一个等待发送的线程
    tcb_t* waiter = wait_dequeue(&mq->send_wait_head, &mq->send_wait_tail);
    if (waiter) {
        thread_unblock(waiter);
    }
    
    asm volatile("sti");
    return 0;
}

void msg_queue_destroy(msg_queue_t* mq) {
    if (!mq) return;
    
    asm volatile("cli");
    
    // 唤醒所有等待的线程
    tcb_t* waiter;
    while ((waiter = wait_dequeue(&mq->send_wait_head, &mq->send_wait_tail)) != NULL) {
        thread_unblock(waiter);
    }
    while ((waiter = wait_dequeue(&mq->recv_wait_head, &mq->recv_wait_tail)) != NULL) {
        thread_unblock(waiter);
    }
    
    memset(mq, 0, sizeof(msg_queue_t));
    
    asm volatile("sti");
}

// ==================== 内核级同步对象分配 ====================

semaphore_t* sem_create(const char* name, int32_t initial_value) {
    for (int i = 0; i < MAX_SEMAPHORES; i++) {
        if (!semaphore_pool[i].used) {
            sem_init(&semaphore_pool[i], name, initial_value);
            return &semaphore_pool[i];
        }
    }
    return NULL;
}

mutex_t* mutex_create(const char* name) {
    for (int i = 0; i < MAX_MUTEXES; i++) {
        if (!mutex_pool[i].used) {
            mutex_init(&mutex_pool[i], name);
            return &mutex_pool[i];
        }
    }
    return NULL;
}

msg_queue_t* msg_queue_create(const char* name) {
    for (int i = 0; i < MAX_MESSAGE_QUEUES; i++) {
        if (!msg_queue_pool[i].used) {
            msg_queue_init(&msg_queue_pool[i], name);
            return &msg_queue_pool[i];
        }
    }
    return NULL;
}

// ==================== 初始化 ====================

void sync_init(void) {
    if (sync_initialized) return;
    
    memset(semaphore_pool, 0, sizeof(semaphore_pool));
    memset(mutex_pool, 0, sizeof(mutex_pool));
    memset(msg_queue_pool, 0, sizeof(msg_queue_pool));
    
    sync_initialized = true;
}
