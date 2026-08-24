module externs.X11.Xproto;
@nogc nothrow:
extern(C): __gshared:

private template HasVersion(string versionId) {
	mixin("version("~versionId~") {enum HasVersion = true;} else {enum HasVersion = false;}");
}
/* Definitions for the X window system used by server and c bindings */

/*
 * This packet-construction scheme makes the following assumptions:
 *
 * 1. The compiler is able
 * to generate code which addresses one- and two-byte quantities.
 * In the worst case, this would be done with bit-fields.  If bit-fields
 * are used it may be necessary to reorder the request fields in this file,
 * depending on the order in which the machine assigns bit fields to
 * machine words.  There may also be a problem with sign extension,
 * as K+R specify that bitfields are always unsigned.
 *
 * 2. 2- and 4-byte fields in packet structures must be ordered by hand
 * such that they are naturally-aligned, so that no compiler will ever
 * insert padding bytes.
 *
 * 3. All packets are hand-padded to a multiple of 4 bytes, for
 * the same reason.
 */

 
/***********************************************************

Copyright 1987, 1998  The Open Group

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


Copyright 1987 by Digital Equipment Corporation, Maynard, Massachusetts.

                        All Rights Reserved

Permission to use, copy, modify, and distribute this software and its
documentation for any purpose and without fee is hereby granted,
provided that the above copyright notice appear in all copies and that
both that copyright notice and this permission notice appear in
supporting documentation, and that the name of Digital not be
used in advertising or publicity pertaining to distribution of the
software without specific, written prior permission.

DIGITAL DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING
ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT SHALL
DIGITAL BE LIABLE FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR
ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS,
WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION,
ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
SOFTWARE.

******************************************************************/

import externs.X11.Xmd;
import externs.X11.Xprotostr;

/*
 * Define constants for the sizes of the network packets.  The sz_ prefix is
 * used instead of something more descriptive so that the symbols are no more
 * than 32 characters in length (which causes problems for some compilers).
 */
enum sz_xSegment = 8;
enum sz_xPoint = 4;
enum sz_xRectangle = 8;
enum sz_xArc = 12;
enum sz_xConnClientPrefix = 12;
enum sz_xConnSetupPrefix = 8;
enum sz_xConnSetup = 32;
enum sz_xPixmapFormat = 8;
enum sz_xDepth = 8;
enum sz_xVisualType = 24;
enum sz_xWindowRoot = 40;
enum sz_xTimecoord = 8;
enum sz_xHostEntry = 4;
enum sz_xCharInfo = 12;
enum sz_xFontProp = 8;
enum sz_xTextElt = 2;
enum sz_xColorItem = 12;
enum sz_xrgb = 8;
enum sz_xGenericReply = 32;
enum sz_xGetWindowAttributesReply = 44;
enum sz_xGetGeometryReply = 32;
enum sz_xQueryTreeReply = 32;
enum sz_xInternAtomReply = 32;
enum sz_xGetAtomNameReply = 32;
enum sz_xGetPropertyReply = 32;
enum sz_xListPropertiesReply = 32;
enum sz_xGetSelectionOwnerReply = 32;
enum sz_xGrabPointerReply = 32;
enum sz_xQueryPointerReply = 32;
enum sz_xGetMotionEventsReply = 32;
enum sz_xTranslateCoordsReply = 32;
enum sz_xGetInputFocusReply = 32;
enum sz_xQueryKeymapReply = 40;
enum sz_xQueryFontReply = 60;
enum sz_xQueryTextExtentsReply = 32;
enum sz_xListFontsReply = 32;
enum sz_xGetFontPathReply = 32;
enum sz_xGetImageReply = 32;
enum sz_xListInstalledColormapsReply = 32;
enum sz_xAllocColorReply = 32;
enum sz_xAllocNamedColorReply = 32;
enum sz_xAllocColorCellsReply = 32;
enum sz_xAllocColorPlanesReply = 32;
enum sz_xQueryColorsReply = 32;
enum sz_xLookupColorReply = 32;
enum sz_xQueryBestSizeReply = 32;
enum sz_xQueryExtensionReply = 32;
enum sz_xListExtensionsReply = 32;
enum sz_xSetMappingReply = 32;
enum sz_xGetKeyboardControlReply = 52;
enum sz_xGetPointerControlReply = 32;
enum sz_xGetScreenSaverReply = 32;
enum sz_xListHostsReply = 32;
enum sz_xSetModifierMappingReply = 32;
enum sz_xError = 32;
enum sz_xEvent = 32;
enum sz_xKeymapEvent = 32;
enum sz_xReq = 4;
enum sz_xResourceReq = 8;
enum sz_xCreateWindowReq = 32;
enum sz_xChangeWindowAttributesReq = 12;
enum sz_xChangeSaveSetReq = 8;
enum sz_xReparentWindowReq = 16;
enum sz_xConfigureWindowReq = 12;
enum sz_xCirculateWindowReq = 8;
enum sz_xInternAtomReq = 8;
enum sz_xChangePropertyReq = 24;
enum sz_xDeletePropertyReq = 12;
enum sz_xGetPropertyReq = 24;
enum sz_xSetSelectionOwnerReq = 16;
enum sz_xConvertSelectionReq = 24;
enum sz_xSendEventReq = 44;
enum sz_xGrabPointerReq = 24;
enum sz_xGrabButtonReq = 24;
enum sz_xUngrabButtonReq = 12;
enum sz_xChangeActivePointerGrabReq = 16;
enum sz_xGrabKeyboardReq = 16;
enum sz_xGrabKeyReq = 16;
enum sz_xUngrabKeyReq = 12;
enum sz_xAllowEventsReq = 8;
enum sz_xGetMotionEventsReq = 16;
enum sz_xTranslateCoordsReq = 16;
enum sz_xWarpPointerReq = 24;
enum sz_xSetInputFocusReq = 12;
enum sz_xOpenFontReq = 12;
enum sz_xQueryTextExtentsReq = 8;
enum sz_xListFontsReq = 8;
enum sz_xSetFontPathReq = 8;
enum sz_xCreatePixmapReq = 16;
enum sz_xCreateGCReq = 16;
enum sz_xChangeGCReq = 12;
enum sz_xCopyGCReq = 16;
enum sz_xSetDashesReq = 12;
enum sz_xSetClipRectanglesReq = 12;
enum sz_xCopyAreaReq = 28;
enum sz_xCopyPlaneReq = 32;
enum sz_xPolyPointReq = 12;
enum sz_xPolySegmentReq = 12;
enum sz_xFillPolyReq = 16;
enum sz_xPutImageReq = 24;
enum sz_xGetImageReq = 20;
enum sz_xPolyTextReq = 16;
enum sz_xImageTextReq = 16;
enum sz_xCreateColormapReq = 16;
enum sz_xCopyColormapAndFreeReq = 12;
enum sz_xAllocColorReq = 16;
enum sz_xAllocNamedColorReq = 12;
enum sz_xAllocColorCellsReq = 12;
enum sz_xAllocColorPlanesReq = 16;
enum sz_xFreeColorsReq = 12;
enum sz_xStoreColorsReq = 8;
enum sz_xStoreNamedColorReq = 16;
enum sz_xQueryColorsReq = 8;
enum sz_xLookupColorReq = 12;
enum sz_xCreateCursorReq = 32;
enum sz_xCreateGlyphCursorReq = 32;
enum sz_xRecolorCursorReq = 20;
enum sz_xQueryBestSizeReq = 12;
enum sz_xQueryExtensionReq = 8;
enum sz_xChangeKeyboardControlReq = 8;
enum sz_xBellReq = 4;
enum sz_xChangePointerControlReq = 12;
enum sz_xSetScreenSaverReq = 12;
enum sz_xChangeHostsReq = 8;
enum sz_xListHostsReq = 4;
enum sz_xChangeModeReq = 4;
enum sz_xRotatePropertiesReq = 12;
enum sz_xReply = 32;
enum sz_xGrabKeyboardReply = 32;
enum sz_xListFontsWithInfoReply = 60;
enum sz_xSetPointerMappingReply = 32;
enum sz_xGetKeyboardMappingReply = 32;
enum sz_xGetPointerMappingReply = 32;
enum sz_xGetModifierMappingReply = 32;
enum sz_xListFontsWithInfoReq = 8;
enum sz_xPolyLineReq = 12;
enum sz_xPolyArcReq = 12;
enum sz_xPolyRectangleReq = 12;
enum sz_xPolyFillRectangleReq = 12;
enum sz_xPolyFillArcReq = 12;
enum sz_xPolyText8Req = 16;
enum sz_xPolyText16Req = 16;
enum sz_xImageText8Req = 16;
enum sz_xImageText16Req = 16;
enum sz_xSetPointerMappingReq = 4;
enum sz_xForceScreenSaverReq = 4;
enum sz_xSetCloseDownModeReq = 4;
enum sz_xClearAreaReq = 16;
enum sz_xSetAccessControlReq = 4;
enum sz_xGetKeyboardMappingReq = 8;
enum sz_xSetModifierMappingReq = 4;
enum sz_xPropIconSize = 24;
enum sz_xChangeKeyboardMappingReq = 8;


