module externs.X11.extensions.dri2proto;
@nogc nothrow:
extern(C): __gshared:
/*
 * Copyright © 2008 Red Hat, Inc.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Soft-
 * ware"), to deal in the Software without restriction, including without
 * limitation the rights to use, copy, modify, merge, publish, distribute,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, provided that the above copyright
 * notice(s) and this permission notice appear in all copies of the Soft-
 * ware and that both the above copyright notice(s) and this permission
 * notice appear in supporting documentation.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
 * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABIL-
 * ITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT OF THIRD PARTY
 * RIGHTS. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR HOLDERS INCLUDED IN
 * THIS NOTICE BE LIABLE FOR ANY CLAIM, OR ANY SPECIAL INDIRECT OR CONSE-
 * QUENTIAL DAMAGES, OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
 * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
 * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFOR-
 * MANCE OF THIS SOFTWARE.
 *
 * Except as contained in this notice, the name of a copyright holder shall
 * not be used in advertising or otherwise to promote the sale, use or
 * other dealings in this Software without prior written authorization of
 * the copyright holder.
 *
 * Authors:
 *   Kristian Høgsberg (krh@redhat.com)
 */

 
enum DRI2_NAME =			"DRI2";
enum DRI2_MAJOR =			1;
enum DRI2_MINOR =			4;

enum DRI2NumberErrors =		0;
enum DRI2NumberEvents =		2;
enum DRI2NumberRequests =		14;

enum X_DRI2QueryVersion =		0;
enum X_DRI2Connect =			1;
enum X_DRI2Authenticate =		2;
enum X_DRI2CreateDrawable =		3;
enum X_DRI2DestroyDrawable =		4;
enum X_DRI2GetBuffers =		5;
enum X_DRI2CopyRegion =		6;
enum X_DRI2GetBuffersWithFormat =	7;
enum X_DRI2SwapBuffers =		8;
enum X_DRI2GetMSC =			9;
enum X_DRI2WaitMSC =			10;
enum X_DRI2WaitSBC =			11;
enum X_DRI2SwapInterval =		12;
enum X_DRI2GetParam =			13;

/*
 * Events
 */
enum DRI2_BufferSwapComplete =	0;
enum DRI2_InvalidateBuffers =	1;

public import externs.X11.Xmd;

struct xDRI2Buffer {
    CARD32 attachment;
    CARD32 name;
    CARD32 pitch;
    CARD32 cpp;
    CARD32 flags;
}

struct xDRI2QueryVersionReq {
    CARD8 reqType;
    CARD8 dri2ReqType;
    CARD16 length;
    CARD32 majorVersion;
    CARD32 minorVersion;
}
enum sz_xDRI2QueryVersionReq =   12;

struct xDRI2QueryVersionReply {
    BYTE type;   /* X_Reply */
    BYTE pad1;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 majorVersion;
    CARD32 minorVersion;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
}
enum sz_xDRI2QueryVersionReply =	32;

struct xDRI2ConnectReq {
    CARD8 reqType;
    CARD8 dri2ReqType;
    CARD16 length;
    CARD32 window;
    CARD32 driverType;
}
enum sz_xDRI2ConnectReq =	12;

struct xDRI2ConnectReply {
    BYTE type;   /* X_Reply */
    BYTE pad1;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 driverNameLength;
    CARD32 deviceNameLength;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
}
enum sz_xDRI2ConnectReply =	32;

struct xDRI2AuthenticateReq {
    CARD8 reqType;
    CARD8 dri2ReqType;
    CARD16 length;
    CARD32 window;
    CARD32 magic;
}
enum sz_xDRI2AuthenticateReq =   12;

struct xDRI2AuthenticateReply {
    BYTE type;   /* X_Reply */
    BYTE pad1;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 authenticated;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
}
enum sz_xDRI2AuthenticateReply =	32;

struct xDRI2CreateDrawableReq {
    CARD8 reqType;
    CARD8 dri2ReqType;
    CARD16 length;
    CARD32 drawable;
}
enum sz_xDRI2CreateDrawableReq =   8;

struct xDRI2DestroyDrawableReq {
    CARD8 reqType;
    CARD8 dri2ReqType;
    CARD16 length;
    CARD32 drawable;
}
enum sz_xDRI2DestroyDrawableReq =   8;

struct xDRI2GetBuffersReq {
    CARD8 reqType;
    CARD8 dri2ReqType;
    CARD16 length;
    CARD32 drawable;
    CARD32 count;
}
enum sz_xDRI2GetBuffersReq =   12;

