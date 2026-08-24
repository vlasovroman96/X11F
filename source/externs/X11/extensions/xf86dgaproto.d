module externs.X11.extensions.xf86dgaproto;
@nogc nothrow:
extern(C): __gshared:
/*

Copyright (c) 1995  Jon Tombs
Copyright (c) 1995  XFree86 Inc.

*/

 
public import externs.X11.extensions.xf86dga1proto;
public import externs.X11.extensions.xf86dgaconst;

enum XF86DGANAME = "XFree86-DGA";

enum XDGA_MAJOR_VERSION =	2	/* current version numbers */;
enum XDGA_MINOR_VERSION =	0;


struct xXDGAQueryVersionReq {
    CARD8 reqType;		/* always DGAReqCode */
    CARD8 dgaReqType;		/* always X_DGAQueryVersion */
    CARD16 length;
}
enum sz_xXDGAQueryVersionReq =		4;

struct xXDGAQueryVersionReply {
    BYTE type;			/* X_Reply */
    BOOL pad1;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD16 majorVersion;		/* major version of DGA protocol */
    CARD16 minorVersion;		/* minor version of DGA protocol */
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
}
enum sz_xXDGAQueryVersionReply =	32;

struct xXDGAQueryModesReq {
    CARD8 reqType;
    CARD8 dgaReqType;
    CARD16 length;
    CARD32 screen;
}
enum sz_xXDGAQueryModesReq =		8;

struct xXDGAQueryModesReply {
    BYTE type;			/* X_Reply */
    BOOL pad1;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 number;			/* number of modes available */
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
}
enum sz_xXDGAQueryModesReply =	32;


struct xXDGASetModeReq {
    CARD8 reqType;
    CARD8 dgaReqType;
    CARD16 length;
    CARD32 screen;
    CARD32 mode;			/* mode number to init */
    CARD32 pid;			/* Pixmap descriptor */
}
enum sz_xXDGASetModeReq =		16;

struct xXDGASetModeReply {
    BYTE type;			/* X_Reply */
    BOOL pad1;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 offset;			/* offset into framebuffer map */
    CARD32 flags;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
}
enum sz_xXDGASetModeReply =	32;

struct xXDGAModeInfo {
   CARD8 byte_order;
   CARD8 depth;
   CARD16 num;
   CARD16 bpp;
   CARD16 name_size;
   CARD32 vsync_num;
   CARD32 vsync_den;
   CARD32 flags;
   CARD16 image_width;
   CARD16 image_height;
   CARD16 pixmap_width;
   CARD16 pixmap_height;
   CARD32 bytes_per_scanline;
   CARD32 red_mask;
   CARD32 green_mask;
   CARD32 blue_mask;
   CARD16 visual_class;
   CARD16 pad1;
   CARD16 viewport_width;
   CARD16 viewport_height;
   CARD16 viewport_xstep;
   CARD16 viewport_ystep;
   CARD16 viewport_xmax;
   CARD16 viewport_ymax;
   CARD32 viewport_flags;
   CARD32 reserved1;
   CARD32 reserved2;
}
enum sz_xXDGAModeInfo = 72;

struct xXDGAOpenFramebufferReq {
    CARD8 reqType;
    CARD8 dgaReqType;
    CARD16 length;
    CARD32 screen;
}
enum sz_xXDGAOpenFramebufferReq =	8;

struct xXDGAOpenFramebufferReply {
    BYTE type;			/* X_Reply */
    BOOL pad1;
    CARD16 sequenceNumber;
    CARD32 length;			/* device name size if there is one */
    CARD32 mem1;			/* physical memory */
    CARD32 mem2;			/* spillover for _alpha_ */
    CARD32 size;			/* size of map in bytes */
    CARD32 offset;			/* optional offset into device */
    CARD32 extra;			/* extra info associated with the map */
    CARD32 pad2;
}
enum sz_xXDGAOpenFramebufferReply =	32;


struct xXDGACloseFramebufferReq {
    CARD8 reqType;
    CARD8 dgaReqType;
    CARD16 length;
    CARD32 screen;
}
enum sz_xXDGACloseFramebufferReq =	8;