/* For the purpose of the structure definitions in this file,
we must redefine the following types in terms of Xmd.h's types, which may
include bit fields.  All of these are #undef'd at the end of this file,
restoring the definitions in X.h.  */

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

enum X_TCP_PORT = 6000     /* add display number */;

enum xTrue =        1;
enum xFalse =       0;


alias KeyButMask = CARD16;

/*****************
   Connection setup structures.  See Chapter 8: Connection Setup
   of the X Window System Protocol specification for details.
*****************/

/* Client initiates handshake with this data, followed by the strings
 * for the auth protocol & data.
 */
struct xConnClientPrefix {
    CARD8 byteOrder;
    BYTE pad;
    CARD16 majorVersion, minorVersion;
    CARD16 nbytesAuthProto;	/* Authorization protocol */
    CARD16 nbytesAuthString;	/* Authorization string */
    CARD16 pad2;
}

/* Server response to xConnClientPrefix.
 *
 * If success == Success, this is followed by xConnSetup and
 * numRoots xWindowRoot structs.
 *
 * If success == Failure, this is followed by a reason string.
 *
 * The protocol also defines a case of success == Authenticate, but
 * that doesn't seem to have ever been implemented by the X Consortium.
 */
struct xConnSetupPrefix {
    CARD8 success;
    BYTE lengthReason; /*num bytes in string following if failure */
    CARD16 majorVersion, minorVersion;
    CARD16 length;       /* 1/4 additional bytes in setup info */
}


struct xConnSetup {
    CARD32 release;
    CARD32 ridBase, ridMask;
    CARD32 motionBufferSize;
    CARD16 nbytesVendor;      /* number of bytes in vendor string */
    CARD16 maxRequestSize;
    CARD8 numRoots;          /* number of roots structs to follow */
    CARD8 numFormats;        /* number of pixmap formats */
    CARD8 imageByteOrder;        /* LSBFirst, MSBFirst */
    CARD8 bitmapBitOrder;        /* LeastSignificant, MostSign...*/
    CARD8 bitmapScanlineUnit, bitmapScanlinePad;     /* 8, 16, 32 */
    KeyCode minKeyCode, maxKeyCode;
    CARD32 pad2;
}

struct xPixmapFormat {
    CARD8 depth;
    CARD8 bitsPerPixel;
    CARD8 scanLinePad;
    CARD8 pad1;
    CARD32 pad2;
}

/* window root */

struct xDepth {
    CARD8 depth;
    CARD8 pad1;
    CARD16 nVisuals;  /* number of xVisualType structures following */
    CARD32 pad2;
    }

struct xVisualType {
    VisualID visualID;
static if (HasVersion!"none" || HasVersion!"c_plusplus") {
    CARD8 c_class;
} else {
    CARD8 class_;
}
    CARD8 bitsPerRGB;
    CARD16 colormapEntries;
    CARD32 redMask, greenMask, blueMask;
    CARD32 pad;
    }

struct xWindowRoot {
    Window windowId;
    Colormap defaultColormap;
    CARD32 whitePixel, blackPixel;
    CARD32 currentInputMask;
    CARD16 pixWidth, pixHeight;
    CARD16 mmWidth, mmHeight;
    CARD16 minInstalledMaps, maxInstalledMaps;
    VisualID rootVisualID;
    CARD8 backingStore;
    BOOL saveUnders;
    CARD8 rootDepth;
    CARD8 nDepths;  /* number of xDepth structures following */
}


/*****************************************************************
 * Structure Defns
 *   Structures needed for replies
 *****************************************************************/

/* Used in GetMotionEvents */

struct xTimecoord {
    CARD32 time;
    INT16 x, y;
}

struct xHostEntry {
    CARD8 family;
    BYTE pad;
    CARD16 length;
}

struct xCharInfo {
    INT16 leftSideBearing, rightSideBearing, characterWidth, ascent, descent;
    CARD16 attributes;
}

struct xFontProp {
    Atom name;
    CARD32 value;
}

/*
 * non-aligned big-endian font ID follows this struct
 */
struct xTextElt {           /* followed by string */
    CARD8 len;	/* number of *characters* in string, or FontChange (255)
		   for font change, or 0 if just delta given */
    INT8 delta;
}


struct xColorItem {
    CARD32 pixel;
    CARD16 red, green, blue;
    CARD8 flags;  /* DoRed, DoGreen, DoBlue booleans */
    CARD8 pad;
}


struct xrgb {
    CARD16 red, green, blue, pad;
}

alias KEYCODE = CARD8;


/*****************
 * XRep:
 *    meant to be 32 byte quantity
 *****************/

/* GenericReply is the common format of all replies.  The "data" items
   are specific to each individual reply type. */

struct xGenericReply {
    BYTE type;              /* X_Reply */
    BYTE data1;             /* depends on reply type */
    CARD16 sequenceNumber;  /* of last request received by server */
    CARD32 length;          /* 4 byte quantities beyond size of GenericReply */
    CARD32 data00;
    CARD32 data01;
    CARD32 data02;
    CARD32 data03;
    CARD32 data04;
    CARD32 data05;
    }

/* Individual reply formats. */

