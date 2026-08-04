module externs.xcb.xcb_pixel;
@nogc nothrow:
extern(C): __gshared:
 
/* Copyright (C) 2007 Bart Massey
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 * 
 * Except as contained in this notice, the names of the authors or their
 * institutions shall not be used in advertising or otherwise to promote the
 * sale, use or other dealings in this Software without prior written
 * authorization from the authors.
 */

public import core.stdc.inttypes;
public import externs.X11.Xfuncproto;
version (BUILD) {} else {
public import externs.xcb.xcb_bitops;
public import externs.xcb.xcb_image;
}

/**
 * XCB Image fast pixel ops.
 *
 * Fast inline versions of xcb_image_get_pixel() and
 * xcb_image_put_pixel() for various common cases.
 * The naming convention is xcb_image_put_pixel_FUB()
 * where F is the format and is either XY for bitmaps
 * or Z for pixmaps, U is the bitmap unit size or pixmap
 * bits-per-pixel, and B is the endianness (if needed)
 * and is either M for most-significant-first or L for
 * least-significant-first.  Note that no checking
 * is done on the arguments to these routines---caller beware.
 * Also note that the pixel type is chosen to be appropriate
 * to the unit; bitmaps use int and pixmaps use the appropriate
 * size of unsigned.
 * @ingroup xcb__image_t
 */

private auto xcb_image_put_pixel_XY32M(xcb_image_t* image, uint x, uint y, int pixel)
{
  uint unit = (x >> 3) & ~xcb_mask(2);
  uint byte_ = xcb_mask(2) - ((x >> 3) & xcb_mask(2));
  uint bit = xcb_mask(3) - (x & xcb_mask(3));
  ubyte m = 1 << bit;
  ubyte p = pixel << bit;
  ubyte* bp = image.data + (y * image.stride) + (unit | byte_);
  *bp = (*bp & ~m) | p;
}

private auto xcb_image_put_pixel_XY32L(xcb_image_t* image, uint x, uint y, int pixel)
{
  uint bit = x & xcb_mask(3);
  ubyte m = 1 << bit;
  ubyte p = pixel << bit;
  ubyte* bp = image.data + (y * image.stride) + (x >> 3);
  *bp = (*bp & ~m) | p;
}

private auto xcb_image_get_pixel_XY32M(xcb_image_t* image, uint x, uint y)
{
  uint unit = (x >> 3) & ~xcb_mask(2);
  uint byte_ = xcb_mask(2) - ((x >> 3) & xcb_mask(2));
  uint bit = xcb_mask(3) - (x & xcb_mask(3));
  ubyte* bp = image.data + (y * image.stride) + (unit | byte_);
  return (*bp >> bit) & 1;
}

private auto xcb_image_get_pixel_XY32L(xcb_image_t* image, uint x, uint y)
{
  uint bit = x & xcb_mask(3);
  ubyte* bp = image.data + (y * image.stride) + (x >> 3);
  return (*bp >> bit) & 1;
}

private auto xcb_image_put_pixel_Z8(xcb_image_t* image, uint x, uint y, ubyte pixel)
{
  image.data[x + y * image.stride] = pixel;
}

private auto xcb_image_get_pixel_Z8(xcb_image_t* image, uint x, uint y)
{
  return image.data[x + y * image.stride];
}

private auto xcb_image_put_pixel_Z32M(xcb_image_t* image, uint x, uint y, uint pixel)
{
  ubyte* row = image.data + (y * image.stride);
  row[x << 2] = pixel >> 24;
  row[(x << 2) + 1] = pixel >> 16;
  row[(x << 2) + 2] = pixel >> 8;
  row[(x << 2) + 3] = pixel;
}

private auto xcb_image_put_pixel_Z32L(xcb_image_t* image, uint x, uint y, uint pixel)
{
  ubyte* row = image.data + (y * image.stride);
  row[x << 2] = pixel;
  row[(x << 2) + 1] = pixel >> 8;
  row[(x << 2) + 2] = pixel >> 16;
  row[(x << 2) + 3] = pixel >> 24;
}

private auto xcb_image_get_pixel_Z32M(xcb_image_t* image, uint x, uint y)
{
  ubyte* row = image.data + (y * image.stride);
  uint pixel = row[x << 2] << 24;
  pixel |= row[(x << 2) + 1] << 16;
  pixel |= row[(x << 2) + 2] << 8;
  return pixel | row[(x << 2) + 3];
}

private auto xcb_image_get_pixel_Z32L(xcb_image_t* image, uint x, uint y)
{
  ubyte* row = image.data + (y * image.stride);
  uint pixel = row[x << 2];
  pixel |= row[(x << 2) + 1] << 8;
  pixel |= row[(x << 2) + 2] << 16;
  return pixel | row[(x << 2) + 3] << 24;
}

 /* __XCB_PIXEL_H__ */
