module externs.X11.extensions.dri3proto;
@nogc nothrow:
extern(C): __gshared:
/*
 * Copyright © 2013 Keith Packard
 *
 * Permission to use, copy, modify, distribute, and sell this software and its
 * documentation for any purpose is hereby granted without fee, provided that
 * the above copyright notice appear in all copies and that both that copyright
 * notice and this permission notice appear in supporting documentation, and
 * that the name of the copyright holders not be used in advertising or
 * publicity pertaining to distribution of the software without specific,
 * written prior permission.  The copyright holders make no representations
 * about the suitability of this software for any purpose.  It is provided "as
 * is" without express or implied warranty.
 *
 * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
 * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
 * EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY SPECIAL, INDIRECT OR
 * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
 * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
 * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE
 * OF THIS SOFTWARE.
 */

 
public import externs.X11.Xmd;

enum DRI3_NAME =			"DRI3";
enum DRI3_MAJOR =			1;
enum DRI3_MINOR =			4;

enum DRI3NumberErrors =		0;
enum DRI3NumberEvents =		0;

enum X_DRI3QueryVersion =		0;
enum X_DRI3Open =			1;
enum X_DRI3PixmapFromBuffer =          2;
enum X_DRI3BufferFromPixmap =          3;
enum X_DRI3FenceFromFD =               4;
enum X_DRI3FDFromFence =               5;

/* v1.2 */
enum xDRI3GetSupportedModifiers =      6;
enum xDRI3PixmapFromBuffers =          7;
enum xDRI3BuffersFromPixmap =          8;

/* v1.3 */
enum xDRI3SetDRMDeviceInUse =  9;

/* v1.4 */
enum xDRI3ImportSyncobj =		10;
enum xDRI3FreeSyncobj =		11;

enum DRI3NumberRequests =		12;

alias DRI3Syncobj = CARD32;

struct xDRI3QueryVersionReq {
    CARD8 reqType;
    CARD8 dri3ReqType;
    CARD16 length;
    CARD32 majorVersion;
    CARD32 minorVersion;
}
enum sz_xDRI3QueryVersionReq =   12;