struct xGetWindowAttributesReply {
    BYTE type;  /* X_Reply */
    CARD8 backingStore;
    CARD16 sequenceNumber;
    CARD32 length;	/* NOT 0; this is an extra-large reply */
    VisualID visualID;
static if (HasVersion!"none" || HasVersion!"c_plusplus") {
    CARD16 c_class;
} else {
    CARD16 class_;
}
    CARD8 bitGravity;
    CARD8 winGravity;
    CARD32 backingBitPlanes;
    CARD32 backingPixel;
    BOOL saveUnder;
    BOOL mapInstalled;
    CARD8 mapState;
    BOOL override_;
    Colormap colormap;
    CARD32 allEventMasks;
    CARD32 yourEventMask;
    CARD16 doNotPropagateMask;
    CARD16 pad;
    }

struct xGetGeometryReply {
    BYTE type;   /* X_Reply */
    CARD8 depth;
    CARD16 sequenceNumber;
    CARD32 length;  /* 0 */
    Window root;
    INT16 x, y;
    CARD16 width, height;
    CARD16 borderWidth;
    CARD16 pad1;
    CARD32 pad2;
    CARD32 pad3;
    }

struct xQueryTreeReply {
    BYTE type;  /* X_Reply */
    BYTE pad1;
    CARD16 sequenceNumber;
    CARD32 length;
    Window root, parent;
    CARD16 nChildren;
    CARD16 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    }

struct xInternAtomReply {
    BYTE type;  /* X_Reply */
    BYTE pad1;
    CARD16 sequenceNumber;
    CARD32 length; /* 0 */
    Atom atom;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
    }

struct xGetAtomNameReply {
    BYTE type;  /* X_Reply */
    BYTE pad1;
    CARD16 sequenceNumber;
    CARD32 length;  /* of additional bytes */
    CARD16 nameLength;  /* # of characters in name */
    CARD16 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
    CARD32 pad7;
    }

struct xGetPropertyReply {
    BYTE type;  /* X_Reply */
    CARD8 format;
    CARD16 sequenceNumber;
    CARD32 length; /* of additional bytes */
    Atom propertyType;
    CARD32 bytesAfter;
    CARD32 nItems; /* # of 8, 16, or 32-bit entities in reply */
    CARD32 pad1;
    CARD32 pad2;
    CARD32 pad3;
    }

struct xListPropertiesReply {
    BYTE type;  /* X_Reply */
    BYTE pad1;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD16 nProperties;
    CARD16 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
    CARD32 pad7;
    }

struct xGetSelectionOwnerReply {
    BYTE type;  /* X_Reply */
    BYTE pad1;
    CARD16 sequenceNumber;
    CARD32 length;  /* 0 */
    Window owner;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
    }

struct xGrabPointerReply {
    BYTE type;  /* X_Reply */
    BYTE status;
    CARD16 sequenceNumber;
    CARD32 length;  /* 0 */
    CARD32 pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
    }

alias xGrabKeyboardReply = xGrabPointerReply;

struct xQueryPointerReply {
    BYTE type;  /* X_Reply */
    BOOL sameScreen;
    CARD16 sequenceNumber;
    CARD32 length;  /* 0 */
    Window root, child;
    INT16 rootX, rootY, winX, winY;
    CARD16 mask;
    CARD16 pad1;
    CARD32 pad;
    }

struct xGetMotionEventsReply {
    BYTE type;  /* X_Reply */
    BYTE pad1;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 nEvents;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
    }

struct xTranslateCoordsReply {
    BYTE type;  /* X_Reply */
    BOOL sameScreen;
    CARD16 sequenceNumber;
    CARD32 length; /* 0 */
    Window child;
    INT16 dstX, dstY;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    }

struct xGetInputFocusReply {
    BYTE type;  /* X_Reply */
    CARD8 revertTo;
    CARD16 sequenceNumber;
    CARD32 length;  /* 0 */
    Window focus;
    CARD32 pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    }

struct xQueryKeymapReply {
    BYTE type;  /* X_Reply */
    BYTE pad1;
    CARD16 sequenceNumber;
    CARD32 length;  /* 2, NOT 0; this is an extra-large reply */
    BYTE[32] map;
    }

/* Warning: this MUST match (up to component renaming) xListFontsWithInfoReply */
struct xQueryFontReply {
    BYTE type;  /* X_Reply */
    BYTE pad1;
    CARD16 sequenceNumber;
    CARD32 length;  /* definitely > 0, even if "nCharInfos" is 0 */
    xCharInfo minBounds;
    CARD32 walign1;
    xCharInfo maxBounds;
    CARD32 walign2;
    CARD16 minCharOrByte2, maxCharOrByte2;
    CARD16 defaultChar;
    CARD16 nFontProps;  /* followed by this many xFontProp structures */
    CARD8 drawDirection;
    CARD8 minByte1, maxByte1;
    BOOL allCharsExist;
    INT16 fontAscent, fontDescent;
    CARD32 nCharInfos; /* followed by this many xCharInfo structures */
}

struct xQueryTextExtentsReply {
    BYTE type;  /* X_Reply */
    CARD8 drawDirection;
    CARD16 sequenceNumber;
    CARD32 length;  /* 0 */
    INT16 fontAscent, fontDescent;
    INT16 overallAscent, overallDescent;
    INT32 overallWidth, overallLeft, overallRight;
    CARD32 pad;
    }

struct xListFontsReply {
    BYTE type;  /* X_Reply */
    BYTE pad1;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD16 nFonts;
    CARD16 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
    CARD32 pad7;
    }

/* Warning: this MUST match (up to component renaming) xQueryFontReply */
struct xListFontsWithInfoReply {
    BYTE type;  /* X_Reply */
    CARD8 nameLength;  /* 0 indicates end-of-reply-sequence */
    CARD16 sequenceNumber;
    CARD32 length;  /* definitely > 0, even if "nameLength" is 0 */
    xCharInfo minBounds;
    CARD32 walign1;
    xCharInfo maxBounds;
    CARD32 walign2;
    CARD16 minCharOrByte2, maxCharOrByte2;
    CARD16 defaultChar;
    CARD16 nFontProps;  /* followed by this many xFontProp structures */
    CARD8 drawDirection;
    CARD8 minByte1, maxByte1;
    BOOL allCharsExist;
    INT16 fontAscent, fontDescent;
    CARD32 nReplies;   /* hint as to how many more replies might be coming */
}

struct xGetFontPathReply {
    BYTE type;  /* X_Reply */
    BYTE pad1;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD16 nPaths;
    CARD16 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
    CARD32 pad7;
    }

struct xGetImageReply {
    BYTE type;  /* X_Reply */
    CARD8 depth;
    CARD16 sequenceNumber;
    CARD32 length;
    VisualID visual;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
    CARD32 pad7;
    }

struct xListInstalledColormapsReply {
    BYTE type;  /* X_Reply */
    BYTE pad1;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD16 nColormaps;
    CARD16 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
    CARD32 pad7;
    }

struct xAllocColorReply {
    BYTE type; /* X_Reply */
    BYTE pad1;
    CARD16 sequenceNumber;
    CARD32 length;   /* 0 */
    CARD16 red, green, blue;
    CARD16 pad2;
    CARD32 pixel;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    }

