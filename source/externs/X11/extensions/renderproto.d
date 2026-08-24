module externs.X11.extensions.renderproto;
@nogc nothrow:
extern(C): __gshared:
/*
 * Copyright © 2000 SuSE, Inc.
 *
 * Permission to use, copy, modify, distribute, and sell this software and its
 * documentation for any purpose is hereby granted without fee, provided that
 * the above copyright notice appear in all copies and that both that
 * copyright notice and this permission notice appear in supporting
 * documentation, and that the name of SuSE not be used in advertising or
 * publicity pertaining to distribution of the software without specific,
 * written prior permission.  SuSE makes no representations about the
 * suitability of this software for any purpose.  It is provided "as is"
 * without express or implied warranty.
 *
 * SuSE DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING ALL
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT SHALL SuSE
 * BE LIABLE FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION
 * OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN
 * CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *
 * Author:  Keith Packard, SuSE, Inc.
 */

 
public import externs.X11.Xmd;
public import externs.X11.extensions.render_;

alias Window = CARD32;
alias Drawable = CARD32;
alias Font = CARD32;
alias Pixmap = CARD32;
alias Cursor = CARD32;
alias Colormap = CARD32;
alias GContext = CARD32;
alias Atom = CARD32;
alias VisualID = CARD32;
alias Time = CARD32;
alias KeyCode = CARD8;
alias KeySym = CARD32;

alias Picture =	    CARD32;
alias PictFormat =  CARD32;
alias Fixed =	    INT32;
alias Glyphset =    CARD32;

/*
 * data structures
 */

struct xDirectFormat {
    CARD16 red;
    CARD16 redMask;
    CARD16 green;
    CARD16 greenMask;
    CARD16 blue;
    CARD16 blueMask;
    CARD16 alpha;
    CARD16 alphaMask;
}

enum sz_xDirectFormat =    16;

struct xPictFormInfo {
    PictFormat id;
    CARD8 type;
    CARD8 depth;
    CARD16 pad1;
    xDirectFormat direct;
    Colormap colormap;
}

enum sz_xPictFormInfo =    28;

struct xPictVisual {
    VisualID visual;
    PictFormat format;
}

enum sz_xPictVisual =	    8;

struct xPictDepth {
    CARD8 depth;
    CARD8 pad1;
    CARD16 nPictVisuals;
    CARD32 pad2;
}

enum sz_xPictDepth =	8;

struct xPictScreen {
    CARD32 nDepth;
    PictFormat fallback;
}

enum sz_xPictScreen =	8;

struct xIndexValue {
    CARD32 pixel;
    CARD16 red;
    CARD16 green;
    CARD16 blue;
    CARD16 alpha;
}

enum sz_xIndexValue =	12;

struct xRenderColor {
    CARD16 red;
    CARD16 green;
    CARD16 blue;
    CARD16 alpha;
}

enum sz_xRenderColor =	8;

struct xPointFixed {
    Fixed x;
    Fixed y;
}

enum sz_xPointFixed =	8;

struct xLineFixed {
    xPointFixed p1;
    xPointFixed p2;
}

enum sz_xLineFixed =	16;

struct xTriangle {
    xPointFixed p1, p2, p3;
}

enum sz_xTriangle =	24;

struct xTrapezoid {
    Fixed top;
    Fixed bottom;
    xLineFixed left;
    xLineFixed right;
}

enum sz_xTrapezoid =	40;

struct xGlyphInfo {
    CARD16 width;
    CARD16 height;
    INT16 x;
    INT16 y;
    INT16 xOff;
    INT16 yOff;
}

enum sz_xGlyphInfo =	12;

struct xGlyphElt {
    CARD8 len;
    CARD8 pad1;
    CARD16 pad2;
    INT16 deltax;
    INT16 deltay;
}

enum sz_xGlyphElt =	8;

struct xSpanFix {
    Fixed l, r, y;
}

enum sz_xSpanFix =	12;

struct xTrap {
    xSpanFix top, bot;
}

enum sz_xTrap =	24;

/*
 * requests and replies
 */
struct xRenderQueryVersionReq {
    CARD8 reqType;
    CARD8 renderReqType;
    CARD16 length;
    CARD32 majorVersion;
    CARD32 minorVersion;
}

enum sz_xRenderQueryVersionReq =   12;

