module miext.rootless.rootlessCommon;
@nogc nothrow:
extern(C): __gshared:
import core.stdc.config: c_long, c_ulong;
/*
 * Common internal rootless definitions and code
 */
/*
 * Copyright (c) 2001 Greg Parker. All Rights Reserved.
 * Copyright (c) 2002-2004 Torrey T. Lyons. All Rights Reserved.
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
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * THE ABOVE LISTED COPYRIGHT HOLDER(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
 * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
 * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 * Except as contained in this notice, the name(s) of the above copyright
 * holders shall not be used in advertising or otherwise to promote the sale,
 * use or other dealings in this Software without prior written authorization.
 */
 
public import core.stdc.stdint;

public import misc;
public import miext.rootless.rootless_;
public import include.fb;

public import include.scrnintstr;

public import include.picturestr;

// Debug output, or not.
version (ROOTLESSDEBUG) {
enum RL_DEBUG_MSG = ErrorF;
} else {
//#define RL_DEBUG_MSG(a, ...)
}

// Global variables
extern DevPrivateKeyRec rootlessGCPrivateKeyRec;

enum rootlessGCPrivateKey = (&rootlessGCPrivateKeyRec);

extern DevPrivateKeyRec rootlessScreenPrivateKeyRec;

enum rootlessScreenPrivateKey = (&rootlessScreenPrivateKeyRec);

extern DevPrivateKeyRec rootlessWindowPrivateKeyRec;

enum rootlessWindowPrivateKey = (&rootlessWindowPrivateKeyRec);

extern DevPrivateKeyRec rootlessWindowOldPixmapPrivateKeyRec;

enum rootlessWindowOldPixmapPrivateKey = (&rootlessWindowOldPixmapPrivateKeyRec);

// RootlessGCRec: private per-gc data
struct RootlessGCRec {
    const(GCFuncs)* originalFuncs;
    const(GCOps)* originalOps;
}

// RootlessScreenRec: per-screen private data
struct _RootlessScreenRec {
    // Rootless implementation functions
    RootlessFrameProcsPtr imp;

    // Wrapped screen functions
    CreateWindowProcPtr CreateWindow;
    RealizeWindowProcPtr RealizeWindow;
    UnrealizeWindowProcPtr UnrealizeWindow;
    MoveWindowProcPtr MoveWindow;
    ResizeWindowProcPtr ResizeWindow;
    RestackWindowProcPtr RestackWindow;
    ReparentWindowProcPtr ReparentWindow;
    ChangeBorderWidthProcPtr ChangeBorderWidth;
    ChangeWindowAttributesProcPtr ChangeWindowAttributes;
    PaintWindowProcPtr PaintWindow;

    CreateGCProcPtr CreateGC;
    CopyWindowProcPtr CopyWindow;
    GetImageProcPtr GetImage;
    SourceValidateProcPtr SourceValidate;

    MarkOverlappedWindowsProcPtr MarkOverlappedWindows;
    ValidateTreeProcPtr ValidateTree;

    SetShapeProcPtr SetShape;

    CompositeProcPtr Composite;
    GlyphsProcPtr Glyphs;
    TrapezoidsProcPtr Trapezoids;
    TrianglesProcPtr Triangles;
    CompositeRectsProcPtr CompositeRects;

    InstallColormapProcPtr InstallColormap;
    UninstallColormapProcPtr UninstallColormap;
    StoreColorsProcPtr StoreColors;

    void* pixmap_data;
    uint pixmap_data_size;

    ColormapPtr colormap;

    void* redisplay_timer;
    uint redisplay_timer_set;/*:1 !!*/
    uint redisplay_queued;/*:1 !!*/
    uint redisplay_expired;/*:1 !!*/
    uint colormap_changed;/*:1 !!*/
}alias RootlessScreenRec = _RootlessScreenRec;
alias RootlessScreenPtr = _RootlessScreenRec*;

// "Definition of the Porting Layer for the X11 Sample Server" says
// unwrap and rewrap of screen functions is unnecessary, but
// screen->CreateGC changes after a call to cfbCreateGC.

enum string SCREEN_UNWRAP(string screen, string fn) = `
    ` ~ screen ~ `.` ~ fn ~ ` = SCREENREC(` ~ screen ~ `).` ~ fn ~ `;`;

enum string SCREEN_WRAP(string screen, string fn) = `\
    SCREENREC(screen)->fn = screen->fn; \
    screen->fn = Rootless##fn`;

// Accessors for screen and window privates

enum string SCREENREC(string pScreen) = `(cast(RootlessScreenRec*) 
    dixLookupPrivate(&(` ~ pScreen ~ `).devPrivates, rootlessScreenPrivateKey))`;

enum string SETSCREENREC(string pScreen, string v) = `
    dixSetPrivate(&(` ~ pScreen ~ `).devPrivates, rootlessScreenPrivateKey, ` ~ v ~ `)`;

enum string WINREC(string pWin) = `(cast(RootlessWindowRec*) 
    dixLookupPrivate(&(` ~ pWin ~ `).devPrivates, rootlessWindowPrivateKey))`;

enum string SETWINREC(string pWin, string v) = `
    dixSetPrivate(&(` ~ pWin ~ `).devPrivates, rootlessWindowPrivateKey, ` ~ v ~ `)`;

// Call a rootless implementation function.
// Many rootless implementation functions are allowed to be NULL.
enum string CallFrameProc(string pScreen, string proc, string params) = `\
    if (SCREENREC(pScreen)->frameProcs.proc) {          \
        RL_DEBUG_MSG("calling frame proc " #proc " ");  \
        SCREENREC(pScreen)->frameProcs.proc params;     \
    }`;