struct xAllocNamedColorReply {
    BYTE type; /* X_Reply */
    BYTE pad1;
    CARD16 sequenceNumber;
    CARD32 length;  /* 0 */
    CARD32 pixel;
    CARD16 exactRed, exactGreen, exactBlue;
    CARD16 screenRed, screenGreen, screenBlue;
    CARD32 pad2;
    CARD32 pad3;
    }

struct xAllocColorCellsReply {
    BYTE type;  /* X_Reply */
    BYTE pad1;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD16 nPixels, nMasks;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
    CARD32 pad7;
    }

struct xAllocColorPlanesReply {
    BYTE type; /* X_Reply */
    BYTE pad1;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD16 nPixels;
    CARD16 pad2;
    CARD32 redMask, greenMask, blueMask;
    CARD32 pad3;
    CARD32 pad4;
    }

struct xQueryColorsReply {
    BYTE type; /* X_Reply */
    BYTE pad1;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD16 nColors;
    CARD16 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
    CARD32 pad7;
    }

struct xLookupColorReply {
    BYTE type;  /* X_Reply */
    BYTE pad1;
    CARD16 sequenceNumber;
    CARD32 length;  /* 0 */
    CARD16 exactRed, exactGreen, exactBlue;
    CARD16 screenRed, screenGreen, screenBlue;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    }

struct xQueryBestSizeReply {
    BYTE type;  /* X_Reply */
    BYTE pad1;
    CARD16 sequenceNumber;
    CARD32 length;  /* 0 */
    CARD16 width, height;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
    CARD32 pad7;
    }

struct xQueryExtensionReply {
    BYTE type;  /* X_Reply */
    BYTE pad1;
    CARD16 sequenceNumber;
    CARD32 length; /* 0 */
    BOOL present;
    CARD8 major_opcode;
    CARD8 first_event;
    CARD8 first_error;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
    CARD32 pad7;
    }

struct xListExtensionsReply {
    BYTE type;  /* X_Reply */
    CARD8 nExtensions;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
    CARD32 pad7;
    }


struct xSetMappingReply {
    BYTE type;  /* X_Reply */
    CARD8 success;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
    CARD32 pad7;
    }
alias xSetPointerMappingReply = xSetMappingReply;
alias xSetModifierMappingReply = xSetMappingReply;

struct xGetPointerMappingReply {
    BYTE type;  /* X_Reply */
    CARD8 nElts;  /* how many elements does the map have */
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
    CARD32 pad7;
    }

struct xGetKeyboardMappingReply {
    BYTE type;
    CARD8 keySymsPerKeyCode;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
    CARD32 pad7;
}

struct xGetModifierMappingReply {
    BYTE type;
    CARD8 numKeyPerModifier;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
}

struct xGetKeyboardControlReply {
    BYTE type;  /* X_Reply */
    BOOL globalAutoRepeat;
    CARD16 sequenceNumber;
    CARD32 length;  /* 5 */
    CARD32 ledMask;
    CARD8 keyClickPercent, bellPercent;
    CARD16 bellPitch, bellDuration;
    CARD16 pad;
    BYTE[32] map;  /* bit masks start here */
    }

struct xGetPointerControlReply {
    BYTE type;  /* X_Reply */
    BYTE pad1;
    CARD16 sequenceNumber;
    CARD32 length;  /* 0 */
    CARD16 accelNumerator, accelDenominator;
    CARD16 threshold;
    CARD16 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
    }

struct xGetScreenSaverReply {
    BYTE type;  /* X_Reply */
    BYTE pad1;
    CARD16 sequenceNumber;
    CARD32 length;  /* 0 */
    CARD16 timeout, interval;
    BOOL preferBlanking;
    BOOL allowExposures;
    CARD16 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
    }

struct xListHostsReply {
    BYTE type;  /* X_Reply */
    BOOL enabled;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD16 nHosts;
    CARD16 pad1;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
    CARD32 pad7;
    }




/*****************************************************************
 * Xerror
 *    All errors  are 32 bytes
 *****************************************************************/

struct xError {
    BYTE type;                  /* X_Error */
    BYTE errorCode;
    CARD16 sequenceNumber;       /* the nth request from this client */
    CARD32 resourceID;
    CARD16 minorCode;
    CARD8 majorCode;
    BYTE pad1;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
    CARD32 pad7;
}

/*****************************************************************
 * xEvent
 *    All events are 32 bytes
 *****************************************************************/
enum ELFlagFocus =        (1<<0);
enum ELFlagSameScreen =   (1<<1);

