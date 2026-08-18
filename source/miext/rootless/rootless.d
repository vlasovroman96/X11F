module miext.rootless.rootless_;
@nogc nothrow:
extern(C): __gshared:
/*
 * External interface to generic rootless mode
 */
/*
 * Copyright (c) 2001 Greg Parker. All Rights Reserved.
 * Copyright (c) 2002-2003 Torrey T. Lyons. All Rights Reserved.
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
 
public import miext.rootless.rootlessConfig;
import include.mi;
public import include.gcstruct;

/*
   Each top-level rootless window has a one-to-one correspondence to a physical
   on-screen window. The physical window is referred to as a "frame".
 */

alias RootlessFrameID = void*;

/*
 * RootlessWindowRec
 *  This structure stores the per-frame data used by the rootless code.
 *  Each top-level X window has one RootlessWindowRec associated with it.
 */
struct _RootlessWindowRec {
    // Position and size includes the window border
    // Position is in per-screen coordinates
    int x, y;
    uint width, height;
    uint borderWidth;
    int level;

    RootlessFrameID wid;        // implementation specific frame id
    WindowPtr win;              // underlying X window

    // Valid only when drawing (ie. is_drawing is set)
    char* pixelData;
    int bytesPerRow;

    PixmapPtr pixmap;

    uint is_drawing;/*:1 !!*/  // Currently drawing?
    uint is_reorder_pending;/*:1 !!*/
    uint is_offscreen;/*:1 !!*/
    uint is_obscured;/*:1 !!*/
}alias RootlessWindowRec = _RootlessWindowRec;
alias RootlessWindowPtr = _RootlessWindowRec*;

/* Offset for screen-local to global coordinate transforms */
int rootlessGlobalOffsetX;
int rootlessGlobalOffsetY;

/* The minimum number of bytes or pixels for which to use the
   implementation's accelerated functions. */
uint rootless_CopyBytes_threshold;
uint rootless_CopyWindow_threshold;

/* Gravity for window contents during resizing */
enum rl_gravity_enum {
    RL_GRAVITY_NONE = 0,        /* no gravity, fill everything */
    RL_GRAVITY_NORTH_WEST = 1,  /* anchor to top-left corner */
    RL_GRAVITY_NORTH_EAST = 2,  /* anchor to top-right corner */
    RL_GRAVITY_SOUTH_EAST = 3,  /* anchor to bottom-right corner */
    RL_GRAVITY_SOUTH_WEST = 4,  /* anchor to bottom-left corner */
}
alias RL_GRAVITY_NONE = rl_gravity_enum.RL_GRAVITY_NONE;
alias RL_GRAVITY_NORTH_WEST = rl_gravity_enum.RL_GRAVITY_NORTH_WEST;
alias RL_GRAVITY_NORTH_EAST = rl_gravity_enum.RL_GRAVITY_NORTH_EAST;
alias RL_GRAVITY_SOUTH_EAST = rl_gravity_enum.RL_GRAVITY_SOUTH_EAST;
alias RL_GRAVITY_SOUTH_WEST = rl_gravity_enum.RL_GRAVITY_SOUTH_WEST;


/*------------------------------------------
   Rootless Implementation Functions
  ------------------------------------------*/

/*
 * Create a new frame.
 *  The frame is created unmapped.
 *
 *  pFrame      RootlessWindowPtr for this frame should be completely
 *              initialized before calling except for pFrame->wid, which
 *              is set by this function.
 *  pScreen     Screen on which to place the new frame
 *  newX, newY  Position of the frame.
 *  pNewShape   Shape for the frame (in frame-local coordinates). NULL for
 *              unshaped frames.
 */
alias RootlessCreateFrameProc = Bool function(RootlessWindowPtr pFrame, ScreenPtr pScreen, int newX, int newY, RegionPtr pNewShape);

/*
 * Destroy a frame.
 *  Drawing is stopped and all updates are flushed before this is called.
 *
 *  wid         Frame id
 */
alias RootlessDestroyFrameProc = void function(RootlessFrameID wid);

