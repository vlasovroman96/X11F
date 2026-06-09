module include.window;
@nogc nothrow:
extern(C): __gshared:
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

 
public import externs.X11.Xproto;

public import include.xlibre_ptrtypes;
public import include.misc;
public import include.regionstr;
public import include.screenint;
import include.propertyst;

enum TOTALLY_OBSCURED = 0;
enum UNOBSCURED = 1;
enum OBSCURED = 2;

enum VisibilityNotViewable =	3;

/* return values for tree-walking callback procedures */
enum WT_STOPWALKING =		0;
enum WT_WALKCHILDREN =		1;
enum WT_DONTWALKCHILDREN =	2;
enum WT_NOMATCH = 3;
enum NullWindow = cast(WindowPtr) 0;

/* Forward declaration, we can't include input.h here */
struct _DeviceIntRec;
struct _Cursor;

struct _BackingStore; 
alias BackingStorePtr = _BackingStore*;
alias PropertyPtr = _Property*;

enum RootClipMode {
    ROOT_CLIP_NONE = 0, /**< resize the root window to 0x0 */
    ROOT_CLIP_FULL = 1, /**< resize the root window to fit screen */
    ROOT_CLIP_INPUT_ONLY = 2, /**< as above, but no rendering to screen */
}
alias ROOT_CLIP_NONE = RootClipMode.ROOT_CLIP_NONE;
alias ROOT_CLIP_FULL = RootClipMode.ROOT_CLIP_FULL;
alias ROOT_CLIP_INPUT_ONLY = RootClipMode.ROOT_CLIP_INPUT_ONLY;


alias VisitWindowProcPtr = int function(WindowPtr pWin, void* data);

extern int TraverseTree(WindowPtr pWin, VisitWindowProcPtr func, void* data);

extern int WalkTree(ScreenPtr pScreen, VisitWindowProcPtr func, void* data);

extern bool CreateRootWindow(ScreenPtr);

extern void InitRootWindow(WindowPtr);

alias RealChildHeadProc = WindowPtr function(WindowPtr pWin);

extern void RegisterRealChildHeadProc(RealChildHeadProc proc);

extern WindowPtr RealChildHead(WindowPtr);

extern int DeleteWindow(void* pWin, XID wid);

extern int DestroySubwindows(WindowPtr, ClientPtr);

/* Quartz support on Mac OS X uses the HIToolbox
   framework whose ChangeWindowAttributes function conflicts here. */
version (OSX) {
enum ChangeWindowAttributes = Darwin_X_ChangeWindowAttributes;
}
extern int ChangeWindowAttributes(WindowPtr, Mask, XID*, ClientPtr);

extern int ChangeWindowDeviceCursor(WindowPtr, _DeviceIntRec*, _Cursor*);

extern _Cursor* WindowGetDeviceCursor(WindowPtr, _DeviceIntRec*);

/* Quartz support on Mac OS X uses the HIToolbox
   framework whose GetWindowAttributes function conflicts here. */
version (OSX) {
   extern void Darwin_X_GetWindowAttributes(
                                             WindowPtr /*pWin */ ,
                                             ClientPtr /*client */ ,
                                             xGetWindowAttributesReply *
                                             /* wa */ );
   alias GetWindowAttributes = Darwin_X_GetWindowAttributes; 
}
else {

   void GetWindowAttributes(
                                             WindowPtr /*pWin */ ,
                                             ClientPtr /*client */ ,
                                             xGetWindowAttributesReply *
                                             /* wa */ );
}

extern void GravityTranslate(int, int, int, int, int, int, uint, int*, int*);

extern int ConfigureWindow(WindowPtr, Mask, XID*, ClientPtr);

extern int CirculateWindow(WindowPtr, int, ClientPtr);

extern int ReparentWindow(WindowPtr, WindowPtr, int, int, ClientPtr);

extern int MapWindow(WindowPtr, ClientPtr);

extern void MapSubwindows(WindowPtr, ClientPtr);

extern int UnmapWindow(WindowPtr, Bool);

extern void UnmapSubwindows(WindowPtr);

extern void HandleSaveSet(ClientPtr);

extern bool PointInWindowIsVisible(WindowPtr, int, int);

extern RegionPtr NotClippedByChildren(WindowPtr);

extern void SendVisibilityNotify(WindowPtr);

extern int dixSaveScreens(ClientPtr client, int on, int mode);

extern int SaveScreens(int on, int mode);

extern WindowPtr FindWindowWithOptional(WindowPtr);

extern void CheckWindowOptionalNeed(WindowPtr);

extern WindowPtr MoveWindowInStack(WindowPtr, WindowPtr);

extern void SetWinSize(WindowPtr);

extern void SetBorderSize(WindowPtr);

extern void ResizeChildrenWinSize(WindowPtr, int, int, int, int);

extern void SendShapeNotify(WindowPtr, int);

extern RegionPtr CreateBoundingShape(WindowPtr);

extern RegionPtr CreateClipShape(WindowPtr);

extern void SetRootClip(ScreenPtr pScreen, int enable);

extern VisualPtr WindowGetVisual(WindowPtr);                         /* WINDOW_H */