struct _xEvent {
    union _Union {
	struct _U {
	    BYTE type;
	    BYTE detail;
	    CARD16 sequenceNumber;
	    }_U u;
	struct _KeyButtonPointer {
	    CARD32 pad00;
	    Time time;
	    Window root, event, child;
	    INT16 rootX, rootY, eventX, eventY;
	    KeyButMask state;
	    BOOL sameScreen;
	    BYTE pad1;
	}_KeyButtonPointer keyButtonPointer;
	struct _EnterLeave {
	    CARD32 pad00;
	    Time time;
	    Window root, event, child;
	    INT16 rootX, rootY, eventX, eventY;
	    KeyButMask state;
	    BYTE mode; 			/* really XMode */
	    BYTE flags;		/* sameScreen and focus booleans, packed together */
	}_EnterLeave enterLeave;
	struct _Focus {
	    CARD32 pad00;
	    Window window;
	    BYTE mode; 			/* really XMode */
	    BYTE pad1, pad2, pad3;
	}_Focus focus;
	struct _Expose {
	    CARD32 pad00;
	    Window window;
	    CARD16 x, y, width, height;
	    CARD16 count;
	    CARD16 pad2;
	}_Expose expose;
	struct _GraphicsExposure {
	    CARD32 pad00;
	    Drawable drawable;
	    CARD16 x, y, width, height;
	    CARD16 minorEvent;
	    CARD16 count;
	    BYTE majorEvent;
	    BYTE pad1, pad2, pad3;
	}_GraphicsExposure graphicsExposure;
	struct _NoExposure {
	    CARD32 pad00;
	    Drawable drawable;
	    CARD16 minorEvent;
	    BYTE majorEvent;
	    BYTE bpad;
	}_NoExposure noExposure;
	struct _Visibility {
	    CARD32 pad00;
	    Window window;
	    CARD8 state;
	    BYTE pad1, pad2, pad3;
	}_Visibility visibility;
	struct _CreateNotify {
	    CARD32 pad00;
	    Window parent, window;
	    INT16 x, y;
	    CARD16 width, height, borderWidth;
	    BOOL override_;
	    BYTE bpad;
        }_CreateNotify createNotify;
/*
 * The event fields in the structures for DestroyNotify, UnmapNotify,
 * MapNotify, ReparentNotify, ConfigureNotify, CirculateNotify, GravityNotify,
 * must be at the same offset because server internal code is depending upon
 * this to patch up the events before they are delivered.
 * Also note that MapRequest, ConfigureRequest and CirculateRequest have
 * the same offset for the event window.
 */
	struct _DestroyNotify {
	    CARD32 pad00;
	    Window event, window;
	}_DestroyNotify destroyNotify;
	struct _UnmapNotify {
	    CARD32 pad00;
	    Window event, window;
	    BOOL fromConfigure;
	    BYTE pad1, pad2, pad3;
        }_UnmapNotify unmapNotify;
	struct _MapNotify {
	    CARD32 pad00;
	    Window event, window;
	    BOOL override_;
	    BYTE pad1, pad2, pad3;
        }_MapNotify mapNotify;
	struct _MapRequest {
	    CARD32 pad00;
	    Window parent, window;
        }_MapRequest mapRequest;
	struct _Reparent {
	    CARD32 pad00;
	    Window event, window, parent;
	    INT16 x, y;
	    BOOL override_;
	    BYTE pad1, pad2, pad3;
	}_Reparent reparent;
	struct _ConfigureNotify {
	    CARD32 pad00;
	    Window event, window, aboveSibling;
	    INT16 x, y;
	    CARD16 width, height, borderWidth;
	    BOOL override_;
	    BYTE bpad;
	}_ConfigureNotify configureNotify;
	struct _ConfigureRequest {
	    CARD32 pad00;
	    Window parent, window, sibling;
	    INT16 x, y;
	    CARD16 width, height, borderWidth;
	    CARD16 valueMask;
	    CARD32 pad1;
	}_ConfigureRequest configureRequest;
	struct _Gravity {
	    CARD32 pad00;
	    Window event, window;
	    INT16 x, y;
	    CARD32 pad1, pad2, pad3, pad4;
	}_Gravity gravity;
	struct _ResizeRequest {
	    CARD32 pad00;
	    Window window;
	    CARD16 width, height;
	}_ResizeRequest resizeRequest;
	struct _Circulate {
/* The event field in the circulate record is really the parent when this
   is used as a CirculateRequest instead of a CirculateNotify */
	    CARD32 pad00;
	    Window event, window, parent;
	    BYTE place;			/* Top or Bottom */
	    BYTE pad1, pad2, pad3;
	}_Circulate circulate;
	struct _Property {
	    CARD32 pad00;
	    Window window;
	    Atom atom;
	    Time time;
	    BYTE state;			/* NewValue or Deleted */
	    BYTE pad1;
	    CARD16 pad2;
	}_Property property;
	struct _SelectionClear {
	    CARD32 pad00;
	    Time time;
	    Window window;
	    Atom atom;
	}_SelectionClear selectionClear;
	struct _SelectionRequest {
	    CARD32 pad00;
	    Time time;
	    Window owner, requestor;
	    Atom selection, target, property;
	}_SelectionRequest selectionRequest;
	struct _SelectionNotify {
	    CARD32 pad00;
	    Time time;
	    Window requestor;
	    Atom selection, target, property;
	}_SelectionNotify selectionNotify;
	struct _Colormap {
	    CARD32 pad00;
	    Window window;
	    Colormap colormap;
// #if defined(__cplusplus) || defined(c_plusplus)
	    // BOOL c_new;
// #else
	    BOOL new_;
// #endif
	    BYTE state;			/* Installed or UnInstalled */
	    BYTE pad1, pad2;
	}_Colormap colormap;
	struct _MappingNotify {
	    CARD32 pad00;
	    CARD8 request;
	    KeyCode firstKeyCode;
	    CARD8 count;
	    BYTE pad1;
	}_MappingNotify mappingNotify;
	struct _ClientMessage {
	    CARD32 pad00;
	    Window window;
	    union _U {
		struct _L {
		    Atom type;
		    INT32 longs0;
		    INT32 longs1;
		    INT32 longs2;
		    INT32 longs3;
		    INT32 longs4;
		}_L l;
		struct _S {
		    Atom type;
		    INT16 shorts0;
		    INT16 shorts1;
		    INT16 shorts2;
		    INT16 shorts3;
		    INT16 shorts4;
		    INT16 shorts5;
		    INT16 shorts6;
		    INT16 shorts7;
		    INT16 shorts8;
		    INT16 shorts9;
		}_S s;
		struct _B {
		    Atom type;
		    INT8[20] bytes;
		}_B b;
	    }_U u;
	}_ClientMessage clientMessage;
    }_Union u;
}

alias xEvent = _xEvent;

/*********************************************************
 *
 * Generic event
 *
 * Those events are not part of the core protocol spec and can be used by
 * various extensions.
 * type is always GenericEvent
 * extension is the minor opcode of the extension the event belongs to.
 * evtype is the actual event type, unique __per extension__.
 *
 * GenericEvents can be longer than 32 bytes, with the length field
 * specifying the number of 4 byte blocks after the first 32 bytes.
 *
 *
 */
struct xGenericEvent {
    BYTE type;
    CARD8 extension;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD16 evtype;
    CARD16 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
    CARD32 pad7;
}



/* KeymapNotify events are not included in the above union because they
   are different from all other events: they do not have a "detail"
   or "sequenceNumber", so there is room for a 248-bit key mask. */

struct xKeymapEvent {
    BYTE type;
    BYTE[31] map;
    }

enum XEventSize = (xEvent).sizeof;

/* XReply is the union of all the replies above whose "fixed part"
fits in 32 bytes.  It does NOT include GetWindowAttributesReply,
QueryFontReply, QueryKeymapReply, or GetKeyboardControlReply
ListFontsWithInfoReply */

union xReply {
    xGenericReply generic;
    xGetGeometryReply geom;
    xQueryTreeReply tree;
    xInternAtomReply atom;
    xGetAtomNameReply atomName;
    xGetPropertyReply property;
    xListPropertiesReply listProperties;
    xGetSelectionOwnerReply selection;
    xGrabPointerReply grabPointer;
    xGrabKeyboardReply grabKeyboard;
    xQueryPointerReply pointer;
    xGetMotionEventsReply motionEvents;
    xTranslateCoordsReply coords;
    xGetInputFocusReply inputFocus;
    xQueryTextExtentsReply textExtents;
    xListFontsReply fonts;
    xGetFontPathReply fontPath;
    xGetImageReply image;
    xListInstalledColormapsReply colormaps;
    xAllocColorReply allocColor;
    xAllocNamedColorReply allocNamedColor;
    xAllocColorCellsReply colorCells;
    xAllocColorPlanesReply colorPlanes;
    xQueryColorsReply colors;
    xLookupColorReply lookupColor;
    xQueryBestSizeReply bestSize;
    xQueryExtensionReply extension;
    xListExtensionsReply extensions;
    xSetModifierMappingReply setModifierMapping;
    xGetModifierMappingReply getModifierMapping;
    xSetPointerMappingReply setPointerMapping;
    xGetKeyboardMappingReply getKeyboardMapping;
    xGetPointerMappingReply getPointerMapping;
    xGetPointerControlReply pointerControl;
    xGetScreenSaverReply screenSaver;
    xListHostsReply hosts;
    xError error;
    xEvent event;
}



/*****************************************************************
 * REQUESTS
 *****************************************************************/


/* Request structure */

