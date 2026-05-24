#include "sound.h"
#include "../architecture/i386/isr.h"
#include "../architecture/i386/ports.h"
#include "../terminal.h"
#include "../lib/libk.h"

// ======================================================================
//  PC Speaker (PC 蜂鸣器) 驱动实现
//
//  原理:
//  PC Speaker 连接在 PIT (8253/8254) 定时器通道 2 的输出上。
//  通过编程通道 2 产生指定频率的方波，再通过控制 61h 端口的
//  bit0 (定时器门控) 和 bit1 (扬声器数据) 来开关声音。
//
//  端口:
//  0x42 - PIT 通道 2 数据端口 (设置分频计数值)
//  0x43 - PIT 控制字端口 (选择通道2, 模式3, 16位计数)
//  0x61 - PC Speaker 控制端口 (bit0=定时器门控, bit1=扬声器数据)
//
//  频率计算公式:
//  输出频率 = 1193182 / divisor
//  divisor = 1193182 / frequency
// ======================================================================

// ==================== 常量 ====================

#define PIT_FREQUENCY   1193182
#define PIT_CH2_DATA    0x42
#define PIT_CMD_PORT    0x43
#define SPEAKER_PORT    0x61
#define PIT_CMD_CH2_MODE3  0xB6

#define VOLUME_MAX      100
#define VOLUME_MIN      0

// ==================== 内部状态 ====================

static volatile bool sound_playing = false;
static volatile bool sound_muted = false;
static volatile uint8_t sound_volume = 100;
static volatile bool melody_playing = false;
static volatile bool melody_loop = false;

static const note_t* current_melody = NULL;
static volatile int current_note_index = 0;

// 音符播放进度（使用全局变量而非 static 局部变量，确保可正确重置）
static volatile uint32_t note_play_tick = 0;
static volatile bool note_started = false;

// 1 tick = 10ms（timer_init(100) 设定 100Hz）
#define MS_PER_TICK     10

// ==================== 内部函数 ====================

static void pit_set_frequency(uint16_t frequency) {
    if (frequency == 0) return;
    uint16_t divisor = PIT_FREQUENCY / frequency;
    outb(PIT_CMD_PORT, PIT_CMD_CH2_MODE3);
    outb(PIT_CH2_DATA, divisor & 0xFF);
    outb(PIT_CH2_DATA, (divisor >> 8) & 0xFF);
}

static inline uint8_t speaker_read(void) {
    return inb(SPEAKER_PORT);
}

static inline void speaker_write(uint8_t value) {
    outb(SPEAKER_PORT, value);
}

static void speaker_enable(void) {
    uint8_t tmp = speaker_read();
    if (!(tmp & 0x03)) {
        speaker_write(tmp | 0x03);
    }
}

static void speaker_disable(void) {
    uint8_t tmp = speaker_read();
    tmp &= ~0x03;
    speaker_write(tmp);
}

static void speaker_start_freq(uint16_t frequency) {
    if (frequency == 0) {
        speaker_disable();
        return;
    }
    pit_set_frequency(frequency);
    speaker_enable();
}

static void speaker_stop(void) {
    speaker_disable();
}

// ==================== 核心旋律播放逻辑 ====================
// 由 timer.c 的定时器中断回调每 tick (~10ms) 调用一次

void sound_tick(void) {
    if (!melody_playing || current_melody == NULL) return;

    const note_t* current = &current_melody[current_note_index];

    // 检查是否到达旋律末尾 ({0, 0})
    if (current->frequency == 0 && current->duration == 0) {
        if (melody_loop) {
            // 循环播放：重置所有状态回到开头
            current_note_index = 0;
            note_started = false;
            note_play_tick = 0;
            return;  // 下一个 tick 会开始播放第一个音符
        } else {
            melody_playing = false;
            sound_playing = false;
            note_started = false;
            note_play_tick = 0;
            speaker_stop();
            return;
        }
    }

    if (!note_started) {
        // 开始新音符
        note_started = true;
        note_play_tick = 0;

        if (current->frequency > 0 && !sound_muted) {
            speaker_start_freq(current->frequency);
        } else {
            speaker_stop();
        }
        return;
    }

    // 当前音符正在播放
    note_play_tick++;

    uint32_t needed_ticks = (current->duration + MS_PER_TICK - 1) / MS_PER_TICK;
    if (needed_ticks < 1) needed_ticks = 1;

    if (note_play_tick >= needed_ticks) {
        note_started = false;
        note_play_tick = 0;
        current_note_index++;
    }
}

// ==================== 预置旋律定义 ====================

