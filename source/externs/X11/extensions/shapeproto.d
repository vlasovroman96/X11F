module externs.X11.extensions.shapeproto;
@nogc nothrow:
extern(C): __gshared:
/************************************************************

Copyright 1989, 1998  The Open Group

Permission to use, copy, modify, distribute, and sell this software and its
documentation for any purpose is hereby granted without fee, provided that
the above copyright notice appear in all copies and that both that
copyright notice and this permission notice appear in supporting
documentation.

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
OPEN GROUP BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Except as contained in this notice, the name of The Open Group shall not be
used in advertising or otherwise to promote the sale, use or other dealings
in this Software without prior written authorization from The Open Group.

********************************************************/

 
public import externs.X11.extensions.shapeconst;
public import externs.X11.X;
public import externs.X11.Xmd;

/*
 * Protocol requests constants and alignment values
 * These would really be in SHAPE's X.h and Xproto.h equivalents
 */

alias Window = CARD32;
alias Time = CARD32;

enum X_ShapeQueryVersion =		0;
enum X_ShapeRectangles =		1;
enum X_ShapeMask =			2;
enum X_ShapeCombine =			3;
enum X_ShapeOffset =			4;
enum X_ShapeQueryExtents =		5;
enum X_ShapeSelectInput =		6;
enum X_ShapeInputSelected =		7;
enum X_ShapeGetRectangles =		8;

struct xShapeQueryVersionReq {
	CARD8 reqType;		/* always ShapeReqCode */
	CARD8 shapeReqType;		/* always X_ShapeQueryVersion */
	CARD16 length;
}
enum sz_xShapeQueryVersionReq =	4;

struct xShapeQueryVersionReply {
	BYTE type;			/* X_Reply */
	CARD8 unused;			/* not used */
	CARD16 sequenceNumber;
	CARD32 length;
	CARD16 majorVersion;		/* major version of SHAPE protocol */
	CARD16 minorVersion;		/* minor version of SHAPE protocol */
	CARD32 pad0;
	CARD32 pad1;
	CARD32 pad2;
	CARD32 pad3;
	CARD32 pad4;
}
enum sz_xShapeQueryVersionReply =	32;

struct xShapeRectanglesReq {
	CARD8 reqType;	/* always ShapeReqCode */
	CARD8 shapeReqType;	/* always X_ShapeRectangles */
	CARD16 length;
	CARD8 op;		/* Set, ... */
	CARD8 destKind;	/* ShapeBounding or ShapeClip */
	CARD8 ordering;	/* UnSorted, YSorted, YXSorted, YXBanded */
	CARD8 pad0;		/* not used */
	Window dest;
	INT16 xOff;
	INT16 yOff;
}		/* followed by xRects */
enum sz_xShapeRectanglesReq =	16;

struct xShapeMaskReq {
	CARD8 reqType;	/* always ShapeReqCode */
	CARD8 shapeReqType;	/* always X_ShapeMask */
	CARD16 length;

	CARD8 op;		/* Set, ... */
	CARD8 destKind;	/* ShapeBounding or ShapeClip */
	CARD16 junk;		/* not used */

	Window dest;
	INT16 xOff;
	INT16 yOff;
	CARD32 src;		/* 1 bit pixmap */
}
enum sz_xShapeMaskReq =	20;

struct xShapeCombineReq {
	CARD8 reqType;	/* always ShapeReqCode */
	CARD8 shapeReqType;	/* always X_ShapeCombine */
	CARD16 length;
	CARD8 op;		/* Set, ... */
	CARD8 destKind;	/* ShapeBounding or ShapeClip */
	CARD8 srcKind;	/* ShapeBounding or ShapeClip */
	CARD8 junk;		/* not used */
	Window dest;
	INT16 xOff;
	INT16 yOff;
	Window src;
}
enum sz_xShapeCombineReq =	20;