struct xReq {
	CARD8 reqType;
	CARD8 data;            /* meaning depends on request type */
	CARD16 length;         /* length in 4 bytes quantities
				  of whole request, including this header */
}

/*****************************************************************
 *  structures that follow request.
 *****************************************************************/

/* ResourceReq is used for any request which has a resource ID
   (or Atom or Time) as its one and only argument.  */

struct xResourceReq {
    CARD8 reqType;
    BYTE pad;
    CARD16 length;
    CARD32 id;  /* a Window, Drawable, Font, GContext, Pixmap, etc. */
    }

struct xCreateWindowReq {
    CARD8 reqType;
    CARD8 depth;
    CARD16 length;
    Window wid, parent;
    INT16 x, y;
    CARD16 width, height, borderWidth;
static if (HasVersion!"none" || HasVersion!"c_plusplus") {
    CARD16 c_class;
} else {
    CARD16 class_;
}
    VisualID visual;
    CARD32 mask;
}

struct xChangeWindowAttributesReq {
    CARD8 reqType;
    BYTE pad;
    CARD16 length;
    Window window;
    CARD32 valueMask;
}

struct xChangeSaveSetReq {
    CARD8 reqType;
    BYTE mode;
    CARD16 length;
    Window window;
}

struct xReparentWindowReq {
    CARD8 reqType;
    BYTE pad;
    CARD16 length;
    Window window, parent;
    INT16 x, y;
}

struct xConfigureWindowReq {
    CARD8 reqType;
    CARD8 pad;
    CARD16 length;
    Window window;
    CARD16 mask;
    CARD16 pad2;
}

struct xCirculateWindowReq {
    CARD8 reqType;
    CARD8 direction;
    CARD16 length;
    Window window;
}

struct xInternAtomReq {    /* followed by padded string */
    CARD8 reqType;
    BOOL onlyIfExists;
    CARD16 length;
    CARD16 nbytes;    /* number of bytes in string */
    CARD16 pad;
}

struct xChangePropertyReq {
    CARD8 reqType;
    CARD8 mode;
    CARD16 length;
    Window window;
    Atom property, type;
    CARD8 format;
    BYTE[3] pad;
    CARD32 nUnits;     /* length of stuff following, depends on format */
}

struct xDeletePropertyReq {
    CARD8 reqType;
    BYTE pad;
    CARD16 length;
    Window window;
    Atom property;
}

struct xGetPropertyReq {
    CARD8 reqType;
static if (HasVersion!"none" || HasVersion!"c_plusplus") {
    BOOL c_delete;
} else {
    BOOL delete_;
}
    CARD16 length;
    Window window;
    Atom property, type;
    CARD32 longOffset;
    CARD32 longLength;
}

struct xSetSelectionOwnerReq {
    CARD8 reqType;
    BYTE pad;
    CARD16 length;
    Window window;
    Atom selection;
    Time time;
}

struct xConvertSelectionReq {
    CARD8 reqType;
    BYTE pad;
    CARD16 length;
    Window requestor;
    Atom selection, target, property;
    Time time;
    }

struct xSendEventReq {
    CARD8 reqType;
    BOOL propagate;
    CARD16 length;
    Window destination;
    CARD32 eventMask;
    xEvent event;
}

struct xGrabPointerReq {
    CARD8 reqType;
    BOOL ownerEvents;
    CARD16 length;
    Window grabWindow;
    CARD16 eventMask;
    BYTE pointerMode, keyboardMode;
    Window confineTo;
    Cursor cursor;
    Time time;
}

struct xGrabButtonReq {
    CARD8 reqType;
    BOOL ownerEvents;
    CARD16 length;
    Window grabWindow;
    CARD16 eventMask;
    BYTE pointerMode, keyboardMode;
    Window confineTo;
    Cursor cursor;
    CARD8 button;
    BYTE pad;
    CARD16 modifiers;
}

struct xUngrabButtonReq {
    CARD8 reqType;
    CARD8 button;
    CARD16 length;
    Window grabWindow;
    CARD16 modifiers;
    CARD16 pad;
}

struct xChangeActivePointerGrabReq {
    CARD8 reqType;
    BYTE pad;
    CARD16 length;
    Cursor cursor;
    Time time;
    CARD16 eventMask;
    CARD16 pad2;
}

struct xGrabKeyboardReq {
    CARD8 reqType;
    BOOL ownerEvents;
    CARD16 length;
    Window grabWindow;
    Time time;
    BYTE pointerMode, keyboardMode;
    CARD16 pad;
}

struct xGrabKeyReq {
    CARD8 reqType;
    BOOL ownerEvents;
    CARD16 length;
    Window grabWindow;
    CARD16 modifiers;
    CARD8 key;
    BYTE pointerMode, keyboardMode;
    BYTE pad1, pad2, pad3;
}

struct xUngrabKeyReq {
    CARD8 reqType;
    CARD8 key;
    CARD16 length;
    Window grabWindow;
    CARD16 modifiers;
    CARD16 pad;
}

struct xAllowEventsReq {
    CARD8 reqType;
    CARD8 mode;
    CARD16 length;
    Time time;
}

struct xGetMotionEventsReq {
    CARD8 reqType;
    BYTE pad;
    CARD16 length;
    Window window;
    Time start, stop;
}

struct xTranslateCoordsReq {
    CARD8 reqType;
    BYTE pad;
    CARD16 length;
    Window srcWid, dstWid;
    INT16 srcX, srcY;
}

struct xWarpPointerReq {
    CARD8 reqType;
    BYTE pad;
    CARD16 length;
    Window srcWid, dstWid;
    INT16 srcX, srcY;
    CARD16 srcWidth, srcHeight;
    INT16 dstX, dstY;
}

struct xSetInputFocusReq {
    CARD8 reqType;
    CARD8 revertTo;
    CARD16 length;
    Window focus;
    Time time;
}

struct xOpenFontReq {
    CARD8 reqType;
    BYTE pad;
    CARD16 length;
    Font fid;
    CARD16 nbytes;
    BYTE pad1, pad2;	/* string follows on word boundary */
}

struct xQueryTextExtentsReq {
    CARD8 reqType;
    BOOL oddLength;
    CARD16 length;
    Font fid;
    }

struct xListFontsReq {
    CARD8 reqType;
    BYTE pad;
    CARD16 length;
    CARD16 maxNames;
    CARD16 nbytes;	/* followed immediately by string bytes */
}

alias xListFontsWithInfoReq = xListFontsReq;

struct xSetFontPathReq {
    CARD8 reqType;
    BYTE pad;
    CARD16 length;
    CARD16 nFonts;
    BYTE pad1, pad2;	/* LISTofSTRING8 follows on word boundary */
}

struct xCreatePixmapReq {
    CARD8 reqType;
    CARD8 depth;
    CARD16 length;
    Pixmap pid;
    Drawable drawable;
    CARD16 width, height;
}

struct xCreateGCReq {
    CARD8 reqType;
    BYTE pad;
    CARD16 length;
    GContext gc;
    Drawable drawable;
    CARD32 mask;
}

struct xChangeGCReq {
    CARD8 reqType;
    BYTE pad;
    CARD16 length;
    GContext gc;
    CARD32 mask;
}

