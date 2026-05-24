#ifndef SOUND_H
#define SOUND_H

#include <stdint.h>
#include <stdbool.h>

// ======================================================================
//  PC Speaker (PC 蜂鸣器) 驱动
//  使用 PIT 8253/8254 定时器的通道 2 来产生音频方波
//  支持: 播放单音、播放旋律、循环播放背景音乐
// ======================================================================

// ==================== 音符频率定义 ====================
// 频率 = 1193182 / divisor
// 这里 C4=262Hz 为中央C

// 八度 4 (中央C八度)
#define NOTE_C4  262
#define NOTE_CS4 277   // C#
#define NOTE_D4  294
#define NOTE_DS4 311   // D#
#define NOTE_E4  330
#define NOTE_F4  349
#define NOTE_FS4 370   // F#
#define NOTE_G4  392
#define NOTE_GS4 415   // G#
#define NOTE_A4  440
#define NOTE_AS4 466   // A#
#define NOTE_B4  494

// 八度 3 (低一个八度)
#define NOTE_C3  131
#define NOTE_CS3 139
#define NOTE_D3  147
#define NOTE_DS3 156
#define NOTE_E3  165
#define NOTE_F3  175
#define NOTE_FS3 185
#define NOTE_G3  196
#define NOTE_GS3 208
#define NOTE_A3  220
#define NOTE_AS3 233
#define NOTE_B3  247

// 八度 5 (高一个八度)
#define NOTE_C5  523
#define NOTE_CS5 554
#define NOTE_D5  587
#define NOTE_DS5 622
#define NOTE_E5  659
#define NOTE_F5  698
#define NOTE_FS5 740
#define NOTE_G5  784
#define NOTE_GS5 831
#define NOTE_A5  880
#define NOTE_AS5 932
#define NOTE_B5  988

// 八度 6 (高两个八度)
#define NOTE_C6  1047
#define NOTE_CS6 1109
#define NOTE_D6  1175
#define NOTE_DS6 1245
#define NOTE_E6  1319
#define NOTE_F6  1397
#define NOTE_FS6 1480
#define NOTE_G6  1568
#define NOTE_GS6 1661
#define NOTE_A6  1760
#define NOTE_AS6 1865
#define NOTE_B6  1976

// 特殊值
#define NOTE_REST 0     // 休止符

// ==================== 音符时长定义 (毫秒) ====================
// 以 120 BPM (Beats Per Minute) 为基准
// 每拍 = 60000ms / 120 = 500ms
#define NOTE_WHOLE      2000    // 全音符 (4拍)
#define NOTE_HALF       1000    // 二分音符 (2拍)
#define NOTE_QUARTER    500     // 四分音符 (1拍)
#define NOTE_EIGHTH     250     // 八分音符 (1/2拍)
#define NOTE_SIXTEENTH  125     // 十六分音符 (1/4拍)

// ==================== 旋律结构体 ====================

// 音符结构: {频率, 持续时间(ms)}
typedef struct {
    uint16_t frequency;  // 频率 (Hz), 0=休止符
    uint16_t duration;   // 持续时间 (毫秒)
} note_t;

// ==================== 导出的 API ====================

// 初始化 PC Speaker
void sound_init(void);

// 开启蜂鸣器 (指定频率 Hz)
void sound_beep_on(uint16_t frequency);

// 关闭蜂鸣器
void sound_beep_off(void);

// 播放一个单音 (频率, 持续时间 ms)，阻塞式
void sound_play_tone(uint16_t frequency, uint16_t duration_ms);

// 播放一段旋律 (非阻塞，由定时器中断驱动)
// 旋律以 {0, 0} 结尾
void sound_play_melody(const note_t* melody);

// 停止当前旋律播放
void sound_stop_melody(void);

// 循环播放指定旋律
void sound_loop_melody(const note_t* melody);

// 设置音量 (0-100)
void sound_set_volume(uint8_t volume);

// 获取当前音量
uint8_t sound_get_volume(void);

// 检查是否正在播放
bool sound_is_playing(void);

// 静音/取消静音
void sound_set_mute(bool mute);
bool sound_get_mute(void);

// 获取当前播放进度 (当前音符索引)
int sound_get_current_note(void);

// ==================== 内置预置旋律 ====================

// 简单的背景音乐 - 小星星 (Twinkle Twinkle Little Star)
extern const note_t melody_twinkle[];

// 超级玛丽主题曲 (简化版)
extern const note_t melody_super_mario[];

// 简单的叮咚声
extern const note_t melody_ding_dong[];

// 生日快乐
extern const note_t melody_happy_birthday[];

// 8-bit 风格背景音乐
extern const note_t melody_8bit_bgm[];

#endif // SOUND_H
