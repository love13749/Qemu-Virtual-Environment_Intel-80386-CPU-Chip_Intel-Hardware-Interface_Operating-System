#ifndef TIMER_H
#define TIMER_H

#include <stdint.h>

// 硬件8253/8254定时器
void timer_init(uint32_t frequency);

#endif // TIMER_H
