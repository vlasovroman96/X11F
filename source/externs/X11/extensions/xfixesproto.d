module externs.X11.extensions.xfixesproto;
@nogc nothrow:
extern(C): __gshared:
/*
 * Copyright (c) 2006, Oracle and/or its affiliates.
 * Copyright 2010 Red Hat, Inc.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice (including the next
 * paragraph) shall be included in all copies or substantial portions of the
 * Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 */
/*
 * Copyright © 2002 Keith Packard, member of The XFree86 Project, Inc.
 *
 * Permission to use, copy, modify, distribute, and sell this software and its
 * documentation for any purpose is hereby granted without fee, provided that
 * the above copyright notice appear in all copies and that both that
 * copyright notice and this permission notice appear in supporting
 * documentation, and that the name of Keith Packard not be used in
 * advertising or publicity pertaining to distribution of the software without
 * specific, written prior permission.  Keith Packard makes no
 * representations about the suitability of this software for any purpose.  It
 * is provided "as is" without express or implied warranty.
 *
 * KEITH PACKARD DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
 * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
 * EVENT SHALL KEITH PACKARD BE LIABLE FOR ANY SPECIAL, INDIRECT OR
 * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
 * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
 * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
 * PERFORMANCE OF THIS SOFTWARE.
 */

 
public import externs.X11.Xmd;
public import externs.X11.extensions.xfixeswire;
public import externs.X11.extensions.shapeconst;

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
alias Picture = CARD32;

/*************** Version 1 ******************/

struct xXFixesReq {
    CARD8 reqType;
    CARD8 xfixesReqType;
    CARD16 length;
}

/*
 * requests and replies
 */
struct xXFixesQueryVersionReq {
    CARD8 reqType;
    CARD8 xfixesReqType;
    CARD16 length;
    CARD32 majorVersion;
    CARD32 minorVersion;
}

enum sz_xXFixesQueryVersionReq =   12;