struct xDRI2GetBuffersReply {
    BYTE type;   /* X_Reply */
    BYTE pad1;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 width;
    CARD32 height;
    CARD32 count;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
}
enum sz_xDRI2GetBuffersReply =	32;

struct xDRI2CopyRegionReq {
    CARD8 reqType;
    CARD8 dri2ReqType;
    CARD16 length;
    CARD32 drawable;
    CARD32 region;
    CARD32 dest;
    CARD32 src;
}
enum sz_xDRI2CopyRegionReq =   20;

struct xDRI2CopyRegionReply {
    BYTE type;   /* X_Reply */
    BYTE pad1;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
    CARD32 pad7;
}
enum sz_xDRI2CopyRegionReply =	32;

struct xDRI2SwapBuffersReq {
    CARD8 reqType;
    CARD8 dri2ReqType;
    CARD16 length;
    CARD32 drawable;
    CARD32 target_msc_hi;
    CARD32 target_msc_lo;
    CARD32 divisor_hi;
    CARD32 divisor_lo;
    CARD32 remainder_hi;
    CARD32 remainder_lo;
}
enum sz_xDRI2SwapBuffersReq =  32;

struct xDRI2SwapBuffersReply {
    BYTE type;   /* X_Reply */
    BYTE pad1;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 swap_hi;
    CARD32 swap_lo;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
}
enum sz_xDRI2SwapBuffersReply = 32;

struct xDRI2GetMSCReq {
    CARD8 reqType;
    CARD8 dri2ReqType;
    CARD16 length;
    CARD32 drawable;
}
enum sz_xDRI2GetMSCReq = 8;

struct xDRI2WaitMSCReq {
    CARD8 reqType;
    CARD8 dri2ReqType;
    CARD16 length;
    CARD32 drawable;
    CARD32 target_msc_hi;
    CARD32 target_msc_lo;
    CARD32 divisor_hi;
    CARD32 divisor_lo;
    CARD32 remainder_hi;
    CARD32 remainder_lo;
}
enum sz_xDRI2WaitMSCReq = 32;

struct xDRI2WaitSBCReq {
    CARD8 reqType;
    CARD8 dri2ReqType;
    CARD16 length;
    CARD32 drawable;
    CARD32 target_sbc_hi;
    CARD32 target_sbc_lo;
}
enum sz_xDRI2WaitSBCReq = 16;

struct xDRI2MSCReply {
    CARD8 type;
    CARD8 pad1;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 ust_hi;
    CARD32 ust_lo;
    CARD32 msc_hi;
    CARD32 msc_lo;
    CARD32 sbc_hi;
    CARD32 sbc_lo;
}
enum sz_xDRI2MSCReply = 32;

struct xDRI2SwapIntervalReq {
    CARD8 reqType;
    CARD8 dri2ReqType;
    CARD16 length;
    CARD32 drawable;
    CARD32 interval;
}
enum sz_xDRI2SwapIntervalReq = 12;

struct xDRI2BufferSwapComplete {
    CARD8 type;
    CARD8 pad;
    CARD16 sequenceNumber;
    CARD16 event_type;
    CARD16 pad2;
    CARD32 drawable;
    CARD32 ust_hi;
    CARD32 ust_lo;
    CARD32 msc_hi;
    CARD32 msc_lo;
    CARD32 sbc_hi;
    CARD32 sbc_lo;
}
enum sz_xDRI2BufferSwapComplete = 32;

struct xDRI2BufferSwapComplete2 {
    CARD8 type;
    CARD8 pad;
    CARD16 sequenceNumber;
    CARD16 event_type;
    CARD16 pad2;
    CARD32 drawable;
    CARD32 ust_hi;
    CARD32 ust_lo;
    CARD32 msc_hi;
    CARD32 msc_lo;
    CARD32 sbc;
}
enum sz_xDRI2BufferSwapComplete2 = 32;

struct xDRI2InvalidateBuffers {
    CARD8 type;
    CARD8 pad;
    CARD16 sequenceNumber;
    CARD32 drawable;
    CARD32 pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
}
enum sz_xDRI2InvalidateBuffers = 32;

struct xDRI2GetParamReq {
    CARD8 reqType;
    CARD8 dri2ReqType;
    CARD16 length;
    CARD32 drawable;
    CARD32 param;
}
enum sz_xDRI2GetParamReq = 12;

struct xDRI2GetParamReply {
    BYTE type; /*X_Reply*/
    BOOL is_param_recognized;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 value_hi;
    CARD32 value_lo;
    CARD32 pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
}
enum sz_xDRI2GetParamReply = 32;