struct xRenderQueryVersionReply {
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

enum sz_xRenderQueryVersionReply =	32;

struct xRenderQueryPictFormatsReq {
    CARD8 reqType;
    CARD8 renderReqType;
    CARD16 length;
}

enum sz_xRenderQueryPictFormatsReq =	4;

struct xRenderQueryPictFormatsReply {
    BYTE type;   /* X_Reply */
    BYTE pad1;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 numFormats;
    CARD32 numScreens;
    CARD32 numDepths;
    CARD32 numVisuals;
    CARD32 numSubpixel;	    /* Version 0.6 */
    CARD32 pad5;
}

enum sz_xRenderQueryPictFormatsReply =	32;

struct xRenderQueryPictIndexValuesReq {
    CARD8 reqType;
    CARD8 renderReqType;
    CARD16 length;
    PictFormat format;
}

enum sz_xRenderQueryPictIndexValuesReq =   8;

struct xRenderQueryPictIndexValuesReply {
    BYTE type;   /* X_Reply */
    BYTE pad1;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 numIndexValues;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
}

enum sz_xRenderQueryPictIndexValuesReply = 32;

struct xRenderCreatePictureReq {
    CARD8 reqType;
    CARD8 renderReqType;
    CARD16 length;
    Picture pid;
    Drawable drawable;
    PictFormat format;
    CARD32 mask;
}

enum sz_xRenderCreatePictureReq =	    20;

struct xRenderChangePictureReq {
    CARD8 reqType;
    CARD8 renderReqType;
    CARD16 length;
    Picture picture;
    CARD32 mask;
}

enum sz_xRenderChangePictureReq =	    12;

struct xRenderSetPictureClipRectanglesReq {
    CARD8 reqType;
    CARD8 renderReqType;
    CARD16 length;
    Picture picture;
    INT16 xOrigin;
    INT16 yOrigin;
}

enum sz_xRenderSetPictureClipRectanglesReq =	    12;

struct xRenderFreePictureReq {
    CARD8 reqType;
    CARD8 renderReqType;
    CARD16 length;
    Picture picture;
}

enum sz_xRenderFreePictureReq =	    8;

struct xRenderCompositeReq {
    CARD8 reqType;
    CARD8 renderReqType;
    CARD16 length;
    CARD8 op;
    CARD8 pad1;
    CARD16 pad2;
    Picture src;
    Picture mask;
    Picture dst;
    INT16 xSrc;
    INT16 ySrc;
    INT16 xMask;
    INT16 yMask;
    INT16 xDst;
    INT16 yDst;
    CARD16 width;
    CARD16 height;
}

enum sz_xRenderCompositeReq =		    36;

struct xRenderScaleReq {
    CARD8 reqType;
    CARD8 renderReqType;
    CARD16 length;
    Picture src;
    Picture dst;
    CARD32 colorScale;
    CARD32 alphaScale;
    INT16 xSrc;
    INT16 ySrc;
    INT16 xDst;
    INT16 yDst;
    CARD16 width;
    CARD16 height;
}

enum sz_xRenderScaleReq =			    32;

struct xRenderTrapezoidsReq {
    CARD8 reqType;
    CARD8 renderReqType;
    CARD16 length;
    CARD8 op;
    CARD8 pad1;
    CARD16 pad2;
    Picture src;
    Picture dst;
    PictFormat maskFormat;
    INT16 xSrc;
    INT16 ySrc;
}

enum sz_xRenderTrapezoidsReq =			    24;

struct xRenderTrianglesReq {
    CARD8 reqType;
    CARD8 renderReqType;
    CARD16 length;
    CARD8 op;
    CARD8 pad1;
    CARD16 pad2;
    Picture src;
    Picture dst;
    PictFormat maskFormat;
    INT16 xSrc;
    INT16 ySrc;
}

enum sz_xRenderTrianglesReq =			    24;

struct xRenderTriStripReq {
    CARD8 reqType;
    CARD8 renderReqType;
    CARD16 length;
    CARD8 op;
    CARD8 pad1;
    CARD16 pad2;
    Picture src;
    Picture dst;
    PictFormat maskFormat;
    INT16 xSrc;
    INT16 ySrc;
}

enum sz_xRenderTriStripReq =			    24;

struct xRenderTriFanReq {
    CARD8 reqType;
    CARD8 renderReqType;
    CARD16 length;
    CARD8 op;
    CARD8 pad1;
    CARD16 pad2;
    Picture src;
    Picture dst;
    PictFormat maskFormat;
    INT16 xSrc;
    INT16 ySrc;
}

enum sz_xRenderTriFanReq =			    24;

struct xRenderCreateGlyphSetReq {
    CARD8 reqType;
    CARD8 renderReqType;
    CARD16 length;
    Glyphset gsid;
    PictFormat format;
}

enum sz_xRenderCreateGlyphSetReq =		    12;

struct xRenderReferenceGlyphSetReq {
    CARD8 reqType;
    CARD8 renderReqType;
    CARD16 length;
    Glyphset gsid;
    Glyphset existing;
}

enum sz_xRenderReferenceGlyphSetReq =		    24;

struct xRenderFreeGlyphSetReq {
    CARD8 reqType;
    CARD8 renderReqType;
    CARD16 length;
    Glyphset glyphset;
}

enum sz_xRenderFreeGlyphSetReq =		    8;

struct xRenderAddGlyphsReq {
    CARD8 reqType;
    CARD8 renderReqType;
    CARD16 length;
    Glyphset glyphset;
    CARD32 nglyphs;
}

enum sz_xRenderAddGlyphsReq =			    12;

struct xRenderFreeGlyphsReq {
    CARD8 reqType;
    CARD8 renderReqType;
    CARD16 length;
    Glyphset glyphset;
}

enum sz_xRenderFreeGlyphsReq =			    8;

struct _XRenderCompositeGlyphsReq {
    CARD8 reqType;
    CARD8 renderReqType;
    CARD16 length;
    CARD8 op;
    CARD8 pad1;
    CARD16 pad2;
    Picture src;
    Picture dst;
    PictFormat maskFormat;
    Glyphset glyphset;
    INT16 xSrc;
    INT16 ySrc;
}alias xRenderCompositeGlyphsReq = _XRenderCompositeGlyphsReq;
alias xRenderCompositeGlyphs8Req = xRenderCompositeGlyphsReq;
alias xRenderCompositeGlyphs16Req = xRenderCompositeGlyphsReq;
alias xRenderCompositeGlyphs32Req = xRenderCompositeGlyphsReq;

enum sz_xRenderCompositeGlyphs8Req =		    28;
enum sz_xRenderCompositeGlyphs16Req =		    28;
enum sz_xRenderCompositeGlyphs32Req =		    28;

/* 0.1 and higher */

struct xRenderFillRectanglesReq {
    CARD8 reqType;
    CARD8 renderReqType;
    CARD16 length;
    CARD8 op;
    CARD8 pad1;
    CARD16 pad2;
    Picture dst;
    xRenderColor color;
}

enum sz_xRenderFillRectanglesReq =		    20;

/* 0.5 and higher */

struct xRenderCreateCursorReq {
    CARD8 reqType;
    CARD8 renderReqType;
    CARD16 length;
    Cursor cid;
    Picture src;
    CARD16 x;
    CARD16 y;
}

enum sz_xRenderCreateCursorReq =		    16;

/* 0.6 and higher */

/*
 * This can't use an array because 32-bit values may be in bitfields
 */
struct xRenderTransform {
    Fixed matrix11;
    Fixed matrix12;
    Fixed matrix13;
    Fixed matrix21;
    Fixed matrix22;
    Fixed matrix23;
    Fixed matrix31;
    Fixed matrix32;
    Fixed matrix33;
}

enum sz_xRenderTransform = 36;

struct xRenderSetPictureTransformReq {
    CARD8 reqType;
    CARD8 renderReqType;
    CARD16 length;
    Picture picture;
    xRenderTransform transform;
}

enum sz_xRenderSetPictureTransformReq =	    44;

struct xRenderQueryFiltersReq {
    CARD8 reqType;
    CARD8 renderReqType;
    CARD16 length;
    Drawable drawable;
}

enum sz_xRenderQueryFiltersReq =		    8;

struct xRenderQueryFiltersReply {
    BYTE type;   /* X_Reply */
    BYTE pad1;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 numAliases;	/* LISTofCARD16 */
    CARD32 numFilters;	/* LISTofSTRING8 */
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
}

enum sz_xRenderQueryFiltersReply =		    32;

struct xRenderSetPictureFilterReq {
    CARD8 reqType;
    CARD8 renderReqType;
    CARD16 length;
    Picture picture;
    CARD16 nbytes; /* number of bytes in name */
    CARD16 pad;
}

enum sz_xRenderSetPictureFilterReq =		    12;

/* 0.8 and higher */

struct xAnimCursorElt {
    Cursor cursor;
    CARD32 delay;
}

enum sz_xAnimCursorElt =			    8;

struct xRenderCreateAnimCursorReq {
    CARD8 reqType;
    CARD8 renderReqType;
    CARD16 length;
    Cursor cid;
}

enum sz_xRenderCreateAnimCursorReq =		    8;

/* 0.9 and higher */

struct xRenderAddTrapsReq {
    CARD8 reqType;
    CARD8 renderReqType;
    CARD16 length;
    Picture picture;
    INT16 xOff;
    INT16 yOff;
}

enum sz_xRenderAddTrapsReq =			    12;

/* 0.10 and higher */

struct xRenderCreateSolidFillReq {
    CARD8 reqType;
    CARD8 renderReqType;
    CARD16 length;
    Picture pid;
    xRenderColor color;
}

enum sz_xRenderCreateSolidFillReq =                 16;

struct xRenderCreateLinearGradientReq {
    CARD8 reqType;
    CARD8 renderReqType;
    CARD16 length;
    Picture pid;
    xPointFixed p1;
    xPointFixed p2;
    CARD32 nStops;
}

enum sz_xRenderCreateLinearGradientReq =                 28;

struct xRenderCreateRadialGradientReq {
    CARD8 reqType;
    CARD8 renderReqType;
    CARD16 length;
    Picture pid;
    xPointFixed inner;
    xPointFixed outer;
    Fixed inner_radius;
    Fixed outer_radius;
    CARD32 nStops;
}

enum sz_xRenderCreateRadialGradientReq =                 36;

struct xRenderCreateConicalGradientReq {
    CARD8 reqType;
    CARD8 renderReqType;
    CARD16 length;
    Picture pid;
    xPointFixed center;
    Fixed angle; /* in degrees */
    CARD32 nStops;
}

enum sz_xRenderCreateConicalGradientReq =                 24;

 /* _XRENDERP_H_ */
