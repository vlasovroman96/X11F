module externs.X11.extensions.compositeproto;
@nogc nothrow:
extern(C): __gshared:
/*
 * Copyright (c) 2006, Oracle and/or its affiliates.
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
 * Copyright © 2003 Keith Packard
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
public import externs.X11.extensions.composite_;

alias Window = CARD32;
alias Region = CARD32;
alias Pixmap = CARD32;

/*
 * requests and replies
 */
struct xCompositeQueryVersionReq {
    CARD8 reqType;
    CARD8 compositeReqType;
    CARD16 length;
    CARD32 majorVersion;
    CARD32 minorVersion;
}

enum sz_xCompositeQueryVersionReq =   12;

struct xCompositeQueryVersionReply {
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

enum sz_xCompositeQueryVersionReply =	32;

struct xCompositeRedirectWindowReq {
    CARD8 reqType;
    CARD8 compositeReqType;
    CARD16 length;
    Window window;
    CARD8 update;
    CARD8 pad1;
    CARD16 pad2;
}

enum sz_xCompositeRedirectWindowReq =	12;

struct xCompositeRedirectSubwindowsReq {
    CARD8 reqType;
    CARD8 compositeReqType;
    CARD16 length;
    Window window;
    CARD8 update;
    CARD8 pad1;
    CARD16 pad2;
}

enum sz_xCompositeRedirectSubwindowsReq =	    12;

struct xCompositeUnredirectWindowReq {
    CARD8 reqType;
    CARD8 compositeReqType;
    CARD16 length;
    Window window;
    CARD8 update;
    CARD8 pad1;
    CARD16 pad2;
}

enum sz_xCompositeUnredirectWindowReq =    12;

struct xCompositeUnredirectSubwindowsReq {
    CARD8 reqType;
    CARD8 compositeReqType;
    CARD16 length;
    Window window;
    CARD8 update;
    CARD8 pad1;
    CARD16 pad2;
}

enum sz_xCompositeUnredirectSubwindowsReq =   12;

struct xCompositeCreateRegionFromBorderClipReq {
    CARD8 reqType;
    CARD8 compositeReqType;
    CARD16 length;
    Region region;
    Window window;
}

enum sz_xCompositeCreateRegionFromBorderClipReq =  12;

/* Version 0.2 additions */

struct xCompositeNameWindowPixmapReq {
    CARD8 reqType;
    CARD8 compositeReqType;
    CARD16 length;
    Window window;
    Pixmap pixmap;
}

enum sz_xCompositeNameWindowPixmapReq =	    12;

/* Version 0.3 additions */

struct xCompositeGetOverlayWindowReq {
    CARD8 reqType;
    CARD8 compositeReqType;
    CARD16 length;
    Window window;
}

enum sz_xCompositeGetOverlayWindowReq = (xCompositeGetOverlayWindowReq).sizeof;

struct xCompositeGetOverlayWindowReply {
    BYTE type;   /* X_Reply */
    BYTE pad1;
    CARD16 sequenceNumber;
    CARD32 length;
    Window overlayWin;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
}

enum sz_xCompositeGetOverlayWindowReply = (xCompositeGetOverlayWindowReply).sizeof;

struct xCompositeReleaseOverlayWindowReq {
    CARD8 reqType;
    CARD8 compositeReqType;
    CARD16 length;
    Window window;
}

enum sz_xCompositeReleaseOverlayWindowReq = (xCompositeReleaseOverlayWindowReq).sizeof;

 /* _COMPOSITEPROTO_H_ */