struct xCopyGCReq {
    CARD8 reqType;
    BYTE pad;
    CARD16 length;
    GContext srcGC, dstGC;
    CARD32 mask;
}

struct xSetDashesReq {
    CARD8 reqType;
    BYTE pad;
    CARD16 length;
    GContext gc;
    CARD16 dashOffset;
    CARD16 nDashes;	/* length LISTofCARD8 of values following */
}

struct xSetClipRectanglesReq {
    CARD8 reqType;
    BYTE ordering;
    CARD16 length;
    GContext gc;
    INT16 xOrigin, yOrigin;
}

struct xClearAreaReq {
    CARD8 reqType;
    BOOL exposures;
    CARD16 length;
    Window window;
    INT16 x, y;
    CARD16 width, height;
}

struct xCopyAreaReq {
    CARD8 reqType;
    BYTE pad;
    CARD16 length;
    Drawable srcDrawable, dstDrawable;
    GContext gc;
    INT16 srcX, srcY, dstX, dstY;
    CARD16 width, height;
}

struct xCopyPlaneReq {
    CARD8 reqType;
    BYTE pad;
    CARD16 length;
    Drawable srcDrawable, dstDrawable;
    GContext gc;
    INT16 srcX, srcY, dstX, dstY;
    CARD16 width, height;
    CARD32 bitPlane;
}

struct xPolyPointReq {
    CARD8 reqType;
    BYTE coordMode;
    CARD16 length;
    Drawable drawable;
    GContext gc;
}

alias xPolyLineReq = xPolyPointReq;  /* same request structure */

/* The following used for PolySegment, PolyRectangle, PolyArc, PolyFillRectangle, PolyFillArc */

struct xPolySegmentReq {
    CARD8 reqType;
    BYTE pad;
    CARD16 length;
    Drawable drawable;
    GContext gc;
}

alias xPolyArcReq = xPolySegmentReq;
alias xPolyRectangleReq = xPolySegmentReq;
alias xPolyFillRectangleReq = xPolySegmentReq;
alias xPolyFillArcReq = xPolySegmentReq;

struct xFillPolyReq {
    CARD8 reqType;
    BYTE pad;
    CARD16 length;
    Drawable drawable;
    GContext gc;
    BYTE shape;
    BYTE coordMode;
    CARD16 pad1;
}


struct xPutImageReq {
    CARD8 reqType;
    CARD8 format;
    CARD16 length;
    Drawable drawable;
    GContext gc;
    CARD16 width, height;
    INT16 dstX, dstY;
    CARD8 leftPad;
    CARD8 depth;
    CARD16 pad;
}

struct xGetImageReq {
    CARD8 reqType;
    CARD8 format;
    CARD16 length;
    Drawable drawable;
    INT16 x, y;
    CARD16 width, height;
    CARD32 planeMask;
}

/* the following used by PolyText8 and PolyText16 */

struct xPolyTextReq {
    CARD8 reqType;
    CARD8 pad;
    CARD16 length;
    Drawable drawable;
    GContext gc;
    INT16 x, y;		/* items (xTextElt) start after struct */
}

alias xPolyText8Req = xPolyTextReq;
alias xPolyText16Req = xPolyTextReq;

struct xImageTextReq {
    CARD8 reqType;
    BYTE nChars;
    CARD16 length;
    Drawable drawable;
    GContext gc;
    INT16 x, y;
}

alias xImageText8Req = xImageTextReq;
alias xImageText16Req = xImageTextReq;

struct xCreateColormapReq {
    CARD8 reqType;
    BYTE alloc;
    CARD16 length;
    Colormap mid;
    Window window;
    VisualID visual;
}

struct xCopyColormapAndFreeReq {
    CARD8 reqType;
    BYTE pad;
    CARD16 length;
    Colormap mid;
    Colormap srcCmap;
}

struct xAllocColorReq {
    CARD8 reqType;
    BYTE pad;
    CARD16 length;
    Colormap cmap;
    CARD16 red, green, blue;
    CARD16 pad2;
}

struct xAllocNamedColorReq {
    CARD8 reqType;
    BYTE pad;
    CARD16 length;
    Colormap cmap;
    CARD16 nbytes;	/* followed by structure */
    BYTE pad1, pad2;
}

struct xAllocColorCellsReq {
    CARD8 reqType;
    BOOL contiguous;
    CARD16 length;
    Colormap cmap;
    CARD16 colors, planes;
}

struct xAllocColorPlanesReq {
    CARD8 reqType;
    BOOL contiguous;
    CARD16 length;
    Colormap cmap;
    CARD16 colors, red, green, blue;
}

struct xFreeColorsReq {
    CARD8 reqType;
    BYTE pad;
    CARD16 length;
    Colormap cmap;
    CARD32 planeMask;
}

struct xStoreColorsReq {
    CARD8 reqType;
    BYTE pad;
    CARD16 length;
    Colormap cmap;
}

struct xStoreNamedColorReq {
    CARD8 reqType;
    CARD8 flags;   /* DoRed, DoGreen, DoBlue, as in xColorItem */
    CARD16 length;
    Colormap cmap;
    CARD32 pixel;
    CARD16 nbytes;  /* number of name string bytes following structure */
    BYTE pad1, pad2;
    }

struct xQueryColorsReq {
    CARD8 reqType;
    BYTE pad;
    CARD16 length;
    Colormap cmap;
}

struct xLookupColorReq {    /* followed  by string of length len */
    CARD8 reqType;
    BYTE pad;
    CARD16 length;
    Colormap cmap;
    CARD16 nbytes;  /* number of string bytes following structure*/
    BYTE pad1, pad2;
}

struct xCreateCursorReq {
    CARD8 reqType;
    BYTE pad;
    CARD16 length;
    Cursor cid;
    Pixmap source, mask;
    CARD16 foreRed, foreGreen, foreBlue;
    CARD16 backRed, backGreen, backBlue;
    CARD16 x, y;
}

struct xCreateGlyphCursorReq {
    CARD8 reqType;
    BYTE pad;
    CARD16 length;
    Cursor cid;
    Font source, mask;
    CARD16 sourceChar, maskChar;
    CARD16 foreRed, foreGreen, foreBlue;
    CARD16 backRed, backGreen, backBlue;
}

struct xRecolorCursorReq {
    CARD8 reqType;
    BYTE pad;
    CARD16 length;
    Cursor cursor;
    CARD16 foreRed, foreGreen, foreBlue;
    CARD16 backRed, backGreen, backBlue;
}

struct xQueryBestSizeReq {
    CARD8 reqType;
static if (HasVersion!"none" || HasVersion!"c_plusplus") {
    CARD8 c_class;
} else {
    CARD8 class_;
}
    CARD16 length;
    Drawable drawable;
    CARD16 width, height;
}

struct xQueryExtensionReq {
    CARD8 reqType;
    BYTE pad;
    CARD16 length;
    CARD16 nbytes;	/* number of string bytes following structure */
    BYTE pad1, pad2;
}

struct xSetModifierMappingReq {
    CARD8 reqType;
    CARD8 numKeyPerModifier;
    CARD16 length;
}

struct xSetPointerMappingReq {
    CARD8 reqType;
    CARD8 nElts;	/* how many elements in the map */
    CARD16 length;
}

