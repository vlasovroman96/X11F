module include.xf86Priv;
@nogc nothrow:
extern(C): __gshared:
/*
 * Copyright (c) 1997-2002 by The XFree86 Project, Inc.
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
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
 * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
 * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
 * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 *
 * Except as contained in this notice, the name of the copyright holder(s)
 * and author(s) shall not be used in advertising or otherwise to promote
 * the sale, use or other dealings in this Software without prior written
 * authorization from the copyright holder(s) and author(s).
 */

/*
 * This file contains declarations for private XFree86 functions and variables,
 * and definitions of private macros.
 *
 * "private" means not available to video drivers.
 */

 
public import include.xlibre_ptrtypes;
public import include.include.xf86Privstr;
public import include.input;

extern int xf86FbBpp;
extern int  xf86Depth;

/* Other parameters */

// extern xf86InfoRec xf86Info;
// extern serverLayoutRec xf86ConfigLayout;

// extern void * xf86DriverList;
// extern int  xf86NumScreens;

// extern ScrnInfoPtr *xf86GPUScreens;      /* List of pointers to ScrnInfoRecs */
// extern int xf86NumGPUScreens;
extern int  xf86DRMMasterFd;              /* Command line argument for DRM master file descriptor */
enum DEFAULT_DPI =		96;


/* xf86Bus.c */
extern void  xf86BusProbe();
extern void  xf86AddDevToEntity(int entityIndex, GDevPtr dev);

                          /* _XF86PRIV_H */
