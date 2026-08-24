module externs.X11.extensions.xf86bigfproto;
@nogc nothrow:
extern(C): __gshared:
/*
 * Declarations of request structures for the BIGFONT extension.
 *
 * Copyright (c) 1999-2000  Bruno Haible
 * Copyright (c) 1999-2000  The XFree86 Project, Inc.
 */

/* THIS IS NOT AN X CONSORTIUM STANDARD */

 
public import externs.X11.extensions.xf86bigfont;
public import externs.X11.Xmd;
public import externs.X11.Xproto;

enum XF86BIGFONTNAME =			"XFree86-Bigfont";

enum XF86BIGFONT_MAJOR_VERSION =	1	/* current version numbers */;
enum XF86BIGFONT_MINOR_VERSION =	1;

struct xXF86BigfontQueryVersionReq {
    CARD8 reqType;		/* always XF86BigfontReqCode */
    CARD8 xf86bigfontReqType;	/* always X_XF86BigfontQueryVersion */
    CARD16 length;
}
enum sz_xXF86BigfontQueryVersionReq =	4;

struct xXF86BigfontQueryVersionReply {
    BYTE type;			/* X_Reply */
    CARD8 capabilities;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD16 majorVersion;		/* major version of XFree86-Bigfont */
    CARD16 minorVersion;		/* minor version of XFree86-Bigfont */
    CARD32 uid;
    CARD32 gid;
    CARD32 signature;
    CARD32 pad1;
    CARD32 pad2;
}
enum sz_xXF86BigfontQueryVersionReply = 32;

/* Bit masks that can be set in the capabilities */
enum XF86Bigfont_CAP_LocalShm = 1;

struct xXF86BigfontQueryFontReq {
    CARD8 reqType;		/* always XF86BigfontReqCode */
    CARD8 xf86bigfontReqType;	/* always X_XF86BigfontQueryFont */
    CARD16 length;
    CARD32 id;
    CARD32 flags;
}
enum sz_xXF86BigfontQueryFontReq =	12;

struct xXF86BigfontQueryFontReply {
    BYTE type;			/* X_Reply */
    CARD8 pad1;
    CARD16 sequenceNumber;
    CARD32 length;
    xCharInfo minBounds;
version (WORD64) {} else {
    CARD32 walign1;
}
    xCharInfo maxBounds;
version (WORD64) {} else {
    CARD32 walign2;
}
    CARD16 minCharOrByte2;
    CARD16 maxCharOrByte2;
    CARD16 defaultChar;
    CARD16 nFontProps;
    CARD8 drawDirection;
    CARD8 minByte1;
    CARD8 maxByte1;
    BOOL allCharsExist;
    INT16 fontAscent;
    INT16 fontDescent;
    CARD32 nCharInfos;
    CARD32 nUniqCharInfos;
    CARD32 shmid;
    CARD32 shmsegoffset;
    /* followed by nFontProps xFontProp structures */
    /* and if nCharInfos > 0 && shmid == -1,
       followed by nUniqCharInfos xCharInfo structures
       and then by nCharInfos CARD16 indices (each >= 0, < nUniqCharInfos)
       and then, if nCharInfos is odd, one more CARD16 for padding. */
}
enum sz_xXF86BigfontQueryFontReply =	72;

/* Bit masks that can be set in the flags */
enum XF86Bigfont_FLAGS_Shm = 1;

 /* _XF86BIGFPROTO_H_ */
