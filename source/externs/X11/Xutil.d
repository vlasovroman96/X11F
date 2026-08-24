module externs.X11.Xutil;
@nogc nothrow:
extern(C): __gshared:

private template HasVersion(string versionId) {
	mixin("version("~versionId~") {enum HasVersion = true;} else {enum HasVersion = false;}");
}
import core.stdc.config: c_long, c_ulong;
import core.stdc.stddef: wchar_t;

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

 
/* You must include <X11/Xlib.h> before including this file */
// #include <X11/Xlib.h>
public import externs.X11.keysym;
import externs.X11.Xmd;
import externs.X11.Xdefs;
import externs.X11.X;
import externs.X11.Xlib;


/* The Xlib structs are full of implicit padding to properly align members.
   We can't clean that up without breaking ABI, so tell clang not to bother
   complaining about it. */
// version (__clang__) {
// #pragma clang diagnostic push
// #pragma clang diagnostic ignored "-Wpadded"
// }

/*
 * Bitmask returned by XParseGeometry().  Each bit tells if the corresponding
 * value (x, y, width, height) was found in the parsed string.
 */
enum NoValue =		0x0000;
enum XValue =  	0x0001;
enum YValue =		0x0002;
enum WidthValue =  	0x0004;
enum HeightValue =  	0x0008;
enum AllValues = 	0x000F;
enum XNegative = 	0x0010;
enum YNegative = 	0x0020;

/*
 * new version containing base_width, base_height, and win_gravity fields;
 * used with WM_NORMAL_HINTS.
 */
struct XSizeHints {
    	c_long flags;	/* marks which fields in this structure are defined */
	int x, y;		/* obsolete for new window mgrs, but clients */
	int width, height;	/* should set so old wm's don't mess up */
	int min_width, min_height;
	int max_width, max_height;
    	int width_inc, height_inc;
	struct _Min_aspect {
		int x;	/* numerator */
		int y;	/* denominator */
	}_Min_aspect min_aspect;  
	_Min_aspect max_aspect;
	int base_width, base_height;		/* added by ICCCM version 1 */
	int win_gravity;			/* added by ICCCM version 1 */
}

/*
 * The next block of definitions are for window manager properties that
 * clients and applications use for communication.
 */

/* flags argument in size hints */
enum USPosition =	(1L << 0) /* user specified x, y */;
enum USSize =		(1L << 1) /* user specified width, height */;

enum PPosition =	(1L << 2) /* program specified position */;
enum PSize =		(1L << 3) /* program specified size */;
enum PMinSize =	(1L << 4) /* program specified minimum size */;
enum PMaxSize =	(1L << 5) /* program specified maximum size */;
enum PResizeInc =	(1L << 6) /* program specified resize increments */;
enum PAspect =		(1L << 7) /* program specified min and max aspect ratios */;
enum PBaseSize =	(1L << 8) /* program specified base for incrementing */;
enum PWinGravity =	(1L << 9) /* program specified window gravity */;

/* obsolete */
enum PAllHints = (PPosition|PSize|PMinSize|PMaxSize|PResizeInc|PAspect);



struct XWMHints {
	c_long flags;	/* marks which fields in this structure are defined */
	Bool input;	/* does this application rely on the window manager to
			get keyboard input? */
	int initial_state;	/* see below */
	Pixmap icon_pixmap;	/* pixmap to be used as icon */
	Window icon_window; 	/* window to be used as icon */
	int icon_x, icon_y; 	/* initial position of icon */
	Pixmap icon_mask;	/* icon mask bitmap */
	XID window_group;	/* id of related window group */
	/* this structure may be extended in the future */
}

/* definition for flags of XWMHints */

enum InputHint = 		(1L << 0);
enum StateHint = 		(1L << 1);
enum IconPixmapHint =		(1L << 2);
enum IconWindowHint =		(1L << 3);
enum IconPositionHint = 	(1L << 4);
enum IconMaskHint =		(1L << 5);
enum WindowGroupHint =		(1L << 6);
enum AllHints = (InputHint|StateHint|IconPixmapHint|IconWindowHint| 
IconPositionHint|IconMaskHint|WindowGroupHint);
enum XUrgencyHint =		(1L << 8);

/* definitions for initial window state */
enum WithdrawnState = 0	/* for windows that are not mapped */;
enum NormalState = 1	/* most applications want to start this way */;
enum IconicState = 3	/* application wants to start as an icon */;

/*
 * Obsolete states no longer defined by ICCCM
 */
enum DontCareState = 0	/* don't know or care */;
enum ZoomState = 2	/* application wants to start zoomed */;
enum InactiveState = 4	/* application believes it is seldom used; */;
			/* some wm's may put it on inactive menu */


