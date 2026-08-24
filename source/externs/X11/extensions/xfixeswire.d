module externs.X11.extensions.xfixeswire;
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


 
enum XFIXES_NAME =	"XFIXES";
enum XFIXES_MAJOR =	6;
enum XFIXES_MINOR =	0;

/*************** Version 1 ******************/
enum X_XFixesQueryVersion =		    0;
enum X_XFixesChangeSaveSet =		    1;
enum X_XFixesSelectSelectionInput =	    2;
enum X_XFixesSelectCursorInput =	    3;
enum X_XFixesGetCursorImage =		    4;
/*************** Version 2 ******************/
enum X_XFixesCreateRegion =		    5;
enum X_XFixesCreateRegionFromBitmap =	    6;
enum X_XFixesCreateRegionFromWindow =	    7;
enum X_XFixesCreateRegionFromGC =	    8;
enum X_XFixesCreateRegionFromPicture =	    9;
enum X_XFixesDestroyRegion =		    10;
enum X_XFixesSetRegion =		    11;
enum X_XFixesCopyRegion =		    12;
enum X_XFixesUnionRegion =		    13;
enum X_XFixesIntersectRegion =		    14;
enum X_XFixesSubtractRegion =		    15;
enum X_XFixesInvertRegion =		    16;
enum X_XFixesTranslateRegion =		    17;
enum X_XFixesRegionExtents =		    18;
enum X_XFixesFetchRegion =		    19;
enum X_XFixesSetGCClipRegion =		    20;
enum X_XFixesSetWindowShapeRegion =	    21;
enum X_XFixesSetPictureClipRegion =	    22;
enum X_XFixesSetCursorName =		    23;
enum X_XFixesGetCursorName =		    24;
enum X_XFixesGetCursorImageAndName =	    25;
enum X_XFixesChangeCursor =		    26;
enum X_XFixesChangeCursorByName =	    27;
/*************** Version 3 ******************/
enum X_XFixesExpandRegion =		    28;
/*************** Version 4 ******************/
enum X_XFixesHideCursor =		    29;
enum X_XFixesShowCursor =		    30;
/*************** Version 5 ******************/
enum X_XFixesCreatePointerBarrier =	    31;
enum X_XFixesDestroyPointerBarrier =	    32;
/*************** Version 6 ******************/
enum X_XFixesSetClientDisconnectMode =	    33;
enum X_XFixesGetClientDisconnectMode =	    34;

enum XFixesNumberRequests =		    (X_XFixesGetClientDisconnectMode+1);

/* Selection events share one event number */
enum XFixesSelectionNotify =		    0;

/* Within the selection, the 'subtype' field distinguishes */
enum XFixesSetSelectionOwnerNotify =	    0;
enum XFixesSelectionWindowDestroyNotify =  1;
enum XFixesSelectionClientCloseNotify =    2;

enum XFixesSetSelectionOwnerNotifyMask =	(1L << 0);
enum XFixesSelectionWindowDestroyNotifyMask =	(1L << 1);
enum XFixesSelectionClientCloseNotifyMask =	(1L << 2);

/* There's only one cursor event so far */
enum XFixesCursorNotify =		    1;

enum XFixesDisplayCursorNotify =	    0;

enum XFixesDisplayCursorNotifyMask =	    (1L << 0);

enum XFixesNumberEvents =		    (2);

/* errors */
enum BadRegion =			    0;
enum BadBarrier =			    1;
enum XFixesNumberErrors =		    (BadBarrier+1);

enum SaveSetNearest =			    0;
enum SaveSetRoot =			    1;

enum SaveSetMap =			    0;
enum SaveSetUnmap =			    1;

/*************** Version 2 ******************/

enum WindowRegionBounding =		    0;
enum WindowRegionClip =		    1;

/*************** Version 5 ******************/

enum BarrierPositiveX =		    (1L << 0);
enum BarrierPositiveY =		    (1L << 1);
enum BarrierNegativeX =		    (1L << 2);
enum BarrierNegativeY =		    (1L << 3);

/*************** Version 6 ******************/

/* The default server behaviour */
enum XFixesClientDisconnectFlagDefault =   0;
/* The server may disconnect this client to shut down */
enum XFixesClientDisconnectFlagTerminate =  (1L << 0);

/*************** Version 6.1 ******************/

/* The server must terminate if this client exits */
enum XFixesClientDisconnectFlagForceTerminate =  (1L << 1);

	/* _XFIXESWIRE_H_ */
