// 1. Выставляем Include Guard для linux/types.h, чтобы он не загружался
#define _LINUX_TYPES_H
#define _LINUX_TYPES_H_

// 2. Объявляем базовые типы, которые обычно требуются для drm_fourcc.h
typedef unsigned char __u8;
typedef unsigned short __u16;
typedef unsigned int __u32;
typedef unsigned long long __u64;

typedef signed char __s8;
typedef signed short __s16;
typedef signed int __s32;
typedef signed long long __s64;
#include <drm/drm_fourcc.h>

// #undef signed
// #undef unsigned

