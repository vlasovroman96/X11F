module fb.fbbits;;
@nogc nothrow:
extern(C): __gshared:
/*
 * Copyright © 1998 Keith Packard
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

import build.dix_config;

mixin template Iteration8() {
    enum BRESSOLID   = fbBresSolid8;
    enum BRESDASH    = fbBresDash8;
    enum DOTS        = fbDots8;
    enum ARC         = fbArc8;
    enum GLYPH       = fbGlyph8;
    enum POLYLINE    = fbPolyline8;
    enum POLYSEGMENT = fbPolySegment8;
    alias BITS  = BYTE;
    alias BITS2 = CARD16;
    alias BITS4 = CARD32;
	mixin(import("fbbits.d"));
}

mixin template Iteration16() {
    enum BRESSOLID   = fbBresSolid16;
    enum BRESDASH    = fbBresDash16;
    enum DOTS        = fbDots16;
    enum ARC         = fbArc16;
    enum GLYPH       = fbGlyph16;
    enum POLYLINE    = fbPolyline16;
    enum POLYSEGMENT = fbPolySegment16;
    alias BITS  = CARD16;
    alias BITS2 = CARD32;
	mixin(import("fbbits.d"));
}

mixin template Iteration32() {
    enum BRESSOLID   = fbBresSolid32;
    enum BRESDASH    = fbBresDash32;
    enum DOTS        = fbDots32;
    enum ARC         = fbArc32;
    enum GLYPH       = fbGlyph32;
    enum POLYLINE    = fbPolyline32;
    enum POLYSEGMENT = fbPolySegment32;
    alias BITS  = CARD32;

	mixin(import("fbbits.d"));
}


mixin Iteration8 i8;
mixin Iteration16 i16;
mixin Iteration32 i32;