/*
 * Move a frame on screen.
 *  Drawing is stopped and all updates are flushed before this is called.
 *
 *  wid         Frame id
 *  pScreen     Screen to move the new frame to
 *  newX, newY  New position of the frame
 */
alias RootlessMoveFrameProc = void function(RootlessFrameID wid, ScreenPtr pScreen, int newX, int newY);

/*
 * Resize and move a frame.
 *  Drawing is stopped and all updates are flushed before this is called.
 *
 *  wid         Frame id
 *  pScreen     Screen to move the new frame to
 *  newX, newY  New position of the frame
 *  newW, newH  New size of the frame
 *  gravity     Gravity for window contents (rl_gravity_enum).
 */
alias RootlessResizeFrameProc = void function(RootlessFrameID wid, ScreenPtr pScreen, int newX, int newY, uint newW, uint newH, uint gravity);

/*
 * Change frame ordering (AKA stacking, layering).
 *  Drawing is stopped before this is called. Unmapped frames are mapped by
 *  setting their ordering.
 *
 *  wid         Frame id
 *  nextWid     Frame id of frame that is now above this one or NULL if this
 *              frame is at the top.
 */
alias RootlessRestackFrameProc = void function(RootlessFrameID wid, RootlessFrameID nextWid);

/*
 * Change frame's shape.
 *  Drawing is stopped before this is called.
 *
 *  wid         Frame id
 *  pNewShape   New shape for the frame (in frame-local coordinates)
 *              or NULL if now unshaped.
 */
alias RootlessReshapeFrameProc = void function(RootlessFrameID wid, RegionPtr pNewShape);

/*
 * Unmap a frame.
 *
 *  wid         Frame id
 */
alias RootlessUnmapFrameProc = void function(RootlessFrameID wid);

/*
 * Start drawing to a frame.
 *  Prepare a frame for direct access to its backing buffer.
 *
 *  wid         Frame id
 *  pixelData   Address of the backing buffer (returned)
 *  bytesPerRow Width in bytes of the backing buffer (returned)
 */
alias RootlessStartDrawingProc = void function(RootlessFrameID wid, char** pixelData, int* bytesPerRow);

/*
 * Stop drawing to a frame.
 *  No drawing to the frame's backing buffer will occur until drawing
 *  is started again.
 *
 *  wid         Frame id
 *  flush       Flush drawing updates for this frame to the screen.
 */
alias RootlessStopDrawingProc = void function(RootlessFrameID wid, Bool flush);

/*
 * Flush drawing updates to the screen.
 *  Drawing is stopped before this is called.
 *
 *  wid         Frame id
 *  pDamage     Region containing all the changed pixels in frame-local
 *              coordinates. This is clipped to the window's clip.
 */
alias RootlessUpdateRegionProc = void function(RootlessFrameID wid, RegionPtr pDamage);

/*
 * Mark damaged rectangles as requiring redisplay to screen.
 *
 *  wid         Frame id
 *  nrects      Number of damaged rectangles
 *  rects       Array of damaged rectangles in frame-local coordinates
 *  shift_x,    Vector to shift rectangles by
 *   shift_y
 */
alias RootlessDamageRectsProc = void function(RootlessFrameID wid, int nrects, const(BoxRec)* rects, int shift_x, int shift_y);

/*
 * Switch the window associated with a frame. (Optional)
 *  When a framed window is reparented, the frame is resized and set to
 *  use the new top-level parent. If defined this function will be called
 *  afterwards for implementation specific bookkeeping.
 *
 *  pFrame      Frame whose window has switched
 *  oldWin      Previous window wrapped by this frame
 */
alias RootlessSwitchWindowProc = void function(RootlessWindowPtr pFrame, WindowPtr oldWin);

/*
 * Check if window should be reordered. (Optional)
 *  The underlying window system may animate windows being ordered in.
 *  We want them to be mapped but remain ordered out until the animation
 *  completes. If defined this function will be called to check if a
 *  framed window should be reordered now. If this function returns
 *  FALSE, the window will still be mapped from the X11 perspective, but
 *  the RestackFrame function will not be called for its frame.
 *
 *  pFrame      Frame to reorder
 */
