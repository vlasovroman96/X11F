module externs.X11.extensions.xf86dga1proto;
@nogc nothrow:
extern(C): __gshared:
/*

Copyright (c) 1995  Jon Tombs
Copyright (c) 1995  XFree86 Inc.

*/

 
public import externs.X11.Xmd;
public import externs.X11.Xdefs;
// public import externs.X11.extensions.xf86dga1const;

struct xXF86DGAQueryVersionReq {
    CARD8 reqType;		/* always DGAReqCode */
    CARD8 dgaReqType;		/* always X_DGAQueryVersion */
    CARD16 length;
}
enum sz_xXF86DGAQueryVersionReq =	4;

struct xXF86DGAQueryVersionReply {
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
enum sz_xXF86DGAQueryVersionReply =	32;

struct xXF86DGAGetVideoLLReq {
    CARD8 reqType;		/* always DGAReqCode */
    CARD8 dgaReqType;		/* always X_XF86DGAGetVideoLL */
    CARD16 length;
    CARD16 screen;
    CARD16 pad;
}
enum sz_xXF86DGAGetVideoLLReq =	8;

struct xXF86DGAInstallColormapReq {
    CARD8 reqType;
    CARD8 dgaReqType;
    CARD16 length;
    CARD16 screen;
    CARD16 pad2;
    CARD32 id;  /* colormap. */
}
enum sz_xXF86DGAInstallColormapReq =        12;


struct xXF86DGAGetVideoLLReply {
    BYTE type;
    BOOL pad1;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 offset;
    CARD32 width;
    CARD32 bank_size;
    CARD32 ram_size;
    CARD32 pad4;
    CARD32 pad5;
}
enum sz_xXF86DGAGetVideoLLReply =	32;

struct xXF86DGADirectVideoReq {
    CARD8 reqType;		/* always DGAReqCode */
    CARD8 dgaReqType;		/* always X_XF86DGADirectVideo */
    CARD16 length;
    CARD16 screen;
    CARD16 enable;
}
enum sz_xXF86DGADirectVideoReq =	8;


struct xXF86DGAGetViewPortSizeReq {
    CARD8 reqType;		/* always DGAReqCode */
    CARD8 dgaReqType;		/* always X_XF86DGAGetViewPort */
    CARD16 length;
    CARD16 screen;
    CARD16 pad;
}
enum sz_xXF86DGAGetViewPortSizeReq =	8;

struct xXF86DGAGetViewPortSizeReply {
    BYTE type;
    BOOL pad1;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 width;
    CARD32 height;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
}
enum sz_xXF86DGAGetViewPortSizeReply =	32;

struct xXF86DGASetViewPortReq {
    CARD8 reqType;		/* always DGAReqCode */
    CARD8 dgaReqType;		/* always X_XF86DGASetViewPort */
    CARD16 length;
    CARD16 screen;
    CARD16 pad;
    CARD32 x;
    CARD32 y;
}
enum sz_xXF86DGASetViewPortReq =	16;

struct xXF86DGAGetVidPageReq {
    CARD8 reqType;		/* always DGAReqCode */
    CARD8 dgaReqType;		/* always X_XF86DGAGetVidPage */
    CARD16 length;
    CARD16 screen;
    CARD16 pad;
}
enum sz_xXF86DGAGetVidPageReq =	8;

struct xXF86DGAGetVidPageReply {
    BYTE type;
    BOOL pad1;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 vpage;
    CARD32 pad;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
}
enum sz_xXF86DGAGetVidPageReply =	32;


struct xXF86DGASetVidPageReq {
    CARD8 reqType;		/* always DGAReqCode */
    CARD8 dgaReqType;		/* always X_XF86DGASetVidPage */
    CARD16 length;
    CARD16 screen;
    CARD16 vpage;
}
enum sz_xXF86DGASetVidPageReq =	8;


struct xXF86DGAQueryDirectVideoReq {
    CARD8 reqType;		/* always DGAReqCode */
    CARD8 dgaReqType;		/* always X_DGAQueryVersion */
    CARD16 length;
    CARD16 screen;
    CARD16 pad;
}
enum sz_xXF86DGAQueryDirectVideoReq =	8;

struct xXF86DGAQueryDirectVideoReply {
    BYTE type;
    BOOL pad1;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 flags;
    CARD32 pad;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
}
enum sz_xXF86DGAQueryDirectVideoReply = 32;


struct xXF86DGAViewPortChangedReq {
    CARD8 reqType;		/* always DGAReqCode */
    CARD8 dgaReqType;		/* always X_DGAQueryVersion */
    CARD16 length;
    CARD16 screen;
    CARD16 n;
}
enum sz_xXF86DGAViewPortChangedReq =	8;

struct xXF86DGAViewPortChangedReply {
    BYTE type;
    BOOL pad1;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 result;
    CARD32 pad;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
}
enum sz_xXF86DGAViewPortChangedReply = 32;

 /* _XF86DGAPROTO1_H_ */

