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
import include.wfbrename;
import include.fb;

mixin template Iteration8() {
    alias BRESSOLID   = fbBresSolid8;
    alias BRESDASH    = fbBresDash8;
    alias DOTS        = fbDots8;
    alias ARC         = fbArc8;
    alias GLYPH       = fbGlyph8;
    alias POLYLINE    = fbPolyline8;
    alias POLYSEGMENT = fbPolySegment8;
    alias BITS  = BYTE;
    alias BITS2 = CARD16;
    alias BITS4 = CARD32;
	import fb.fbbits_h;
}

mixin template Iteration16() {
	import fb.fbbits_h;
    alias BRESSOLID   = fbBresSolid16;
    alias BRESDASH    = fbBresDash16;
    alias DOTS        = fbDots16;
    alias ARC         = fbArc16;
    alias GLYPH       = fbGlyph16;
    alias POLYLINE    = fbPolyline16;
    alias POLYSEGMENT = fbPolySegment16;
    alias BITS  = CARD16;
    alias BITS2 = CARD32;
}

mixin template Iteration32() {
    alias BRESSOLID   = fbBresSolid32;
    alias BRESDASH    = fbBresDash32;
    alias DOTS        = fbDots32;
    alias ARC         = fbArc32;
    alias GLYPH       = fbGlyph32;
    alias POLYLINE    = fbPolyline32;
    alias POLYSEGMENT = fbPolySegment32;
    alias BITS  = CARD32;

	import fb.fbbits_h;
}


mixin Iteration8 i8;
mixin Iteration16 i16;
mixin Iteration32 i32;