struct xDRI3QueryVersionReply {
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
enum sz_xDRI3QueryVersionReply =	32;

struct xDRI3OpenReq {
    CARD8 reqType;
    CARD8 dri3ReqType;
    CARD16 length;
    CARD32 drawable;
    CARD32 provider;
}
enum sz_xDRI3OpenReq =	12;

struct xDRI3OpenReply {
    BYTE type;   /* X_Reply */
    CARD8 nfd;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
    CARD32 pad7;
}
enum sz_xDRI3OpenReply =	32;

struct xDRI3PixmapFromBufferReq {
    CARD8 reqType;
    CARD8 dri3ReqType;
    CARD16 length;
    CARD32 pixmap;
    CARD32 drawable;
    CARD32 size;
    CARD16 width;
    CARD16 height;
    CARD16 stride;
    CARD8 depth;
    CARD8 bpp;
}

enum sz_xDRI3PixmapFromBufferReq =     24;

struct xDRI3BufferFromPixmapReq {
    CARD8 reqType;
    CARD8 dri3ReqType;
    CARD16 length;
    CARD32 pixmap;
}
enum sz_xDRI3BufferFromPixmapReq =     8;

struct xDRI3BufferFromPixmapReply {
    BYTE type;   /* X_Reply */
    CARD8 nfd;    /* Number of file descriptors returned (1) */
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 size;
    CARD16 width;
    CARD16 height;
    CARD16 stride;
    CARD8 depth;
    CARD8 bpp;
    CARD32 pad20;
    CARD32 pad24;
    CARD32 pad28;
}
enum sz_xDRI3BufferFromPixmapReply =   32;

struct xDRI3FenceFromFDReq {
    CARD8 reqType;
    CARD8 dri3ReqType;
    CARD16 length;
    CARD32 drawable;
    CARD32 fence;
    BOOL initially_triggered;
    CARD8 pad13;
    CARD16 pad14;
}

enum sz_xDRI3FenceFromFDReq =  16;

struct xDRI3FDFromFenceReq {
    CARD8 reqType;
    CARD8 dri3ReqType;
    CARD16 length;
    CARD32 drawable;
    CARD32 fence;
}

enum sz_xDRI3FDFromFenceReq =  12;

struct xDRI3FDFromFenceReply {
    BYTE type;   /* X_Reply */
    CARD8 nfd;    /* Number of file descriptors returned (1) */
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 pad08;
    CARD32 pad12;
    CARD32 pad16;
    CARD32 pad20;
    CARD32 pad24;
    CARD32 pad28;
}

enum sz_xDRI3FDFromFenceReply =   32;

/* v1.2 */

struct xDRI3GetSupportedModifiersReq {
    CARD8 reqType;
    CARD8 dri3ReqType;
    CARD16 length;
    CARD32 window;
    CARD8 depth;
    CARD8 bpp;
    CARD16 pad10;
}
enum sz_xDRI3GetSupportedModifiersReq =     12;

struct xDRI3GetSupportedModifiersReply {
    BYTE type;   /* X_Reply */
    CARD8 pad1;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 numWindowModifiers;
    CARD32 numScreenModifiers;
    CARD32 pad16;
    CARD32 pad20;
    CARD32 pad24;
    CARD32 pad28;
}
enum sz_xDRI3GetSupportedModifiersReply =   32;

struct xDRI3PixmapFromBuffersReq {
    CARD8 reqType;
    CARD8 dri3ReqType;
    CARD16 length;
    CARD32 pixmap;
    CARD32 window;
    CARD8 num_buffers; /* Number of file descriptors passed */
    CARD8 pad13;
    CARD16 pad14;
    CARD16 width;
    CARD16 height;
    CARD32 stride0;
    CARD32 offset0;
    CARD32 stride1;
    CARD32 offset1;
    CARD32 stride2;
    CARD32 offset2;
    CARD32 stride3;
    CARD32 offset3;
    CARD8 depth;
    CARD8 bpp;
    CARD16 pad54;
    CARD64 modifier;
}
enum sz_xDRI3PixmapFromBuffersReq = 64;

struct xDRI3BuffersFromPixmapReq {
    CARD8 reqType;
    CARD8 dri3ReqType;
    CARD16 length;
    CARD32 pixmap;
}
enum sz_xDRI3BuffersFromPixmapReq =     8;

struct xDRI3BuffersFromPixmapReply {
    BYTE type;   /* X_Reply */
    CARD8 nfd;    /* Number of file descriptors returned */
    CARD16 sequenceNumber;
    CARD32 length;
    CARD16 width;
    CARD16 height;
    CARD32 pad12;
    CARD64 modifier;
    CARD8 depth;
    CARD8 bpp;
    CARD16 pad26;
    CARD32 pad28;
}
enum sz_xDRI3BuffersFromPixmapReply =   32;

/* v1.3 */

struct xDRI3SetDRMDeviceInUseReq {
    CARD8 reqType;
    CARD8 dri3ReqType;
    CARD16 length;
    CARD32 window;
    CARD32 drmMajor;
    CARD32 drmMinor;
}
enum sz_xDRI3SetDRMDeviceInUseReq =    16;

/* v1.4 */
struct xDRI3ImportSyncobjReq {
    CARD8 reqType;
    CARD8 dri3ReqType;
    CARD16 length;
    DRI3Syncobj syncobj;
    CARD32 drawable;
}
enum sz_xDRI3ImportSyncobjReq = 12;

struct xDRI3FreeSyncobjReq {
    CARD8 reqType;
    CARD8 dri3ReqType;
    CARD16 length;
    DRI3Syncobj syncobj;
}
enum sz_xDRI3FreeSyncobjReq = 8;