struct xShapeOffsetReq {
	CARD8 reqType;	/* always ShapeReqCode */
	CARD8 shapeReqType;	/* always X_ShapeOffset */
	CARD16 length;
	CARD8 destKind;	/* ShapeBounding or ShapeClip */
	CARD8 junk1;		/* not used */
	CARD16 junk2;		/* not used */
	Window dest;
	INT16 xOff;
	INT16 yOff;
}
enum sz_xShapeOffsetReq =	16;

struct xShapeQueryExtentsReq {
	CARD8 reqType;	/* always ShapeReqCode */
	CARD8 shapeReqType;	/* always X_ShapeQueryExtents */
	CARD16 length;
	Window window;
}
enum sz_xShapeQueryExtentsReq =	8;

struct xShapeQueryExtentsReply {
	BYTE type;			/* X_Reply */
	CARD8 unused;			/* not used */
	CARD16 sequenceNumber;
	CARD32 length;			/* 0 */
	CARD8 boundingShaped;		/* window has bounding shape */
	CARD8 clipShaped;		/* window has clip shape */
	CARD16 unused1;
	INT16 xBoundingShape;		/* extents of bounding shape */
	INT16 yBoundingShape;
	CARD16 widthBoundingShape;
	CARD16 heightBoundingShape;
	INT16 xClipShape;		/* extents of clip shape */
	INT16 yClipShape;
	CARD16 widthClipShape;
	CARD16 heightClipShape;
	CARD32 pad1;
}
enum sz_xShapeQueryExtentsReply =	32;

struct xShapeSelectInputReq {
	CARD8 reqType;	/* always ShapeReqCode */
	CARD8 shapeReqType;	/* always X_ShapeSelectInput */
	CARD16 length;
	Window window;
	BYTE enable;		/* xTrue -> send events */
	BYTE pad1;
	CARD16 pad2;
}
enum sz_xShapeSelectInputReq =	12;

struct xShapeNotifyEvent {
	BYTE type;		/* always eventBase + ShapeNotify */
	BYTE kind;		/* either ShapeBounding or ShapeClip */
	CARD16 sequenceNumber;
	Window window;
	INT16 x;
	INT16 y;		/* extents of new shape */
	CARD16 width;
	CARD16 height;
	Time time;		/* time of change */
	BYTE shaped;		/* set when a shape actual exists */
	BYTE pad0;
	CARD16 pad1;
	CARD32 pad2;
	CARD32 pad3;
}
enum sz_xShapeNotifyEvent =	32;

struct xShapeInputSelectedReq {
	CARD8 reqType;	/* always ShapeReqCode */
	CARD8 shapeReqType;	/* always X_ShapeInputSelected */
	CARD16 length;
	Window window;
}
enum sz_xShapeInputSelectedReq = 8;

struct xShapeInputSelectedReply {
	BYTE type;			/* X_Reply */
	CARD8 enabled;		/* current status */
	CARD16 sequenceNumber;
	CARD32 length;		/* 0 */
	CARD32 pad1;		/* unused */
	CARD32 pad2;
	CARD32 pad3;
	CARD32 pad4;
	CARD32 pad5;
	CARD32 pad6;
}
enum sz_xShapeInputSelectedReply =	32;

struct xShapeGetRectanglesReq {
    CARD8 reqType;		/* always ShapeReqCode */
    CARD8 shapeReqType;	/* always X_ShapeGetRectangles */
    CARD16 length;
    Window window;
    CARD8 kind;		/* ShapeBounding or ShapeClip */
    CARD8 junk1;
    CARD16 junk2;
}
enum sz_xShapeGetRectanglesReq =	12;

struct xShapeGetRectanglesReply {
	BYTE type;			/* X_Reply */
	CARD8 ordering;	/* UnSorted, YSorted, YXSorted, YXBanded */
	CARD16 sequenceNumber;
	CARD32 length;		/* not zero */
	CARD32 nrects;		/* number of rectangles */
	CARD32 pad1;
	CARD32 pad2;
	CARD32 pad3;
	CARD32 pad4;
	CARD32 pad5;
}		/* followed by xRectangles */
enum sz_xShapeGetRectanglesReply = 32;

 /* _SHAPEPROTO_H_ */
