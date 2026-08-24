module externs.X11.extensions.shapeconst;
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

 
/*
 * Protocol requests constants and alignment values
 * These would really be in SHAPE's X.h and Xproto.h equivalents
 */

enum SHAPENAME = "SHAPE";

enum SHAPE_MAJOR_VERSION =	1	/* current version numbers */;
enum SHAPE_MINOR_VERSION =	1;

enum ShapeSet =			0;
enum ShapeUnion =			1;
enum ShapeIntersect =			2;
enum ShapeSubtract =			3;
enum ShapeInvert =			4;

enum ShapeBounding =			0;
enum ShapeClip =			1;
enum ShapeInput =			2;

enum ShapeNotifyMask =			(1L << 0);
enum ShapeNotify =			0;

enum ShapeNumberEvents =		(ShapeNotify + 1);

 /* _SHAPECONST_H_ */