alias RootlessDoReorderWindowProc = Bool function(RootlessWindowPtr pFrame);

/*
 * Copy bytes. (Optional)
 *  Source and destinate may overlap and the right thing should happen.
 *
 *  width       Bytes to copy per row
 *  height      Number of rows
 *  src         Source data
 *  srcRowBytes Width of source in bytes
 *  dst         Destination data
 *  dstRowBytes Width of destination in bytes
 */
alias RootlessCopyBytesProc = void function(uint width, uint height, const(void)* src, uint srcRowBytes, void* dst, uint dstRowBytes);

/*
 * Copy area in frame to another part of frame. (Optional)
 *
 *  wid         Frame id
 *  dstNrects   Number of rectangles to copy
 *  dstRects    Array of rectangles to copy
 *  dx, dy      Number of pixels away to copy area
 */
alias RootlessCopyWindowProc = void function(RootlessFrameID wid, int dstNrects, const(BoxRec)* dstRects, int dx, int dy);

alias RootlessHideWindowProc = void function(RootlessFrameID wid);

alias RootlessUpdateColormapProc = void function(RootlessFrameID wid, ScreenPtr pScreen);

/*
 * Rootless implementation function list
 */
struct _RootlessFrameProcs {
    RootlessCreateFrameProc CreateFrame;
    RootlessDestroyFrameProc DestroyFrame;

    RootlessMoveFrameProc MoveFrame;
    RootlessResizeFrameProc ResizeFrame;
    RootlessRestackFrameProc RestackFrame;
    RootlessReshapeFrameProc ReshapeFrame;
    RootlessUnmapFrameProc UnmapFrame;

    RootlessStartDrawingProc StartDrawing;
    RootlessStopDrawingProc StopDrawing;
    RootlessUpdateRegionProc UpdateRegion;
    RootlessDamageRectsProc DamageRects;

    /* Optional frame functions */
    RootlessSwitchWindowProc SwitchWindow;
    RootlessDoReorderWindowProc DoReorderWindow;
    RootlessHideWindowProc HideWindow;
    RootlessUpdateColormapProc UpdateColormap;

    /* Optional acceleration functions */
    RootlessCopyBytesProc CopyBytes;
    RootlessCopyWindowProc CopyWindow;
}alias RootlessFrameProcsRec = _RootlessFrameProcs;
alias RootlessFrameProcsPtr = _RootlessFrameProcs*;

/*
 * Initialize rootless mode on the given screen.
 */
Bool RootlessInit(ScreenPtr pScreen, RootlessFrameProcsPtr procs);

/*
 * Return the frame ID for the physical window displaying the given window.
 *
 *  create      If true and the window has no frame, attempt to create one
 */
RootlessFrameID RootlessFrameForWindow(WindowPtr pWin, Bool create);

/*
 * Return the top-level parent of a window.
 *  The root is the top-level parent of itself, even though the root is
 *  not otherwise considered to be a top-level window.
 */
WindowPtr TopLevelParent(WindowPtr pWindow);

/*
 * Prepare a window for direct access to its backing buffer.
 */
void RootlessStartDrawing(WindowPtr pWindow);

/*
 * Finish drawing to a window's backing buffer.
 *
 *  flush       If true, damaged areas are flushed to the screen.
 */
void RootlessStopDrawing(WindowPtr pWindow, Bool flush);

/*
 * Allocate a new screen pixmap.
 *  miCreateScreenResources does not do this properly with a null
 *  framebuffer pointer.
 */
void RootlessUpdateScreenPixmap(ScreenPtr pScreen);

/*
 * Reposition all windows on a screen to their correct positions.
 */
void RootlessRepositionWindows(ScreenPtr pScreen);

/*
 * Bring all windows to the front of the native stack
 */
void RootlessOrderAllWindows(Bool include_unhitable);
                          /* _ROOTLESS_H */