struct xGetKeyboardMappingReq {
    CARD8 reqType;
    BYTE pad;
    CARD16 length;
    KeyCode firstKeyCode;
    CARD8 count;
    CARD16 pad1;
}

struct xChangeKeyboardMappingReq {
    CARD8 reqType;
    CARD8 keyCodes;
    CARD16 length;
    KeyCode firstKeyCode;
    CARD8 keySymsPerKeyCode;
    CARD16 pad1;
}

struct xChangeKeyboardControlReq {
    CARD8 reqType;
    BYTE pad;
    CARD16 length;
    CARD32 mask;
}

struct xBellReq {
    CARD8 reqType;
    INT8 percent;  /* -100 to 100 */
    CARD16 length;
}

struct xChangePointerControlReq {
    CARD8 reqType;
    BYTE pad;
    CARD16 length;
    INT16 accelNum, accelDenum;
    INT16 threshold;
    BOOL doAccel, doThresh;
}

struct xSetScreenSaverReq {
    CARD8 reqType;
    BYTE pad;
    CARD16 length;
    INT16 timeout, interval;
    BYTE preferBlank, allowExpose;
    CARD16 pad2;
}

struct xChangeHostsReq {
    CARD8 reqType;
    BYTE mode;
    CARD16 length;
    CARD8 hostFamily;
    BYTE pad;
    CARD16 hostLength;
}

struct xListHostsReq {
    CARD8 reqType;
    BYTE pad;
    CARD16 length;
    }

struct xChangeModeReq {
    CARD8 reqType;
    BYTE mode;
    CARD16 length;
    }

alias xSetAccessControlReq = xChangeModeReq;
alias xSetCloseDownModeReq = xChangeModeReq;
alias xForceScreenSaverReq = xChangeModeReq;

struct xRotatePropertiesReq { /* followed by LIST of ATOM */
    CARD8 reqType;
    BYTE pad;
    CARD16 length;
    Window window;
    CARD16 nAtoms;
    INT16 nPositions;
    }



/* Reply codes */

enum X_Reply =		1		/* Normal reply */;
enum X_Error =		0		/* Error */;

/* Request codes */

enum X_CreateWindow =                  1;
enum X_ChangeWindowAttributes =        2;
enum X_GetWindowAttributes =           3;
enum X_DestroyWindow =                 4;
enum X_DestroySubwindows =             5;
enum X_ChangeSaveSet =                 6;
enum X_ReparentWindow =                7;
enum X_MapWindow =                     8;
enum X_MapSubwindows =                 9;
enum X_UnmapWindow =                  10;
enum X_UnmapSubwindows =              11;
enum X_ConfigureWindow =              12;
enum X_CirculateWindow =              13;
enum X_GetGeometry =                  14;
enum X_QueryTree =                    15;
enum X_InternAtom =                   16;
enum X_GetAtomName =                  17;
enum X_ChangeProperty =               18;
enum X_DeleteProperty =               19;
enum X_GetProperty =                  20;
enum X_ListProperties =               21;
enum X_SetSelectionOwner =            22;
enum X_GetSelectionOwner =            23;
enum X_ConvertSelection =             24;
enum X_SendEvent =                    25;
enum X_GrabPointer =                  26;
enum X_UngrabPointer =                27;
enum X_GrabButton =                   28;
enum X_UngrabButton =                 29;
enum X_ChangeActivePointerGrab =      30;
enum X_GrabKeyboard =                 31;
enum X_UngrabKeyboard =               32;
enum X_GrabKey =                      33;
enum X_UngrabKey =                    34;
enum X_AllowEvents =                  35;
enum X_GrabServer =                   36;
enum X_UngrabServer =                 37;
enum X_QueryPointer =                 38;
enum X_GetMotionEvents =              39;
enum X_TranslateCoords =              40;
enum X_WarpPointer =                  41;
enum X_SetInputFocus =                42;
enum X_GetInputFocus =                43;
enum X_QueryKeymap =                  44;
enum X_OpenFont =                     45;
enum X_CloseFont =                    46;
enum X_QueryFont =                    47;
enum X_QueryTextExtents =             48;
enum X_ListFonts =                    49;
enum X_ListFontsWithInfo =    	       50;
enum X_SetFontPath =                  51;
enum X_GetFontPath =                  52;
enum X_CreatePixmap =                 53;
enum X_FreePixmap =                   54;
enum X_CreateGC =                     55;
enum X_ChangeGC =                     56;
enum X_CopyGC =                       57;
enum X_SetDashes =                    58;
enum X_SetClipRectangles =            59;
enum X_FreeGC =                       60;
enum X_ClearArea =                    61;
enum X_CopyArea =                     62;
enum X_CopyPlane =                    63;
enum X_PolyPoint =                    64;
enum X_PolyLine =                     65;
enum X_PolySegment =                  66;
enum X_PolyRectangle =                67;
enum X_PolyArc =                      68;
enum X_FillPoly =                     69;
enum X_PolyFillRectangle =            70;
enum X_PolyFillArc =                  71;
enum X_PutImage =                     72;
enum X_GetImage =                     73;
enum X_PolyText8 =                    74;
enum X_PolyText16 =                   75;
enum X_ImageText8 =                   76;
enum X_ImageText16 =                  77;
enum X_CreateColormap =               78;
enum X_FreeColormap =                 79;
enum X_CopyColormapAndFree =          80;
enum X_InstallColormap =              81;
enum X_UninstallColormap =            82;
enum X_ListInstalledColormaps =       83;
enum X_AllocColor =                   84;
enum X_AllocNamedColor =              85;
enum X_AllocColorCells =              86;
enum X_AllocColorPlanes =             87;
enum X_FreeColors =                   88;
enum X_StoreColors =                  89;
enum X_StoreNamedColor =              90;
enum X_QueryColors =                  91;
enum X_LookupColor =                  92;
enum X_CreateCursor =                 93;
enum X_CreateGlyphCursor =            94;
enum X_FreeCursor =                   95;
enum X_RecolorCursor =                96;
enum X_QueryBestSize =                97;
enum X_QueryExtension =               98;
enum X_ListExtensions =               99;
enum X_ChangeKeyboardMapping =        100;
enum X_GetKeyboardMapping =           101;
enum X_ChangeKeyboardControl =        102;
enum X_GetKeyboardControl =           103;
enum X_Bell =                         104;
enum X_ChangePointerControl =         105;
enum X_GetPointerControl =            106;
enum X_SetScreenSaver =               107;
enum X_GetScreenSaver =               108;
enum X_ChangeHosts =                  109;
enum X_ListHosts =                    110;
enum X_SetAccessControl =             111;
enum X_SetCloseDownMode =             112;
enum X_KillClient =                   113;
enum X_RotateProperties =	       114;
enum X_ForceScreenSaver =	       115;
enum X_SetPointerMapping =            116;
enum X_GetPointerMapping =            117;
enum X_SetModifierMapping =	       118;
enum X_GetModifierMapping =	       119;
enum X_NoOperation =                  127;

/* restore these definitions back to the typedefs in X.h */
 /* XPROTO_H */