struct xXFixesQueryVersionReply {
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

enum sz_xXFixesQueryVersionReply =	32;

struct xXFixesChangeSaveSetReq {
    CARD8 reqType;
    CARD8 xfixesReqType;
    CARD16 length;
    BYTE mode;	    /* SetModeInsert/SetModeDelete*/
    BYTE target;	    /* SaveSetNearest/SaveSetRoot*/
    BYTE map;	    /* SaveSetMap/SaveSetUnmap */
    BYTE pad1;
    Window window;
}

enum sz_xXFixesChangeSaveSetReq =	12;

struct xXFixesSelectSelectionInputReq {
    CARD8 reqType;
    CARD8 xfixesReqType;
    CARD16 length;
    Window window;
    Atom selection;
    CARD32 eventMask;
}

enum sz_xXFixesSelectSelectionInputReq =   16;

struct xXFixesSelectionNotifyEvent {
    CARD8 type;
    CARD8 subtype;
    CARD16 sequenceNumber;
    Window window;
    Window owner;
    Atom selection;
    Time timestamp;
    Time selectionTimestamp;
    CARD32 pad2;
    CARD32 pad3;
}

struct xXFixesSelectCursorInputReq {
    CARD8 reqType;
    CARD8 xfixesReqType;
    CARD16 length;
    Window window;
    CARD32 eventMask;
}

enum sz_xXFixesSelectCursorInputReq =	12;

struct xXFixesCursorNotifyEvent {
    CARD8 type;
    CARD8 subtype;
    CARD16 sequenceNumber;
    Window window;
    CARD32 cursorSerial;
    Time timestamp;
    Atom name;	    /* Version 2 */
    CARD32 pad1;
    CARD32 pad2;
    CARD32 pad3;
}

struct xXFixesGetCursorImageReq {
    CARD8 reqType;
    CARD8 xfixesReqType;
    CARD16 length;
}

enum sz_xXFixesGetCursorImageReq = 4;

struct xXFixesGetCursorImageReply {
    BYTE type;   /* X_Reply */
    BYTE pad1;
    CARD16 sequenceNumber;
    CARD32 length;
    INT16 x;
    INT16 y;
    CARD16 width;
    CARD16 height;
    CARD16 xhot;
    CARD16 yhot;
    CARD32 cursorSerial;
    CARD32 pad2;
    CARD32 pad3;
}

enum sz_xXFixesGetCursorImageReply =	32;

/*************** Version 2 ******************/

alias Region = CARD32;

struct xXFixesCreateRegionReq {
    CARD8 reqType;
    CARD8 xfixesReqType;
    CARD16 length;
    Region region;
    /* LISTofRECTANGLE */
}

enum sz_xXFixesCreateRegionReq =	8;

struct xXFixesCreateRegionFromBitmapReq {
    CARD8 reqType;
    CARD8 xfixesReqType;
    CARD16 length;
    Region region;
    Pixmap bitmap;
}

enum sz_xXFixesCreateRegionFromBitmapReq =	12;

struct xXFixesCreateRegionFromWindowReq {
    CARD8 reqType;
    CARD8 xfixesReqType;
    CARD16 length;
    Region region;
    Window window;
    CARD8 kind;
    CARD8 pad1;
    CARD16 pad2;
}

enum sz_xXFixesCreateRegionFromWindowReq =	16;

struct xXFixesCreateRegionFromGCReq {
    CARD8 reqType;
    CARD8 xfixesReqType;
    CARD16 length;
    Region region;
    GContext gc;
}

enum sz_xXFixesCreateRegionFromGCReq =	12;

struct xXFixesCreateRegionFromPictureReq {
    CARD8 reqType;
    CARD8 xfixesReqType;
    CARD16 length;
    Region region;
    Picture picture;
}

enum sz_xXFixesCreateRegionFromPictureReq =	12;

struct xXFixesDestroyRegionReq {
    CARD8 reqType;
    CARD8 xfixesReqType;
    CARD16 length;
    Region region;
}

enum sz_xXFixesDestroyRegionReq =	8;

struct xXFixesSetRegionReq {
    CARD8 reqType;
    CARD8 xfixesReqType;
    CARD16 length;
    Region region;
    /* LISTofRECTANGLE */
}

enum sz_xXFixesSetRegionReq =		8;

struct xXFixesCopyRegionReq {
    CARD8 reqType;
    CARD8 xfixesReqType;
    CARD16 length;
    Region source;
    Region destination;
}

enum sz_xXFixesCopyRegionReq =		12;

struct _XXFixesCombineRegionReq {
    CARD8 reqType;
    CARD8 xfixesReqType;
    CARD16 length;
    Region source1;
    Region source2;
    Region destination;
}alias xXFixesCombineRegionReq = _XXFixesCombineRegionReq;
alias xXFixesUnionRegionReq = xXFixesCombineRegionReq;
alias xXFixesIntersectRegionReq = xXFixesCombineRegionReq;
alias xXFixesSubtractRegionReq = xXFixesCombineRegionReq;

enum sz_xXFixesCombineRegionReq =	16;
enum sz_xXFixesUnionRegionReq =	sz_xXFixesCombineRegionReq;
enum sz_xXFixesIntersectRegionReq =	sz_xXFixesCombineRegionReq;
enum sz_xXFixesSubtractRegionReq =	sz_xXFixesCombineRegionReq;

struct xXFixesInvertRegionReq {
    CARD8 reqType;
    CARD8 xfixesReqType;
    CARD16 length;
    Region source;
    INT16 x, y;
    CARD16 width, height;
    Region destination;
}

enum sz_xXFixesInvertRegionReq =	20;

struct xXFixesTranslateRegionReq {
    CARD8 reqType;
    CARD8 xfixesReqType;
    CARD16 length;
    Region region;
    INT16 dx, dy;
}

enum sz_xXFixesTranslateRegionReq =	12;

struct xXFixesRegionExtentsReq {
    CARD8 reqType;
    CARD8 xfixesReqType;
    CARD16 length;
    Region source;
    Region destination;
}

enum sz_xXFixesRegionExtentsReq =	12;

struct xXFixesFetchRegionReq {
    CARD8 reqType;
    CARD8 xfixesReqType;
    CARD16 length;
    Region region;
}

enum sz_xXFixesFetchRegionReq =	8;

struct xXFixesFetchRegionReply {
    BYTE type;   /* X_Reply */
    BYTE pad1;
    CARD16 sequenceNumber;
    CARD32 length;
    INT16 x, y;
    CARD16 width, height;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
}

enum sz_xXFixesFetchRegionReply =	32;

struct xXFixesSetGCClipRegionReq {
    CARD8 reqType;
    CARD8 xfixesReqType;
    CARD16 length;
    GContext gc;
    Region region;
    INT16 xOrigin, yOrigin;
}

enum sz_xXFixesSetGCClipRegionReq =	16;

struct xXFixesSetWindowShapeRegionReq {
    CARD8 reqType;
    CARD8 xfixesReqType;
    CARD16 length;
    Window dest;
    BYTE destKind;
    CARD8 pad1;
    CARD16 pad2;
    INT16 xOff, yOff;
    Region region;
}

enum sz_xXFixesSetWindowShapeRegionReq =	20;

struct xXFixesSetPictureClipRegionReq {
    CARD8 reqType;
    CARD8 xfixesReqType;
    CARD16 length;
    Picture picture;
    Region region;
    INT16 xOrigin, yOrigin;
}

enum sz_xXFixesSetPictureClipRegionReq =   16;

struct xXFixesSetCursorNameReq {
    CARD8 reqType;
    CARD8 xfixesReqType;
    CARD16 length;
    Cursor cursor;
    CARD16 nbytes;
    CARD16 pad;
}

enum sz_xXFixesSetCursorNameReq =	    12;

struct xXFixesGetCursorNameReq {
    CARD8 reqType;
    CARD8 xfixesReqType;
    CARD16 length;
    Cursor cursor;
}

enum sz_xXFixesGetCursorNameReq =	    8;

struct xXFixesGetCursorNameReply {
    BYTE type;   /* X_Reply */
    BYTE pad1;
    CARD16 sequenceNumber;
    CARD32 length;
    Atom atom;
    CARD16 nbytes;
    CARD16 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
}

enum sz_xXFixesGetCursorNameReply =	    32;

struct xXFixesGetCursorImageAndNameReq {
    CARD8 reqType;
    CARD8 xfixesReqType;
    CARD16 length;
}

enum sz_xXFixesGetCursorImageAndNameReq =  4;

struct xXFixesGetCursorImageAndNameReply {
    BYTE type;   /* X_Reply */
    BYTE pad1;
    CARD16 sequenceNumber;
    CARD32 length;
    INT16 x;
    INT16 y;
    CARD16 width;
    CARD16 height;
    CARD16 xhot;
    CARD16 yhot;
    CARD32 cursorSerial;
    Atom cursorName;
    CARD16 nbytes;
    CARD16 pad;
}

enum sz_xXFixesGetCursorImageAndNameReply =	32;

struct xXFixesChangeCursorReq {
    CARD8 reqType;
    CARD8 xfixesReqType;
    CARD16 length;
    Cursor source;
    Cursor destination;
}

enum sz_xXFixesChangeCursorReq =	12;

struct xXFixesChangeCursorByNameReq {
    CARD8 reqType;
    CARD8 xfixesReqType;
    CARD16 length;
    Cursor source;
    CARD16 nbytes;
    CARD16 pad;
}

enum sz_xXFixesChangeCursorByNameReq =	12;

/*************** Version 3 ******************/

struct xXFixesExpandRegionReq {
    CARD8 reqType;
    CARD8 xfixesReqType;
    CARD16 length;
    Region source;
    Region destination;
    CARD16 left;
    CARD16 right;
    CARD16 top;
    CARD16 bottom;
}

enum sz_xXFixesExpandRegionReq =	20;

/*************** Version 4.0 ******************/

struct xXFixesHideCursorReq {
    CARD8 reqType;
    CARD8 xfixesReqType;
    CARD16 length;
    Window window;
}

enum sz_xXFixesHideCursorReq =	xXFixesHideCursorReq.sizeof;

struct xXFixesShowCursorReq {
    CARD8 reqType;
    CARD8 xfixesReqType;
    CARD16 length;
    Window window;
}

enum sz_xXFixesShowCursorReq =	xXFixesShowCursorReq.sizeof;

/*************** Version 5.0 ******************/

alias Barrier = CARD32;

struct xXFixesCreatePointerBarrierReq {
    CARD8 reqType;
    CARD8 xfixesReqType;
    CARD16 length;
    Barrier barrier;
    Window window;
    INT16 x1;
    INT16 y1;
    INT16 x2;
    INT16 y2;
    CARD32 directions;
    CARD16 pad;
    CARD16 num_devices;
    /* array of CARD16 devices */
}

enum sz_xXFixesCreatePointerBarrierReq = 28;

struct xXFixesDestroyPointerBarrierReq {
    CARD8 reqType;
    CARD8 xfixesReqType;
    CARD16 length;
    Barrier barrier;
}

enum sz_xXFixesDestroyPointerBarrierReq = 8;

/*************** Version 6.0 ******************/

struct xXFixesSetClientDisconnectModeReq {
    CARD8 reqType;
    CARD8 xfixesReqType;
    CARD16 length;
    CARD32 disconnect_mode;
}

enum sz_xXFixesSetClientDisconnectModeReq =    8;

struct xXFixesGetClientDisconnectModeReq {
    CARD8 reqType;
    CARD8 xfixesReqType;
    CARD16 length;
}

enum sz_xXFixesGetClientDisconnectModeReq =    4;

struct xXFixesGetClientDisconnectModeReply {
    BYTE type;                   /* X_Reply */
    CARD8 pad0;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 disconnect_mode;
    CARD32 pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
}

enum sz_xXFixesGetClientDisconnectModeReply =	32;

 /* _XFIXESPROTO_H_ */