/*
 * new structure for manipulating TEXT properties; used with WM_NAME,
 * WM_ICON_NAME, WM_CLIENT_MACHINE, and WM_COMMAND.
 */
struct XTextProperty {
    ubyte* value;		/* same as Property routines */
    Atom encoding;			/* prop type */
    int format;				/* prop data format: 8, 16, or 32 */
    c_ulong nitems;		/* number of data items in value */
}

enum XNoMemory = -1;
enum XLocaleNotSupported = -2;
enum XConverterNotFound = -3;

enum XICCEncodingStyle {
    XStringStyle,		/* STRING */
    XCompoundTextStyle,		/* COMPOUND_TEXT */
    XTextStyle,			/* text in owner's encoding (current locale)*/
    XStdICCTextStyle,		/* STRING, else COMPOUND_TEXT */
    /* The following is an XFree86 extension, introduced in November 2000 */
    XUTF8StringStyle		/* UTF8_STRING */
}
alias XStringStyle = XICCEncodingStyle.XStringStyle;
alias XCompoundTextStyle = XICCEncodingStyle.XCompoundTextStyle;
alias XTextStyle = XICCEncodingStyle.XTextStyle;
alias XStdICCTextStyle = XICCEncodingStyle.XStdICCTextStyle;
alias XUTF8StringStyle = XICCEncodingStyle.XUTF8StringStyle;


struct XIconSize {
	int min_width, min_height;
	int max_width, max_height;
	int width_inc, height_inc;
}

struct XClassHint {
	char* res_name;
	char* res_class;
}

version (XUTIL_DEFINE_FUNCTIONS) {
extern int XDestroyImage(XImage* ximage);
extern c_ulong XGetPixel(XImage* ximage, int x, int y);
extern int XPutPixel(XImage* ximage, int x, int y, c_ulong pixel);
extern XImage* XSubImage(XImage* ximage, int x, int y, uint width, uint height);
extern int XAddPixel(XImage* ximage, c_long value);
} else {
/*
 * These macros are used to give some sugar to the image routines so that
 * naive people are more comfortable with them.
 */
enum string XDestroyImage(string ximage) = `
	((*((` ~ ximage ~ `).f.destroy_image))((` ~ ximage ~ `)))`;
enum string XGetPixel(string ximage, string x, string y) = `
	((*((` ~ ximage ~ `).f.get_pixel))((` ~ ximage ~ `), (` ~ x ~ `), (` ~ y ~ `)))`;
enum string XPutPixel(string ximage, string x, string y, string pixel) = `
	((*((` ~ ximage ~ `).f.put_pixel))((` ~ ximage ~ `), (` ~ x ~ `), (` ~ y ~ `), (` ~ pixel ~ `)))`;
enum string XSubImage(string ximage, string x, string y, string width, string height) = `
	((*((` ~ ximage ~ `).f.sub_image))((` ~ ximage ~ `), (` ~ x ~ `), (` ~ y ~ `), (` ~ width ~ `), (` ~ height ~ `)))`;
enum string XAddPixel(string ximage, string value) = `
	((*((` ~ ximage ~ `).f.add_pixel))((` ~ ximage ~ `), (` ~ value ~ `)))`;
}

/*
 * Compose sequence status structure, used in calling XLookupString.
 */
struct XComposeStatus {
    XPointer compose_ptr;	/* state table pointer */
    int chars_matched;		/* match state */
}

/*
 * Keysym macros, used on Keysyms to test for classes of symbols
 */
enum string IsKeypadKey(string keysym) = `
  ((cast(KeySym)(` ~ keysym ~ `) >= XK_KP_Space) && (cast(KeySym)(` ~ keysym ~ `) <= XK_KP_Equal))`;

enum string IsPrivateKeypadKey(string keysym) = `
  ((cast(KeySym)(` ~ keysym ~ `) >= 0x11000000) && (cast(KeySym)(` ~ keysym ~ `) <= 0x1100FFFF))`;

enum string IsCursorKey(string keysym) = `
  ((cast(KeySym)(` ~ keysym ~ `) >= XK_Home)     && (cast(KeySym)(` ~ keysym ~ `) <  XK_Select))`;

enum string IsPFKey(string keysym) = `
  ((cast(KeySym)(` ~ keysym ~ `) >= XK_KP_F1)     && (cast(KeySym)(` ~ keysym ~ `) <= XK_KP_F4))`;

enum string IsFunctionKey(string keysym) = `
  ((cast(KeySym)(` ~ keysym ~ `) >= XK_F1)       && (cast(KeySym)(` ~ keysym ~ `) <= XK_F35))`;

enum string IsMiscFunctionKey(string keysym) = `
  ((cast(KeySym)(` ~ keysym ~ `) >= XK_Select)   && (cast(KeySym)(` ~ keysym ~ `) <= XK_Break))`;

