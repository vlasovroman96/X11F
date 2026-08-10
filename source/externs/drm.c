#include <stddef.h>
#include <sys/types.h>
#define _DRM_CONTROL_H_
#define _DRM_STATS_H_
#define _DRM_BUF_DESC_H_
#define __KERNEL__ 0
#define hdr_metadata_infoframe __ignored_hdr_infoframe
#define hdr_output_metadata __ignored_hdr_output

#pragma attribute(push, nogc, nothrow)
#include <drm.h>
#include <drm_mode.h>
#include <xf86drmMode.h>
#include <xf86drm.h>
#include <gbm.h>
#include <drm_fourcc.h>
#include "X11/dri/xf86driproto.h"
#include "X11/dri/xf86dri.h"
#include "xf86drmMode.h"
#pragma attribute(pop)

#undef hdr_metadata_infoframe
#undef hdr_output_metadata