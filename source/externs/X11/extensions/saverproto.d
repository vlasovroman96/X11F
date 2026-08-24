module externs.X11.extensions.saverproto;
@nogc nothrow:
extern(C): __gshared:
/*
Copyright (c) 1992  X Consortium

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
X CONSORTIUM BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Except as contained in this notice, the name of the X Consortium shall not be
used in advertising or otherwise to promote the sale, use or other dealings
in this Software without prior written authorization from the X Consortium.
 *
 * Author:  Keith Packard, MIT X Consortium
 */

 
public import externs.X11.extensions.saver;

alias Window = CARD32;
alias Drawable = CARD32;
alias Font = CARD32;
alias Pixmap = CARD32;
alias Cursor = CARD32;
alias Colormap = CARD32;
alias GContext = CARD32;
alias Atom = CARD32;
alias VisualID = CARD32;
alias Time = CARD32;
alias KeyCode = CARD8;
alias KeySym = CARD32;

enum X_ScreenSaverQueryVersion =   0;

public import externs.X11.Xdefs;
public import externs.X11.Xmd;


struct xScreenSaverQueryVersionReq {
    CARD8 reqType;		/* always ScreenSaverReqCode */
    CARD8 saverReqType;		/* always X_ScreenSaverQueryVersion */
    CARD16 length;
    CARD8 clientMajor;
    CARD8 clientMinor;
    CARD16 unused;
}
enum sz_xScreenSaverQueryVersionReq =	8;

struct xScreenSaverQueryVersionReply {
    CARD8 type;			/* X_Reply */
    CARD8 unused;			/* not used */
    CARD16 sequenceNumber;
    CARD32 length;
    CARD16 majorVersion;	/* major version of protocol */
    CARD16 minorVersion;	/* minor version of protocol */
    CARD32 pad0;
    CARD32 pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
}
enum sz_xScreenSaverQueryVersionReply =	32;

enum X_ScreenSaverQueryInfo =   1;

struct xScreenSaverQueryInfoReq {
    CARD8 reqType;		/* always ScreenSaverReqCode */
    CARD8 saverReqType;		/* always X_ScreenSaverQueryInfo */
    CARD16 length;
    Drawable drawable;
}
enum sz_xScreenSaverQueryInfoReq =	8;

struct xScreenSaverQueryInfoReply {
    CARD8 type;			/* X_Reply */
    BYTE state;			/* Off, On */
    CARD16 sequenceNumber;
    CARD32 length;
    Window window;
    CARD32 tilOrSince;
    CARD32 idle;
    CARD32 eventMask;
    BYTE kind;			/* Blanked, Internal, External */
    CARD8 pad0;
    CARD16 pad1;
    CARD32 pad2;
}
enum sz_xScreenSaverQueryInfoReply =	32;

enum X_ScreenSaverSelectInput =   2;

struct xScreenSaverSelectInputReq {
    CARD8 reqType;		/* always ScreenSaverReqCode */
    CARD8 saverReqType;		/* always X_ScreenSaverSelectInput */
    CARD16 length;
    Drawable drawable;
    CARD32 eventMask;
}
enum sz_xScreenSaverSelectInputReq =	12;

enum X_ScreenSaverSetAttributes =   3;

struct xScreenSaverSetAttributesReq {
    CARD8 reqType;		/* always ScreenSaverReqCode */
    CARD8 saverReqType;		/* always X_ScreenSaverSetAttributes */
    CARD16 length;
    Drawable drawable;
    INT16 x, y;
    CARD16 width, height, borderWidth;
    BYTE c_class;
    CARD8 depth;
    VisualID visualID;
    CARD32 mask;
}
enum sz_xScreenSaverSetAttributesReq =	28;

enum X_ScreenSaverUnsetAttributes =   4;

struct xScreenSaverUnsetAttributesReq {
    CARD8 reqType;		/* always ScreenSaverReqCode */
    CARD8 saverReqType;		/* always X_ScreenSaverUnsetAttributes */
    CARD16 length;
    Drawable drawable;
}
enum sz_xScreenSaverUnsetAttributesReq =	8;

enum X_ScreenSaverSuspend =   5;

struct xScreenSaverSuspendReq {
    CARD8 reqType;
    CARD8 saverReqType;
    CARD16 length;
    CARD32 suspend;		/* a boolean, but using the wrong encoding */
}
enum sz_xScreenSaverSuspendReq =	8;

struct xScreenSaverNotifyEvent {
    CARD8 type;			/* always eventBase + ScreenSaverNotify */
    BYTE state;			/* off, on, cycle */
    CARD16 sequenceNumber;
    Time timestamp;
    Window root;
    Window window;		/* screen saver window */
    BYTE kind;			/* blanked, internal, external */
    BYTE forced;
    CARD16 pad0;
    CARD32 pad1;
    CARD32 pad2;
    CARD32 pad3;
}
enum sz_xScreenSaverNotifyEvent =	32;

 /* _SAVERPROTO_H_ */
