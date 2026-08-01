// xorg_drm.h
// #ifndef DRM
// #define DRM
#include <stddef.h>
#include <sys/types.h>
// #pragma once 

// 1. Обманываем guard-макросы ядра Linux. 
// Заставляем drm.h думать, что старые legacy-структуры уже были объявлены в другом месте.
// Это заставит препроцессор пропустить строки 169, 262, 329, 350 и их typedef'ы.
#define _DRM_CONTROL_H_
#define _DRM_STATS_H_
#define _DRM_BUF_DESC_H_

// 2. Включаем специальный флаг ядра Linux (если он поддерживается), 
// который отключает устаревший код (Legacy/AGP/Maps API)
#define __KERNEL__ 0

// 3. Исправляем конфликты HDR в файле drm_mode.h
// Полностью скрываем структуру hdr_metadata_infoframe от парсера dmd.
// Драйверу modesetting она не нужна (он использует только внешние вызовы)
#define hdr_metadata_infoframe __ignored_hdr_infoframe
#define hdr_output_metadata __ignored_hdr_output

// 4. Теперь безопасно подключаем заголовки. 
// Они увидят наши макросы-обманки и пропустят проблемные структуры.
#include <drm.h>
#include <drm_mode.h>
#include <xf86drmMode.h>
#include <xf86drm.h>
#include <gbm.h>
#include <drm_fourcc.h>"

// #define fourcc_code(a,b,c,d) ((uint32_t)(a) | ((uint32_t)(b)<<8) | ((uint32_t)(c)<<16) | ((uint32_t)(d)<<24))

// 5. Очищаем макросы HDR, чтобы они не мешали остальному коду
#undef hdr_metadata_infoframe
#undef hdr_output_metadata
// #endif