version (XK_XKB_KEYS) {
enum string IsModifierKey(string keysym) = `
  (((cast(KeySym)(` ~ keysym ~ `) >= XK_Shift_L) && (cast(KeySym)(` ~ keysym ~ `) <= XK_Hyper_R)) 
   || ((cast(KeySym)(` ~ keysym ~ `) >= XK_ISO_Lock) && 
       (cast(KeySym)(` ~ keysym ~ `) <= XK_ISO_Level5_Lock)) 
   || (cast(KeySym)(` ~ keysym ~ `) == XK_Mode_switch) 
   || (cast(KeySym)(` ~ keysym ~ `) == XK_Num_Lock))`;
} else {
enum string IsModifierKey(string keysym) = `
  (((cast(KeySym)(` ~ keysym ~ `) >= XK_Shift_L) && (cast(KeySym)(` ~ keysym ~ `) <= XK_Hyper_R)) 
   || (cast(KeySym)(` ~ keysym ~ `) == XK_Mode_switch) 
   || (cast(KeySym)(` ~ keysym ~ `) == XK_Num_Lock))`;
}
/*
 * opaque reference to Region data type
 */
extern struct _XRegion;
alias Region = _XRegion*;

/* Return values from XRectInRegion() */

enum RectangleOut = 0;
enum RectangleIn =  1;
enum RectanglePart = 2;


/*
 * Information used by the visual utility routines to find desired visual
 * type from the many visuals a display may support.
 */

struct XVisualInfo {
  Visual* visual;
  VisualID visualid;
  int screen;
  int depth;
static if (HasVersion!"none" || HasVersion!"c_plusplus") {
  int c_class;					/* C++ */
} else {
  int class_;
}
  c_ulong red_mask;
  c_ulong green_mask;
  c_ulong blue_mask;
  int colormap_size;
  int bits_per_rgb;
}

enum VisualNoMask =		0x0;
enum VisualIDMask = 		0x1;
enum VisualScreenMask =	0x2;
enum VisualDepthMask =		0x4;
enum VisualClassMask =		0x8;
enum VisualRedMaskMask =	0x10;
enum VisualGreenMaskMask =	0x20;
enum VisualBlueMaskMask =	0x40;
enum VisualColormapSizeMask =	0x80;
enum VisualBitsPerRGBMask =	0x100;
enum VisualAllMask =		0x1FF;

/*
 * This defines a window manager property that clients may use to
 * share standard color maps of type RGB_COLOR_MAP:
 */
struct XStandardColormap {
	Colormap colormap;
	c_ulong red_max;
	c_ulong red_mult;
	c_ulong green_max;
	c_ulong green_mult;
	c_ulong blue_max;
	c_ulong blue_mult;
	c_ulong base_pixel;
	VisualID visualid;		/* added by ICCCM version 1 */
	XID killid;			/* added by ICCCM version 1 */
}

enum ReleaseByFreeingColormap = (cast(XID) 1L)  /* for killid field above */;


/*
 * return codes for XReadBitmapFile and XWriteBitmapFile
 */
enum BitmapSuccess =		0;
enum BitmapOpenFailed = 	1;
enum BitmapFileInvalid = 	2;
enum BitmapNoMemory =		3;

/****************************************************************
 *
 * Context Management
 *
 ****************************************************************/


/* Associative lookup table return codes */

enum XCSUCCESS = 0	/* No error. */;
enum XCNOMEM =   1    /* Out of memory */;
enum XCNOENT =   2    /* No entry in table */;

alias XContext = int;

enum string XUniqueContext() = `(cast(XContext) XrmUniqueQuark())`;
enum string XStringToContext(string string) = `(cast(XContext) XrmStringToQuark(` ~ string ~ `))`;

extern void* XAllocClassHint();

extern XIconSize* XAllocIconSize();

extern XSizeHints* XAllocSizeHints();

extern XStandardColormap* XAllocStandardColormap();

extern XWMHints* XAllocWMHints();

extern int XClipBox(Region, XRectangle*);

extern Region XCreateRegion();

extern const(char)* XDefaultString();

extern int XDeleteContext(Display*, XID, XContext);

extern int XDestroyRegion(Region);

extern Bool XEmptyRegion(Region);

extern Bool XEqualRegion(Region, Region);

extern int XFindContext(Display*, XID, XContext, XPointer*);

extern Status XGetClassHint(Display*, Window, XClassHint*);

extern Status XGetIconSizes(Display*, Window, XIconSize**, int*);

extern Status XGetNormalHints(Display*, Window, XSizeHints*);

extern Status XGetRGBColormaps(Display*, Window, XStandardColormap**, int*, Atom);