// BoxRec manipulators
// Copied from shadowfb

enum string TRIM_BOX(string box, string pGC) = `{ 
    BoxPtr extents = &` ~ pGC ~ `.pCompositeClip.extents;
    if(` ~ box ~ `.x1 < extents.x1) ` ~ box ~ `.x1 = extents.x1; 
    if(` ~ box ~ `.x2 > extents.x2) ` ~ box ~ `.x2 = extents.x2; 
    if(` ~ box ~ `.y1 < extents.y1) ` ~ box ~ `.y1 = extents.y1; 
    if(` ~ box ~ `.y2 > extents.y2) ` ~ box ~ `.y2 = extents.y2; 
}`;

enum string TRANSLATE_BOX(string box, string pDraw) = `{ 
    ` ~ box ~ `.x1 += ` ~ pDraw ~ `.x; 
    ` ~ box ~ `.x2 += ` ~ pDraw ~ `.x; 
    ` ~ box ~ `.y1 += ` ~ pDraw ~ `.y; 
    ` ~ box ~ `.y2 += ` ~ pDraw ~ `.y; 
}`;

enum string TRIM_AND_TRANSLATE_BOX(string box, string pDraw, string pGC) = `{ 
    ` ~ TRANSLATE_BOX!(box, pDraw) ~ `; 
    ` ~ TRIM_BOX!(box, pGC) ~ `; 
}`;

enum string BOX_NOT_EMPTY(string box) = `
    (((` ~ box ~ `.x2 - ` ~ box ~ `.x1) > 0) && ((` ~ box ~ `.y2 - ` ~ box ~ `.y1) > 0))`;

// HUGE_ROOT and NORMAL_ROOT
// We don't want to clip windows to the edge of the screen.
// HUGE_ROOT temporarily makes the root window really big.
// This is needed as a wrapper around any function that calls
// SetWinSize or SetBorderSize which clip a window against its
// parents, including the root.

extern RegionRec rootlessHugeRoot;

enum string HUGE_ROOT(string pWin) = `
    do {                                        
        WindowPtr _w = ` ~ pWin ~ `;                     
        while (_w.parent)                       
            _w = _w.parent;                      
        saveRoot = _w.winSize;                  
        _w.winSize = rootlessHugeRoot;          
    } while (0)`;

enum string NORMAL_ROOT(string pWin) = `
    do {                                        
        WindowPtr _w = ` ~ pWin ~ `;                     
        while (_w.parent)                       
            _w = _w.parent;                      
        _w.winSize = saveRoot;                  
    } while (0)`;

// Returns TRUE if this window is a top-level window (i.e. child of the root)
// The root is not a top-level window.
enum string IsTopLevel(string pWin) = `
    ((` ~ pWin ~ `)  &&  (` ~ pWin ~ `).parent  &&  !(` ~ pWin ~ `).parent.parent)`;

// Returns TRUE if this window is a root window
enum string IsRoot(string pWin) = `
    ((` ~ pWin ~ `) == (` ~ pWin ~ `).drawable.pScreen.root)`;

/*
 * SetPixmapBaseToScreen
 *  Move the given pixmap's base address to where pixel (0, 0)
 *  would be if the pixmap's actual data started at (x, y).
 *  Can't access the bits before the first word of the drawable's data in
 *  rootless mode, so make sure our base address is always 32-bit aligned.
 */
enum string SetPixmapBaseToScreen(string pix, string _x, string _y) = `do { 
    ` ~ pix ~ `.screen_x = ` ~ _x ~ `; 
    ` ~ pix ~ `.screen_y = ` ~ _y ~ `; 
} while(0)`;

// Returns TRUE if this window is visible inside a frame
// (e.g. it is visible and has a top-level or root parent)
Bool IsFramedWindow(WindowPtr pWin);

// Routines that cause regions to get redrawn.
// DamageRegion and DamageRect are in global coordinates.
// DamageBox is in window-local coordinates.
void RootlessDamageRegion(WindowPtr pWindow, RegionPtr pRegion);
void RootlessDamageRect(WindowPtr pWindow, int x, int y, int w, int h);
void RootlessDamageBox(WindowPtr pWindow, BoxPtr pBox);
void RootlessRedisplay(WindowPtr pWindow);
void RootlessRedisplayScreen(ScreenPtr pScreen);

void RootlessQueueRedisplay(ScreenPtr pScreen);

/* Return the colormap currently installed on the given screen. */
ColormapPtr RootlessGetColormap(ScreenPtr pScreen);

/* Convert colormap to ARGB. */
Bool RootlessResolveColormap(ScreenPtr pScreen, int first_color, int n_colors, uint* colors);

void RootlessFlushWindowColormap(WindowPtr pWin);
void RootlessFlushScreenColormaps(ScreenPtr pScreen);

// Move a window to its proper location on the screen.
void RootlessRepositionWindow(WindowPtr pWin);

// Move the window to its correct place in the physical stacking order.
void RootlessReorderWindow(WindowPtr pWin);

void RootlessScreenExpose(ScreenPtr pScreen);
void RootlessHideAllWindows();
void RootlessShowAllWindows();
void RootlessUpdateRooted(Bool state);

void RootlessEnableRoot(ScreenPtr pScreen);
void RootlessDisableRoot(ScreenPtr pScreen);

void RootlessSetPixmapOfAncestors(WindowPtr pWin);

c_ulong RootlessWID(WindowPtr pWindow);
                          /* _ROOTLESSCOMMON_H */
