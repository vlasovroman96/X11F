module externs.X11.extensions.ge;
@nogc nothrow:
extern(C): __gshared:
/*
 * Copyright © 2007-2008 Peter Hutterer
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
 *
 * Authors: Peter Hutterer, University of South Australia, NICTA
 *
 */

 
enum GE_NAME =         "Generic Event Extension";
enum GE_MAJOR =        1;
enum GE_MINOR =        0;

/*********************************************************
 *
 * Requests
 *
 */

enum X_GEQueryVersion =        0;

enum GENumberRequests =       (X_GEQueryVersion + 1);

/*********************************************************
 *
 * Events
 *
 */

enum GENumberEvents =        0;

/*********************************************************
 *
 * Errors
 *
 */

enum GENumberErrors =        0;

 /* _GE_H_ */