extern Status XGetSizeHints(Display*, Window, XSizeHints*, Atom);

extern Status XGetStandardColormap(Display*, Window, XStandardColormap*, Atom);

extern Status XGetTextProperty(Display*, Window, XTextProperty*, Atom);

extern XVisualInfo* XGetVisualInfo(Display*, c_long, XVisualInfo*, int*);

extern Status XGetWMClientMachine(Display*, Window, XTextProperty*);

extern XWMHints* XGetWMHints(Display*, Window);

extern Status XGetWMIconName(Display*, Window, XTextProperty*);

extern Status XGetWMName(Display*, Window, XTextProperty*);

extern Status XGetWMNormalHints(Display*, Window, XSizeHints*, c_long*);

extern Status XGetWMSizeHints(Display*, Window, XSizeHints*, c_long*, Atom);

extern Status XGetZoomHints(Display*, Window, XSizeHints*);

extern int XIntersectRegion(Region, Region, Region);

extern void XConvertCase(KeySym, KeySym*, KeySym*);

extern int XLookupString(XKeyEvent*, char*, int, KeySym*, XComposeStatus*);

extern Status XMatchVisualInfo(Display*, int, int, int, XVisualInfo*);

extern int XOffsetRegion(Region, int, int);

extern Bool XPointInRegion(Region, int, int);

extern Region XPolygonRegion(XPoint*, int, int);

extern int XRectInRegion(Region, int, int, uint, uint);

extern int XSaveContext(Display*, XID, XContext, const char*);

extern int XSetClassHint(Display*, Window, XClassHint*);

extern int XSetIconSizes(Display*, Window, XIconSize*, int);

extern int XSetNormalHints(Display*, Window, XSizeHints*);

extern void XSetRGBColormaps(Display*, Window, XStandardColormap*, int, Atom);

extern int XSetSizeHints(Display*, Window, XSizeHints*, Atom);

extern int XSetStandardProperties(Display*, Window, const char*, const char*, Pixmap, char**, int, XSizeHints*);

extern void XSetTextProperty(Display*, Window, XTextProperty*, Atom);

extern void XSetWMClientMachine(Display*, Window, XTextProperty*);

extern int XSetWMHints(Display*, Window, XWMHints*);

extern void XSetWMIconName(Display*, Window, XTextProperty*);

extern void XSetWMName(Display*, Window, XTextProperty*);

extern void XSetWMNormalHints(Display*, Window, XSizeHints*);

extern void XSetWMProperties(Display*, Window, XTextProperty*, XTextProperty*, char**, int, XSizeHints*, XWMHints*, XClassHint*);

extern void XmbSetWMProperties(Display*, Window, const char*, const char*, char**, int, XSizeHints*, XWMHints*, XClassHint*);

extern void Xutf8SetWMProperties(Display*, Window, const char*, const char*, char**, int, XSizeHints*, XWMHints*, XClassHint*);

extern void XSetWMSizeHints(Display*, Window, XSizeHints*, Atom);

extern int XSetRegion(Display*, GC, Region);

extern void XSetStandardColormap(Display*, Window, XStandardColormap*, Atom);

extern int XSetZoomHints(Display*, Window, XSizeHints*);

extern int XShrinkRegion(Region, int, int);

extern Status XStringListToTextProperty(char**, int, XTextProperty*);

extern int XSubtractRegion(Region, Region, Region);

extern int XmbTextListToTextProperty(Display* display, char** list, int count, XICCEncodingStyle style, XTextProperty* text_prop_return);

extern int XwcTextListToTextProperty(Display* display, wchar_t** list, int count, XICCEncodingStyle style, XTextProperty* text_prop_return);

extern int Xutf8TextListToTextProperty(Display* display, char** list, int count, XICCEncodingStyle style, XTextProperty* text_prop_return);

extern void XwcFreeStringList(wchar_t** list);

extern Status XTextPropertyToStringList(XTextProperty*, char***, int*);

extern int XmbTextPropertyToTextList(Display* display, const(XTextProperty)* text_prop, char*** list_return, int* count_return);

extern int XwcTextPropertyToTextList(Display* display, const(XTextProperty)* text_prop, wchar_t*** list_return, int* count_return);

extern int Xutf8TextPropertyToTextList(Display* display, const(XTextProperty)* text_prop, char*** list_return, int* count_return);

extern int XUnionRectWithRegion(XRectangle*, Region, Region);

extern int XUnionRegion(Region, Region, Region);

extern int XWMGeometry(Display*, int, const char*, const char*, uint, XSizeHints*, int*, int*, int*, int*, int*);

extern int XXorRegion(Region, Region, Region);

// version (__clang__) {
// #pragma clang diagnostic pop
// }

// _XFUNCPROTOEND

 /* _X11_XUTIL_H_ */