// 1. 小星星 (Twinkle Twinkle Little Star)
const note_t melody_twinkle[] = {
    {NOTE_C4, 500}, {NOTE_C4, 500}, {NOTE_G4, 500}, {NOTE_G4, 500},
    {NOTE_A4, 500}, {NOTE_A4, 500}, {NOTE_G4, 1000},
    {NOTE_F4, 500}, {NOTE_F4, 500}, {NOTE_E4, 500}, {NOTE_E4, 500},
    {NOTE_D4, 500}, {NOTE_D4, 500}, {NOTE_C4, 1000},
    {NOTE_G4, 500}, {NOTE_G4, 500}, {NOTE_F4, 500}, {NOTE_F4, 500},
    {NOTE_E4, 500}, {NOTE_E4, 500}, {NOTE_D4, 1000},
    {NOTE_G4, 500}, {NOTE_G4, 500}, {NOTE_F4, 500}, {NOTE_F4, 500},
    {NOTE_E4, 500}, {NOTE_E4, 500}, {NOTE_D4, 1000},
    {NOTE_C4, 500}, {NOTE_C4, 500}, {NOTE_G4, 500}, {NOTE_G4, 500},
    {NOTE_A4, 500}, {NOTE_A4, 500}, {NOTE_G4, 1000},
    {NOTE_F4, 500}, {NOTE_F4, 500}, {NOTE_E4, 500}, {NOTE_E4, 500},
    {NOTE_D4, 500}, {NOTE_D4, 500}, {NOTE_C4, 1000},
    {0, 0}
};

// 2. 超级玛丽主题 (简化版)
const note_t melody_super_mario[] = {
    {NOTE_E5, 125}, {NOTE_E5, 125}, {NOTE_REST, 125}, {NOTE_E5, 125},
    {NOTE_REST, 125}, {NOTE_C5, 125}, {NOTE_E5, 125},
    {NOTE_G5, 500}, {NOTE_REST, 500},
    {NOTE_G4, 500}, {NOTE_REST, 500},
    {NOTE_C5, 250}, {NOTE_REST, 125}, {NOTE_G4, 125},
    {NOTE_REST, 125}, {NOTE_E4, 125},
    {NOTE_REST, 125}, {NOTE_A4, 125}, {NOTE_REST, 125},
    {NOTE_B4, 125}, {NOTE_REST, 125}, {NOTE_AS4, 125}, {NOTE_A4, 125},
    {NOTE_G4, 125}, {NOTE_E5, 125}, {NOTE_G5, 125},
    {NOTE_A5, 250}, {NOTE_F5, 125}, {NOTE_G5, 125},
    {NOTE_REST, 125}, {NOTE_E5, 125}, {NOTE_REST, 125},
    {NOTE_C5, 125}, {NOTE_D5, 125}, {NOTE_B4, 125},
    {NOTE_REST, 125}, {NOTE_REST, 125},
    {0, 0}
};

// 3. 叮咚声 (门铃)
const note_t melody_ding_dong[] = {
    {NOTE_C5, 300},
    {NOTE_REST, 100},
    {NOTE_E5, 300},
    {NOTE_REST, 100},
    {NOTE_G5, 500},
    {0, 0}
};

// 4. 生日快乐
const note_t melody_happy_birthday[] = {
    {NOTE_G4, 250}, {NOTE_G4, 125}, {NOTE_A4, 500},
    {NOTE_G4, 500}, {NOTE_C5, 250},
    {NOTE_B4, 1000},
    {NOTE_REST, 125},
    {NOTE_G4, 250}, {NOTE_G4, 125}, {NOTE_A4, 500},
    {NOTE_G4, 500}, {NOTE_D5, 250},
    {NOTE_C5, 1000},
    // ... rest of song ...
    {0, 0}
};