struct xXDGASetViewportReq {
    CARD8 reqType;
    CARD8 dgaReqType;
    CARD16 length;
    CARD32 screen;
    CARD16 x;
    CARD16 y;
    CARD32 flags;
}
enum sz_xXDGASetViewportReq =	16;


struct xXDGAInstallColormapReq {
    CARD8 reqType;
    CARD8 dgaReqType;
    CARD16 length;
    CARD32 screen;
    CARD32 cmap;
}
enum sz_xXDGAInstallColormapReq =	12;

struct xXDGASelectInputReq {
    CARD8 reqType;
    CARD8 dgaReqType;
    CARD16 length;
    CARD32 screen;
    CARD32 mask;
}
enum sz_xXDGASelectInputReq =	12;

struct xXDGAFillRectangleReq {
    CARD8 reqType;
    CARD8 dgaReqType;
    CARD16 length;
    CARD32 screen;
    CARD16 x;
    CARD16 y;
    CARD16 width;
    CARD16 height;
    CARD32 color;
}
enum sz_xXDGAFillRectangleReq =	20;


struct xXDGACopyAreaReq {
    CARD8 reqType;
    CARD8 dgaReqType;
    CARD16 length;
    CARD32 screen;
    CARD16 srcx;
    CARD16 srcy;
    CARD16 width;
    CARD16 height;
    CARD16 dstx;
    CARD16 dsty;
}
enum sz_xXDGACopyAreaReq =	20;

struct xXDGACopyTransparentAreaReq {
    CARD8 reqType;
    CARD8 dgaReqType;
    CARD16 length;
    CARD32 screen;
    CARD16 srcx;
    CARD16 srcy;
    CARD16 width;
    CARD16 height;
    CARD16 dstx;
    CARD16 dsty;
    CARD32 key;
}
enum sz_xXDGACopyTransparentAreaReq =	24;


struct xXDGAGetViewportStatusReq {
    CARD8 reqType;
    CARD8 dgaReqType;
    CARD16 length;
    CARD32 screen;
}
enum sz_xXDGAGetViewportStatusReq =	8;

struct xXDGAGetViewportStatusReply {
    BYTE type;
    BOOL pad1;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 status;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
}
enum sz_xXDGAGetViewportStatusReply =	32;

struct xXDGASyncReq {
    CARD8 reqType;
    CARD8 dgaReqType;
    CARD16 length;
    CARD32 screen;
}
enum sz_xXDGASyncReq =	8;

struct xXDGASyncReply {
    BYTE type;
    BOOL pad1;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
    CARD32 pad7;
}
enum sz_xXDGASyncReply =	32;

struct xXDGASetClientVersionReq {
    CARD8 reqType;
    CARD8 dgaReqType;
    CARD16 length;
    CARD16 major;
    CARD16 minor;
}
enum sz_xXDGASetClientVersionReq =	8;


struct xXDGAChangePixmapModeReq {
    CARD8 reqType;
    CARD8 dgaReqType;
    CARD16 length;
    CARD32 screen;
    CARD16 x;
    CARD16 y;
    CARD32 flags;
}
enum sz_xXDGAChangePixmapModeReq =	16;

struct xXDGAChangePixmapModeReply {
    BYTE type;
    BOOL pad1;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD16 x;
    CARD16 y;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
    CARD32 pad7;
}
enum sz_xXDGAChangePixmapModeReply =	32;

struct xXDGACreateColormapReq {
    CARD8 reqType;
    CARD8 dgaReqType;
    CARD16 length;
    CARD32 screen;
    CARD32 id;
    CARD32 mode;
    CARD8 alloc;
    CARD8 pad1;
    CARD16 pad2;
}
enum sz_xXDGACreateColormapReq =	20;


struct dgaEvent {
  union _U {
    struct _U {
      BYTE type;
      BYTE detail;
      CARD16 sequenceNumber;
    }_U u;
    struct _Event {
      CARD32 pad0;
      CARD32 time;
      INT16 dx;
      INT16 dy;
      INT16 screen;
      CARD16 state;
      CARD32 pad1;
      CARD32 pad2;
      CARD32 pad3;
      CARD32 pad4;
    }_Event event;
  }_U u;
}


 /* _XF86DGAPROTO_H_ */

