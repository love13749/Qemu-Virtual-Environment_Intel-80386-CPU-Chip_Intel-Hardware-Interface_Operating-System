#ifndef SYNC_H
#define SYNC_H

#include <stdint.h>
#include <stdbool.h>
#include "process.h"

// ==================== 信号量 (Semaphore) ====================
// 支持 P（wait）/ V（signal）操作
// 经典 Dijkstra 信号量

#define MAX_SEMAPHORES     64
#define SEMAPHORE_NAME_LEN 24

typedef struct semaphore {
    char     name[SEMAPHORE_NAME_LEN];   // 信号量名称
    int32_t  value;                       // 信号量计数值
    tcb_t*   wait_queue_head;             // 等待队列（阻塞在此信号量的线程链表）
    tcb_t*   wait_queue_tail;
    bool     used;                        // 是否已被使用
} semaphore_t;

// 初始化信号量（指定初始值）
void sem_init(semaphore_t* sem, const char* name, int32_t initial_value);

// P 操作：等待（如果 value <= 0，阻塞当前线程）
void sem_wait(semaphore_t* sem);

// V 操作：释放（唤醒一个等待的线程）
void sem_signal(semaphore_t* sem);

// 尝试 P 操作（不阻塞，成功返回 true）
bool sem_try_wait(semaphore_t* sem);

// 销毁信号量
void sem_destroy(semaphore_t* sem);

// ==================== 互斥锁 (Mutex) ====================
// 简化版互斥锁，基于信号量实现（二值信号量）

#define MAX_MUTEXES        64
#define MUTEX_NAME_LEN     24

typedef struct mutex {
    char      name[MUTEX_NAME_LEN];       // 锁名称
    bool      locked;                      // 是否已被锁定
    tcb_t*    owner;                       // 持有锁的线程
    tcb_t*    wait_queue_head;             // 等待队列
    tcb_t*    wait_queue_tail;
    bool      used;
} mutex_t;

// 初始化互斥锁
void mutex_init(mutex_t* mtx, const char* name);

// 加锁（如果已被其他线程持有，阻塞当前线程）
void mutex_lock(mutex_t* mtx);

// 解锁（并唤醒一个等待的线程）
void mutex_unlock(mutex_t* mtx);

// 尝试加锁（不阻塞，成功返回 true）
bool mutex_try_lock(mutex_t* mtx);

// 销毁互斥锁
void mutex_destroy(mutex_t* mtx);

// ==================== 消息队列 (Message Queue) ====================
// 进程间通信，支持发送和接收消息

#define MAX_MESSAGE_QUEUES  32
#define MSG_QUEUE_NAME_LEN  24
#define MSG_MAX_SIZE        64            // 单条消息最大字节数
#define MSG_QUEUE_MAX_MSGS  16            // 队列最大消息数

// 消息结构
typedef struct message {
    uint32_t type;                         // 消息类型（用户自定义）
    uint32_t sender_pid;                   // 发送者 PID
    uint32_t data_size;                    // 数据大小（字节）
    char     data[MSG_MAX_SIZE];           // 消息数据
} message_t;

// 消息队列
typedef struct msg_queue {
    char      name[MSG_QUEUE_NAME_LEN];
    message_t messages[MSG_QUEUE_MAX_MSGS]; // 环形缓冲区
    uint32_t  head;                         // 读索引
    uint32_t  tail;                         // 写索引
    uint32_t  count;                        // 当前消息数
    bool      used;
    
    // 等待队列
    tcb_t*    send_wait_head;               // 等待发送的线程（队列满时阻塞）
    tcb_t*    send_wait_tail;
    tcb_t*    recv_wait_head;               // 等待接收的线程（队列空时阻塞）
    tcb_t*    recv_wait_tail;
} msg_queue_t;

// 创建消息队列
void msg_queue_init(msg_queue_t* mq, const char* name);

// 发送消息（如果队列满则阻塞当前线程）
int  msg_send(msg_queue_t* mq, uint32_t type, const char* data, uint32_t size);

// 接收消息（如果队列空则阻塞当前线程）
int  msg_recv(msg_queue_t* mq, uint32_t* type, char* data, uint32_t* size);

// 尝试发送（不阻塞）
int  msg_try_send(msg_queue_t* mq, uint32_t type, const char* data, uint32_t size);

// 尝试接收（不阻塞）
int  msg_try_recv(msg_queue_t* mq, uint32_t* type, char* data, uint32_t* size);

// 销毁消息队列
void msg_queue_destroy(msg_queue_t* mq);

// ==================== 内核级信号量（全局） ====================
// 方便在内核中快速使用的全局信号量/互斥锁/消息队列

// 获取一个空闲的信号量
semaphore_t* sem_create(const char* name, int32_t initial_value);

// 获取一个空闲的互斥锁
mutex_t* mutex_create(const char* name);

// 获取一个空闲的消息队列
msg_queue_t* msg_queue_create(const char* name);

// ==================== 初始化 ====================

// 初始化同步子系统（信号量池、互斥锁池、消息队列池）
void sync_init(void);

// ==================== 工具函数 ====================

// 检查当前是否在中断上下文中（用于断言：P/V 不能在中断中调用）
bool is_in_interrupt(void);

#endif // SYNC_H