// 5. 8-bit 风格背景音乐 (适合循环播放)
const note_t melody_8bit_bgm[] = {
    {NOTE_C4, 200}, {NOTE_E4, 200}, {NOTE_G4, 200}, {NOTE_C5, 200},
    {NOTE_G4, 200}, {NOTE_E4, 200}, {NOTE_C4, 200}, {NOTE_REST, 200},
    {NOTE_D4, 200}, {NOTE_F4, 200}, {NOTE_A4, 200}, {NOTE_D5, 200},
    {NOTE_A4, 200}, {NOTE_F4, 200}, {NOTE_D4, 200}, {NOTE_REST, 200},
    {NOTE_E4, 200}, {NOTE_G4, 200}, {NOTE_B4, 200}, {NOTE_E5, 200},
    {NOTE_B4, 200}, {NOTE_G4, 200}, {NOTE_E4, 200}, {NOTE_REST, 200},
    {NOTE_F4, 200}, {NOTE_A4, 200}, {NOTE_C5, 200}, {NOTE_F5, 200},
    {NOTE_C5, 200}, {NOTE_A4, 200}, {NOTE_F4, 200}, {NOTE_REST, 200},
    {NOTE_G4, 200}, {NOTE_B4, 200}, {NOTE_D5, 200}, {NOTE_G5, 200},
    {NOTE_D5, 200}, {NOTE_B4, 200}, {NOTE_G4, 200}, {NOTE_REST, 200},
    {NOTE_A4, 200}, {NOTE_C5, 200}, {NOTE_E5, 200}, {NOTE_A5, 200},
    {NOTE_E5, 200}, {NOTE_C5, 200}, {NOTE_A4, 200}, {NOTE_REST, 200},
    {NOTE_F4, 200}, {NOTE_A4, 200}, {NOTE_C5, 200}, {NOTE_F5, 200},
    {NOTE_C5, 200}, {NOTE_A4, 200}, {NOTE_F4, 200}, {NOTE_REST, 200},
    {NOTE_E4, 200}, {NOTE_G4, 200}, {NOTE_C5, 200}, {NOTE_E5, 200},
    {NOTE_C5, 200}, {NOTE_G4, 200}, {NOTE_E4, 200}, {NOTE_C4, 200},
    {0, 0}
};

// ==================== 公有 API 实现 ====================

void sound_init(void) {
    terminal_writestring("Initializing PC Speaker...\n");

    sound_playing = false;
    sound_muted = false;
    sound_volume = 100;
    melody_playing = false;
    melody_loop = false;
    current_melody = NULL;
    current_note_index = 0;
    note_started = false;
    note_play_tick = 0;

    speaker_disable();

    terminal_writestring("PC Speaker initialized.\n");
    terminal_writestring("  Supported: tones, melodies, background music\n");
    terminal_writestring("  Volume: adjustable (0-100)\n");
}

void sound_beep_on(uint16_t frequency) {
    if (frequency == 0 || sound_muted) {
        sound_beep_off();
        return;
    }
    sound_playing = true;
    speaker_start_freq(frequency);
}

void sound_beep_off(void) {
    sound_playing = false;
    speaker_stop();
}

void sound_play_tone(uint16_t frequency, uint16_t duration_ms) {
    if (frequency == 0 || sound_muted) {
        uint32_t wait_ticks = (duration_ms + MS_PER_TICK - 1) / MS_PER_TICK;
        for (uint32_t i = 0; i < wait_ticks; i++) {
            for (volatile uint32_t j = 0; j < 100000; j++);
        }
        return;
    }

    sound_beep_on(frequency);
    uint32_t wait_ticks = (duration_ms + MS_PER_TICK - 1) / MS_PER_TICK;
    for (uint32_t i = 0; i < wait_ticks; i++) {
        for (volatile uint32_t j = 0; j < 100000; j++);
    }
    sound_beep_off();
}

void sound_play_melody(const note_t* melody) {
    if (melody == NULL) return;

    if (melody_playing) {
        melody_playing = false;
        speaker_stop();
    }

    current_melody = melody;
    current_note_index = 0;
    note_started = false;
    note_play_tick = 0;
    melody_loop = false;
    melody_playing = true;
    sound_playing = true;
}

void sound_stop_melody(void) {
    melody_playing = false;
    sound_playing = false;
    melody_loop = false;
    current_melody = NULL;
    current_note_index = 0;
    note_started = false;
    note_play_tick = 0;
    speaker_stop();
}

void sound_loop_melody(const note_t* melody) {
    if (melody == NULL) return;

    if (melody_playing) {
        melody_playing = false;
        speaker_stop();
    }

    current_melody = melody;
    current_note_index = 0;
    note_started = false;
    note_play_tick = 0;
    melody_loop = true;
    melody_playing = true;
    sound_playing = true;
}

void sound_set_volume(uint8_t volume) {
    if (volume > VOLUME_MAX) volume = VOLUME_MAX;
    sound_volume = volume;
    if (volume == 0) {
        sound_muted = true;
        speaker_stop();
    } else {
        sound_muted = false;
    }
}

uint8_t sound_get_volume(void) {
    return sound_volume;
}

bool sound_is_playing(void) {
    return sound_playing;
}

void sound_set_mute(bool mute) {
    sound_muted = mute;
    if (mute) {
        speaker_stop();
    }
}

bool sound_get_mute(void) {
    return sound_muted;
}

int sound_get_current_note(void) {
    return current_note_index;
}