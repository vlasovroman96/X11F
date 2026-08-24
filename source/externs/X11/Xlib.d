module externs.X11.Xlib;
@nogc nothrow:
extern(C): __gshared:

private template HasVersion(string versionId) {
	mixin("version("~versionId~") {enum HasVersion = true;} else {enum HasVersion = false;}");
}
import core.stdc.config: c_long, c_ulong;
import core.stdc.stddef: wchar_t;
/*

Copyright 1985, 1986, 1987, 1991, 1998  The Open Group

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

*/


/*
 *	Xlib.h - Header definition and support file for the C subroutine
 *	interface library (Xlib) to the X Window System Protocol (V11).
 *	Structures and symbols starting with "_" are private to the library.
 */
 
enum XlibSpecificationRelease = 6;

public import core.sys.posix.sys.types;

static if (HasVersion!"__SCO__" || HasVersion!"__UNIXWARE__") {
public import core.stdc.stdint;
}

public import externs.X11.X;

/* applications should not depend on these two headers being included! */
public import externs.X11.Xfuncproto;
public import externs.X11.Xosdefs;

version (X_WCHAR) {} else {
public import core.stdc.stddef;
} version (X_WCHAR) {
/* replace this with #include or appropriate for your system */
alias wchar_t = c_ulong;
}


extern int _Xmblen(char* str, int len);

/* API mentioning "UTF8" or "utf8" is an XFree86 extension, introduced in
   November 2000. Its presence is indicated through the following macro. */
enum X_HAVE_UTF8_STRING = 1;

/* The Xlib structs are full of implicit padding to properly align members.
   We can't clean that up without breaking ABI, so tell clang not to bother
   complaining about it. */
// version (__clang__) {
// #pragma clang diagnostic push
// #pragma clang diagnostic ignored "-Wpadded"
// }

alias XPointer = char*;

alias Bool = int;
alias Status = int;
enum True = 1;
enum False = 0;

enum QueuedAlready = 0;
enum QueuedAfterReading = 1;
enum QueuedAfterFlush = 2;

enum string ConnectionNumber(string dpy) = `((cast(_XPrivDisplay)(` ~ dpy ~ `)).fd)`;
enum string RootWindow(string dpy, string scr) = `(ScreenOfDisplay(` ~ dpy ~ `,` ~ scr ~ `).root)`;
enum string DefaultScreen(string dpy) = `((cast(_XPrivDisplay)(` ~ dpy ~ `)).default_screen)`;
enum string DefaultRootWindow(string dpy) = `(ScreenOfDisplay(` ~ dpy ~ `,` ~ DefaultScreen!(dpy) ~ `).root)`;
enum string DefaultVisual(string dpy, string scr) = `(ScreenOfDisplay(` ~ dpy ~ `,` ~ scr ~ `).root_visual)`;
enum string DefaultGC(string dpy, string scr) = `(ScreenOfDisplay(` ~ dpy ~ `,` ~ scr ~ `).default_gc)`;
enum string BlackPixel(string dpy, string scr) = `(ScreenOfDisplay(` ~ dpy ~ `,` ~ scr ~ `).black_pixel)`;
enum string WhitePixel(string dpy, string scr) = `(ScreenOfDisplay(` ~ dpy ~ `,` ~ scr ~ `).white_pixel)`;
enum AllPlanes = 		(cast(ulong)~0L);
enum string QLength(string dpy) = `((cast(_XPrivDisplay)(` ~ dpy ~ `)).qlen)`;
enum string DisplayWidth(string dpy, string scr) = `(ScreenOfDisplay(` ~ dpy ~ `,` ~ scr ~ `).width)`;
enum string DisplayHeight(string dpy, string scr) = `(ScreenOfDisplay(` ~ dpy ~ `,` ~ scr ~ `).height)`;
enum string DisplayWidthMM(string dpy, string scr) = `(ScreenOfDisplay(` ~ dpy ~ `,` ~ scr ~ `).mwidth)`;
enum string DisplayHeightMM(string dpy, string scr) = `(ScreenOfDisplay(` ~ dpy ~ `,` ~ scr ~ `).mheight)`;
enum string DisplayPlanes(string dpy, string scr) = `(ScreenOfDisplay(` ~ dpy ~ `,` ~ scr ~ `).root_depth)`;
enum string DisplayCells(string dpy, string scr) = `(` ~ DefaultVisual!(dpy,scr) ~ `.map_entries)`;
enum string ScreenCount(string dpy) = `((cast(_XPrivDisplay)(` ~ dpy ~ `)).nscreens)`;
enum string ServerVendor(string dpy) = `((cast(_XPrivDisplay)(` ~ dpy ~ `)).vendor)`;
enum string ProtocolVersion(string dpy) = `((cast(_XPrivDisplay)(` ~ dpy ~ `)).proto_major_version)`;
enum string ProtocolRevision(string dpy) = `((cast(_XPrivDisplay)(` ~ dpy ~ `)).proto_minor_version)`;
enum string VendorRelease(string dpy) = `((cast(_XPrivDisplay)(` ~ dpy ~ `)).release)`;
enum string DisplayString(string dpy) = `((cast(_XPrivDisplay)(` ~ dpy ~ `)).display_name)`;
enum string DefaultDepth(string dpy, string scr) = `(ScreenOfDisplay(` ~ dpy ~ `,` ~ scr ~ `).root_depth)`;
enum string DefaultColormap(string dpy, string scr) = `(ScreenOfDisplay(` ~ dpy ~ `,` ~ scr ~ `).cmap)`;
enum string BitmapUnit(string dpy) = `((cast(_XPrivDisplay)(` ~ dpy ~ `)).bitmap_unit)`;
enum string BitmapBitOrder(string dpy) = `((cast(_XPrivDisplay)(` ~ dpy ~ `)).bitmap_bit_order)`;
enum string BitmapPad(string dpy) = `((cast(_XPrivDisplay)(` ~ dpy ~ `)).bitmap_pad)`;
enum string ImageByteOrder(string dpy) = `((cast(_XPrivDisplay)(` ~ dpy ~ `)).byte_order)`;
enum string NextRequest(string dpy) = `((cast(_XPrivDisplay)(` ~ dpy ~ `)).request + 1)`;
enum string LastKnownRequestProcessed(string dpy) = `((cast(_XPrivDisplay)(` ~ dpy ~ `)).last_request_read)`;

/* macros for screen oriented applications (toolkit) */
enum string ScreenOfDisplay(string dpy, string scr) = `(&(cast(_XPrivDisplay)(` ~ dpy ~ `)).screens[` ~ scr ~ `])`;
enum string DefaultScreenOfDisplay(string dpy) = `` ~ ScreenOfDisplay!(dpy,DefaultScreen!(dpy)) ~ ``;
enum string DisplayOfScreen(string s) = `((` ~ s ~ `).display)`;
enum string RootWindowOfScreen(string s) = `((` ~ s ~ `).root)`;
enum string BlackPixelOfScreen(string s) = `((` ~ s ~ `).black_pixel)`;
enum string WhitePixelOfScreen(string s) = `((` ~ s ~ `).white_pixel)`;
enum string DefaultColormapOfScreen(string s) = `((` ~ s ~ `).cmap)`;
enum string DefaultDepthOfScreen(string s) = `((` ~ s ~ `).root_depth)`;
enum string DefaultGCOfScreen(string s) = `((` ~ s ~ `).default_gc)`;
enum string DefaultVisualOfScreen(string s) = `((` ~ s ~ `).root_visual)`;
enum string WidthOfScreen(string s) = `((` ~ s ~ `).width)`;
enum string HeightOfScreen(string s) = `((` ~ s ~ `).height)`;
enum string WidthMMOfScreen(string s) = `((` ~ s ~ `).mwidth)`;
enum string HeightMMOfScreen(string s) = `((` ~ s ~ `).mheight)`;
enum string PlanesOfScreen(string s) = `((` ~ s ~ `).root_depth)`;
enum string CellsOfScreen(string s) = `(` ~ DefaultVisualOfScreen!(`(` ~ s ~ `)`) ~ `.map_entries)`;
enum string MinCmapsOfScreen(string s) = `((` ~ s ~ `).min_maps)`;
enum string MaxCmapsOfScreen(string s) = `((` ~ s ~ `).max_maps)`;
enum string DoesSaveUnders(string s) = `((` ~ s ~ `).save_unders)`;
enum string DoesBackingStore(string s) = `((` ~ s ~ `).backing_store)`;
enum string EventMaskOfScreen(string s) = `((` ~ s ~ `).root_input_mask)`;

/*
 * Extensions need a way to hang private data on some structures.
 */
struct _XExtData {
	int number;		/* number returned by XRegisterExtension */
	_XExtData* next;	/* next item on list of data for structure */
	int function(_XExtData* extension) free_private;
	XPointer private_data;	/* data private to this extension. */
}
alias XExtData = _XExtData; 

/*
 * This file contains structures used by the extension mechanism.
 */
struct XExtCodes {		/* public to extension, cannot be changed */
	int extension;		/* extension number */
	int major_opcode;	/* major op-code assigned by server */
	int first_event;	/* first event number for the extension */
	int first_error;	/* first error number for the extension */
}

/*
 * Data structure for retrieving info about pixmap formats.
 */

struct XPixmapFormatValues {
    int depth;
    int bits_per_pixel;
    int scanline_pad;
}


/*
 * Data structure for setting graphics context.
 */
struct XGCValues {
	int function_;		/* logical operation */
	c_ulong plane_mask;/* plane mask */
	c_ulong foreground;/* foreground pixel */
	c_ulong background;/* background pixel */
	int line_width;		/* line width */
	int line_style;	 	/* LineSolid, LineOnOffDash, LineDoubleDash */
	int cap_style;	  	/* CapNotLast, CapButt,
				   CapRound, CapProjecting */
	int join_style;	 	/* JoinMiter, JoinRound, JoinBevel */
	int fill_style;	 	/* FillSolid, FillTiled,
				   FillStippled, FillOpaqueStippled */
	int fill_rule;	  	/* EvenOddRule, WindingRule */
	int arc_mode;		/* ArcChord, ArcPieSlice */
	Pixmap tile;		/* tile pixmap for tiling operations */
	Pixmap stipple;		/* stipple 1 plane pixmap for stippling */
	int ts_x_origin;	/* offset for tile or stipple operations */
	int ts_y_origin;
        Font font;	        /* default text font for text operations */
	int subwindow_mode;     /* ClipByChildren, IncludeInferiors */
	Bool graphics_exposures;/* boolean, should exposures be generated */
	int clip_x_origin;	/* origin for clipping */
	int clip_y_origin;
	Pixmap clip_mask;	/* bitmap clipping; other calls for rects */
	int dash_offset;	/* patterned/dashed line information */
	char dashes = 0;
}

/*
 * Graphics context.  The contents of this structure are implementation
 * dependent.  A GC should be treated as opaque by application code.
 */

struct _XGC {
version (XLIB_ILLEGAL_ACCESS) {

    XExtData* ext_data;	/* hook for extension to hang data */
    GContext gid;	/* protocol ID for graphics context */
    /* there is more to this structure, but it is private to Xlib */
}
}
alias  GC = _XGC*;

/*
 * Visual structure; contains information about colormapping possible.
 */
struct Visual {
	XExtData* ext_data;	/* hook for extension to hang data */
	VisualID visualid;	/* visual id of this visual */
static if (HasVersion!"none" || HasVersion!"c_plusplus") {
	int c_class;		/* C++ class of screen (monochrome, etc.) */
} else {
	int class_;		/* class of screen (monochrome, etc.) */
}
	c_ulong red_mask, green_mask, blue_mask;	/* mask values */
	int bits_per_rgb;	/* log base 2 of distinct color values */
	int map_entries;	/* color map entries */
}

/*
 * Depth structure; contains information for each possible depth.
 */
struct Depth {
	int depth;		/* this depth (Z) of the depth */
	int nvisuals;		/* number of Visual types at this depth */
	Visual* visuals;	/* list of visuals possible at this depth */
}

/*
 * Information about the screen.  The contents of this structure are
 * implementation dependent.  A Screen should be treated as opaque
 * by application code.
 */

// struct _XDisplay;		/* Forward declare before use for C++ */

struct Screen {
	XExtData* ext_data;	/* hook for extension to hang data */
	_XDisplay* display;/* back pointer to display structure */
	Window root;		/* Root window id. */
	int width, height;	/* width and height of screen */
	int mwidth, mheight;	/* width and height of  in millimeters */
	int ndepths;		/* number of depths possible */
	Depth* depths;		/* list of allowable depths on the screen */
	int root_depth;		/* bits per pixel */
	Visual* root_visual;	/* root visual */
	GC default_gc;		/* GC for the root root visual */
	Colormap cmap;		/* default color map */
	c_ulong white_pixel;
	c_ulong black_pixel;	/* White and Black pixel values */
	int max_maps, min_maps;	/* max and min color maps */
	int backing_store;	/* Never, WhenMapped, Always */
	Bool save_unders;
	c_long root_input_mask;	/* initial root input mask */
}

/*
 * Format structure; describes ZFormat data the screen will understand.
 */
struct ScreenFormat {
	XExtData* ext_data;	/* hook for extension to hang data */
	int depth;		/* depth of this image format */
	int bits_per_pixel;	/* bits/pixel at this depth */
	int scanline_pad;	/* scanline must padded to this multiple */
}

/*
 * Data structure for setting window attributes.
 */
struct XSetWindowAttributes {
    Pixmap background_pixmap;	/* background or None or ParentRelative */
    c_ulong background_pixel;	/* background pixel */
    Pixmap border_pixmap;	/* border of the window */
    c_ulong border_pixel;	/* border pixel value */
    int bit_gravity;		/* one of bit gravity values */
    int win_gravity;		/* one of the window gravity values */
    int backing_store;		/* NotUseful, WhenMapped, Always */
    c_ulong backing_planes;/* planes to be preserved if possible */
    c_ulong backing_pixel;/* value to use in restoring planes */
    Bool save_under;		/* should bits under be saved? (popups) */
    c_long event_mask;		/* set of events that should be saved */
    c_long do_not_propagate_mask;	/* set of events that should not propagate */
    Bool override_redirect;	/* boolean value for override-redirect */
    Colormap colormap;		/* color map to be associated with window */
    Cursor cursor;		/* cursor to be displayed (or None) */
}

struct XWindowAttributes {
    int x, y;			/* location of window */
    int width, height;		/* width and height of window */
    int border_width;		/* border width of window */
    int depth;          	/* depth of window */
    Visual* visual;		/* the associated visual structure */
    Window root;        	/* root of screen containing window */
static if (HasVersion!"none" || HasVersion!"c_plusplus") {
    int c_class;		/* C++ InputOutput, InputOnly*/
} else {
    int class_;			/* InputOutput, InputOnly*/
}
    int bit_gravity;		/* one of bit gravity values */
    int win_gravity;		/* one of the window gravity values */
    int backing_store;		/* NotUseful, WhenMapped, Always */
    c_ulong backing_planes;/* planes to be preserved if possible */
    c_ulong backing_pixel;/* value to be used when restoring planes */
    Bool save_under;		/* boolean, should bits under be saved? */
    Colormap colormap;		/* color map to be associated with window */
    Bool map_installed;		/* boolean, is color map currently installed*/
    int map_state;		/* IsUnmapped, IsUnviewable, IsViewable */
    c_long all_event_masks;	/* set of events all people have interest in*/
    c_long your_event_mask;	/* my event mask */
    c_long do_not_propagate_mask; /* set of events that should not propagate */
    Bool override_redirect;	/* boolean value for override-redirect */
    Screen* screen;		/* back pointer to correct screen */
}

/*
 * Data structure for host setting; getting routines.
 *
 */

struct XHostAddress {
	int family;		/* for example FamilyInternet */
	int length;		/* length of address, in bytes */
	char* address;		/* pointer to where to find the bytes */
}

/*
 * Data structure for ServerFamilyInterpreted addresses in host routines
 */
struct XServerInterpretedAddress {
	int typelength;		/* length of type string, in bytes */
	int valuelength;	/* length of value string, in bytes */
	char* type;		/* pointer to where to find the type string */
	char* value;		/* pointer to where to find the address */
}

/*
 * Data structure for "image" data, used by image manipulation routines.
 */
struct _XImage {
    int width, height;		/* size of image */
    int xoffset;		/* number of pixels offset in X direction */
    int format;			/* XYBitmap, XYPixmap, ZPixmap */
    char* data;			/* pointer to image data */
    int byte_order;		/* data byte order, LSBFirst, MSBFirst */
    int bitmap_unit;		/* quant. of scanline 8, 16, 32 */
    int bitmap_bit_order;	/* LSBFirst, MSBFirst */
    int bitmap_pad;		/* 8, 16, 32 either XY or ZPixmap */
    int depth;			/* depth of image */
    int bytes_per_line;		/* accelerator to next line */
    int bits_per_pixel;		/* bits per pixel (ZPixmap) */
    c_ulong red_mask;	/* bits in z arrangement */
    c_ulong green_mask;
    c_ulong blue_mask;
    XPointer obdata;		/* hook for the object routines to hang on */
    struct funcs {		/* image manipulation routines */
	_XImage* function(_XDisplay*, Visual*, uint, int, int, char*, uint, uint, int, int) create_image;
	int function(_XImage*) destroy_image;
	c_ulong function(_XImage*, int, int) get_pixel;
	int function(_XImage*, int, int, c_ulong) put_pixel;
	_XImage* function(_XImage*, int, int, uint, uint) sub_image;
	int function(_XImage*, c_long) add_pixel;
	}funcs f;
}

alias XImage = _XImage;

/*
 * Data structure for XReconfigureWindow
 */
struct XWindowChanges {
    int x, y;
    int width, height;
    int border_width;
    Window sibling;
    int stack_mode;
}

/*
 * Data structure used by color operations
 */
struct XColor {
	c_ulong pixel;
	ushort red, green, blue;
	char flags = 0;  /* do_red, do_green, do_blue */
	char pad = 0;
}

/*
 * Data structures for graphics operations.  On most machines, these are
 * congruent with the wire protocol structures, so reformatting the data
 * can be avoided on these architectures.
 */
struct XSegment {
    short x1, y1, x2, y2;
}

struct XPoint {
    short x, y;
}

struct XRectangle {
    short x, y;
    ushort width, height;
}

struct XArc {
    short x, y;
    ushort width, height;
    short angle1, angle2;
}


/* Data structure for XChangeKeyboardControl */

struct XKeyboardControl {
        int key_click_percent;
        int bell_percent;
        int bell_pitch;
        int bell_duration;
        int led;
        int led_mode;
        int key;
        int auto_repeat_mode;   /* On, Off, Default */
}

/* Data structure for XGetKeyboardControl */

struct XKeyboardState {
        int key_click_percent;
	int bell_percent;
	uint bell_pitch, bell_duration;
	c_ulong led_mask;
	int global_auto_repeat;
	char[32] auto_repeats = 0;
}

/* Data structure for XGetMotionEvents.  */

struct XTimeCoord {
        Time time;
	short x, y;
}

/* Data structure for X{Set,Get}ModifierMapping */

struct XModifierKeymap {
 	int max_keypermod;	/* The server's max # of keys per modifier */
 	KeyCode* modifiermap;	/* An 8 by max_keypermod array of modifiers */
}


/*
 * Display datatype maintaining display specific data.
 * The contents of this structure are implementation dependent.
 * A Display should be treated as opaque by application code.
 */
version (XLIB_ILLEGAL_ACCESS) {} else {
alias Display = _XDisplay;
}

struct _XPrivate;		/* Forward declare before use for C++ */
struct _XrmHashBucketRec;

// alias _XDisplay = XLIB_ILLEGAL_ACCESS;
struct _XDisplay
{
	XExtData* ext_data;	/* hook for extension to hang data */
	_XPrivate* private1;
	int fd;			/* Network socket. */
	int private2;
	int proto_major_version;/* major version of server's X protocol */
	int proto_minor_version;/* minor version of servers X protocol */
	char* vendor;		/* vendor of the server hardware */
        XID private3;
	XID private4;
	XID private5;
	int private6;
	XID function(_XDisplay*) resource_alloc;
	int byte_order;		/* screen byte order, LSBFirst, MSBFirst */
	int bitmap_unit;	/* padding and data requirements */
	int bitmap_pad;		/* padding requirements on bitmaps */
	int bitmap_bit_order;	/* LeastSignificant or MostSignificant */
	int nformats;		/* number of pixmap formats in list */
	ScreenFormat* pixmap_format;	/* pixmap format list */
	int private8;
	int release;		/* release of the server */
	_XPrivate* private9, private10;
	int qlen;		/* Length of input event queue */
	c_ulong last_request_read; /* seq number of last event read */
	c_ulong request;	/* sequence number of last request. */
	XPointer private11;
	XPointer private12;
	XPointer private13;
	XPointer private14;
	uint max_request_size; /* maximum number 32 bit words in request*/
	_XrmHashBucketRec* db;
	int function(_XDisplay*) private15;
	char* display_name;	/* "host:display" string used on this connect*/
	int default_screen;	/* default screen for operations */
	int nscreens;		/* number of screens on this server*/
	Screen* screens;	/* pointer to list of screens */
	c_ulong motion_buffer;	/* size of motion buffer */
	c_ulong private16;
	int min_keycode;	/* minimum defined keycode */
	int max_keycode;	/* maximum defined keycode */
	XPointer private17;
	XPointer private18;
	int private19;
	char* xdefaults;	/* contents of defaults from server */
	/* there is more to this structure, but it is private to Xlib */
}
version (XLIB_ILLEGAL_ACCESS) {
alias Display = _XDisplay;
}

alias _XPrivDisplay = _XDisplay*;

version (_XEVENT_) {} else {
/*
 * Definitions of specific events.
 */
struct XKeyEvent {
	int type;		/* of event */
	c_ulong serial;	/* # of last request processed by server */
	Bool send_event;	/* true if this came from a SendEvent request */
	Display* display;	/* Display the event was read from */
	Window window;	        /* "event" window it is reported relative to */
	Window root;	        /* root window that the event occurred on */
	Window subwindow;	/* child window */
	Time time;		/* milliseconds */
	int x, y;		/* pointer x, y coordinates in event window */
	int x_root, y_root;	/* coordinates relative to root */
	uint state;	/* key or button mask */
	uint keycode;	/* detail */
	Bool same_screen;	/* same screen flag */
}
alias XKeyPressedEvent = XKeyEvent;
alias XKeyReleasedEvent = XKeyEvent;

struct XButtonEvent {
	int type;		/* of event */
	c_ulong serial;	/* # of last request processed by server */
	Bool send_event;	/* true if this came from a SendEvent request */
	Display* display;	/* Display the event was read from */
	Window window;	        /* "event" window it is reported relative to */
	Window root;	        /* root window that the event occurred on */
	Window subwindow;	/* child window */
	Time time;		/* milliseconds */
	int x, y;		/* pointer x, y coordinates in event window */
	int x_root, y_root;	/* coordinates relative to root */
	uint state;	/* key or button mask */
	uint button;	/* detail */
	Bool same_screen;	/* same screen flag */
}
alias XButtonPressedEvent = XButtonEvent;
alias XButtonReleasedEvent = XButtonEvent;

struct XMotionEvent {
	int type;		/* of event */
	c_ulong serial;	/* # of last request processed by server */
	Bool send_event;	/* true if this came from a SendEvent request */
	Display* display;	/* Display the event was read from */
	Window window;	        /* "event" window reported relative to */
	Window root;	        /* root window that the event occurred on */
	Window subwindow;	/* child window */
	Time time;		/* milliseconds */
	int x, y;		/* pointer x, y coordinates in event window */
	int x_root, y_root;	/* coordinates relative to root */
	uint state;	/* key or button mask */
	char is_hint = 0;		/* detail */
	Bool same_screen;	/* same screen flag */
}
alias XPointerMovedEvent = XMotionEvent;

struct XCrossingEvent {
	int type;		/* of event */
	c_ulong serial;	/* # of last request processed by server */
	Bool send_event;	/* true if this came from a SendEvent request */
	Display* display;	/* Display the event was read from */
	Window window;	        /* "event" window reported relative to */
	Window root;	        /* root window that the event occurred on */
	Window subwindow;	/* child window */
	Time time;		/* milliseconds */
	int x, y;		/* pointer x, y coordinates in event window */
	int x_root, y_root;	/* coordinates relative to root */
	int mode;		/* NotifyNormal, NotifyGrab, NotifyUngrab */
	int detail;
	/*
	 * NotifyAncestor, NotifyVirtual, NotifyInferior,
	 * NotifyNonlinear,NotifyNonlinearVirtual
	 */
	Bool same_screen;	/* same screen flag */
	Bool focus;		/* boolean focus */
	uint state;	/* key or button mask */
}
alias XEnterWindowEvent = XCrossingEvent;
alias XLeaveWindowEvent = XCrossingEvent;

struct XFocusChangeEvent {
	int type;		/* FocusIn or FocusOut */
	c_ulong serial;	/* # of last request processed by server */
	Bool send_event;	/* true if this came from a SendEvent request */
	Display* display;	/* Display the event was read from */
	Window window;		/* window of event */
	int mode;		/* NotifyNormal, NotifyWhileGrabbed,
				   NotifyGrab, NotifyUngrab */
	int detail;
	/*
	 * NotifyAncestor, NotifyVirtual, NotifyInferior,
	 * NotifyNonlinear,NotifyNonlinearVirtual, NotifyPointer,
	 * NotifyPointerRoot, NotifyDetailNone
	 */
}
alias XFocusInEvent = XFocusChangeEvent;
alias XFocusOutEvent = XFocusChangeEvent;

/* generated on EnterWindow and FocusIn  when KeyMapState selected */
struct XKeymapEvent {
	int type;
	c_ulong serial;	/* # of last request processed by server */
	Bool send_event;	/* true if this came from a SendEvent request */
	Display* display;	/* Display the event was read from */
	Window window;
	char[32] key_vector = 0;
}

struct XExposeEvent {
	int type;
	c_ulong serial;	/* # of last request processed by server */
	Bool send_event;	/* true if this came from a SendEvent request */
	Display* display;	/* Display the event was read from */
	Window window;
	int x, y;
	int width, height;
	int count;		/* if non-zero, at least this many more */
}

struct XGraphicsExposeEvent {
	int type;
	c_ulong serial;	/* # of last request processed by server */
	Bool send_event;	/* true if this came from a SendEvent request */
	Display* display;	/* Display the event was read from */
	Drawable drawable;
	int x, y;
	int width, height;
	int count;		/* if non-zero, at least this many more */
	int major_code;		/* core is CopyArea or CopyPlane */
	int minor_code;		/* not defined in the core */
}

struct XNoExposeEvent {
	int type;
	c_ulong serial;	/* # of last request processed by server */
	Bool send_event;	/* true if this came from a SendEvent request */
	Display* display;	/* Display the event was read from */
	Drawable drawable;
	int major_code;		/* core is CopyArea or CopyPlane */
	int minor_code;		/* not defined in the core */
}

struct XVisibilityEvent {
	int type;
	c_ulong serial;	/* # of last request processed by server */
	Bool send_event;	/* true if this came from a SendEvent request */
	Display* display;	/* Display the event was read from */
	Window window;
	int state;		/* Visibility state */
}

struct XCreateWindowEvent {
	int type;
	c_ulong serial;	/* # of last request processed by server */
	Bool send_event;	/* true if this came from a SendEvent request */
	Display* display;	/* Display the event was read from */
	Window parent;		/* parent of the window */
	Window window;		/* window id of window created */
	int x, y;		/* window location */
	int width, height;	/* size of window */
	int border_width;	/* border width */
	Bool override_redirect;	/* creation should be overridden */
}

struct XDestroyWindowEvent {
	int type;
	c_ulong serial;	/* # of last request processed by server */
	Bool send_event;	/* true if this came from a SendEvent request */
	Display* display;	/* Display the event was read from */
	Window event;
	Window window;
}

struct XUnmapEvent {
	int type;
	c_ulong serial;	/* # of last request processed by server */
	Bool send_event;	/* true if this came from a SendEvent request */
	Display* display;	/* Display the event was read from */
	Window event;
	Window window;
	Bool from_configure;
}

struct XMapEvent {
	int type;
	c_ulong serial;	/* # of last request processed by server */
	Bool send_event;	/* true if this came from a SendEvent request */
	Display* display;	/* Display the event was read from */
	Window event;
	Window window;
	Bool override_redirect;	/* boolean, is override set... */
}

struct XMapRequestEvent {
	int type;
	c_ulong serial;	/* # of last request processed by server */
	Bool send_event;	/* true if this came from a SendEvent request */
	Display* display;	/* Display the event was read from */
	Window parent;
	Window window;
}

struct XReparentEvent {
	int type;
	c_ulong serial;	/* # of last request processed by server */
	Bool send_event;	/* true if this came from a SendEvent request */
	Display* display;	/* Display the event was read from */
	Window event;
	Window window;
	Window parent;
	int x, y;
	Bool override_redirect;
}

struct XConfigureEvent {
	int type;
	c_ulong serial;	/* # of last request processed by server */
	Bool send_event;	/* true if this came from a SendEvent request */
	Display* display;	/* Display the event was read from */
	Window event;
	Window window;
	int x, y;
	int width, height;
	int border_width;
	Window above;
	Bool override_redirect;
}

struct XGravityEvent {
	int type;
	c_ulong serial;	/* # of last request processed by server */
	Bool send_event;	/* true if this came from a SendEvent request */
	Display* display;	/* Display the event was read from */
	Window event;
	Window window;
	int x, y;
}

struct XResizeRequestEvent {
	int type;
	c_ulong serial;	/* # of last request processed by server */
	Bool send_event;	/* true if this came from a SendEvent request */
	Display* display;	/* Display the event was read from */
	Window window;
	int width, height;
}

struct XConfigureRequestEvent {
	int type;
	c_ulong serial;	/* # of last request processed by server */
	Bool send_event;	/* true if this came from a SendEvent request */
	Display* display;	/* Display the event was read from */
	Window parent;
	Window window;
	int x, y;
	int width, height;
	int border_width;
	Window above;
	int detail;		/* Above, Below, TopIf, BottomIf, Opposite */
	c_ulong value_mask;
}

struct XCirculateEvent {
	int type;
	c_ulong serial;	/* # of last request processed by server */
	Bool send_event;	/* true if this came from a SendEvent request */
	Display* display;	/* Display the event was read from */
	Window event;
	Window window;
	int place;		/* PlaceOnTop, PlaceOnBottom */
}

struct XCirculateRequestEvent {
	int type;
	c_ulong serial;	/* # of last request processed by server */
	Bool send_event;	/* true if this came from a SendEvent request */
	Display* display;	/* Display the event was read from */
	Window parent;
	Window window;
	int place;		/* PlaceOnTop, PlaceOnBottom */
}

struct XPropertyEvent {
	int type;
	c_ulong serial;	/* # of last request processed by server */
	Bool send_event;	/* true if this came from a SendEvent request */
	Display* display;	/* Display the event was read from */
	Window window;
	Atom atom;
	Time time;
	int state;		/* NewValue, Deleted */
}

struct XSelectionClearEvent {
	int type;
	c_ulong serial;	/* # of last request processed by server */
	Bool send_event;	/* true if this came from a SendEvent request */
	Display* display;	/* Display the event was read from */
	Window window;
	Atom selection;
	Time time;
}

struct XSelectionRequestEvent {
	int type;
	c_ulong serial;	/* # of last request processed by server */
	Bool send_event;	/* true if this came from a SendEvent request */
	Display* display;	/* Display the event was read from */
	Window owner;
	Window requestor;
	Atom selection;
	Atom target;
	Atom property;
	Time time;
}

struct XSelectionEvent {
	int type;
	c_ulong serial;	/* # of last request processed by server */
	Bool send_event;	/* true if this came from a SendEvent request */
	Display* display;	/* Display the event was read from */
	Window requestor;
	Atom selection;
	Atom target;
	Atom property;		/* ATOM or None */
	Time time;
}

struct XColormapEvent {
	int type;
	c_ulong serial;	/* # of last request processed by server */
	Bool send_event;	/* true if this came from a SendEvent request */
	Display* display;	/* Display the event was read from */
	Window window;
	Colormap colormap;	/* COLORMAP or None */
static if (HasVersion!"none" || HasVersion!"c_plusplus") {
	Bool c_new;		/* C++ */
} else {
	Bool new_;
}
	int state;		/* ColormapInstalled, ColormapUninstalled */
}

struct XClientMessageEvent {
	int type;
	c_ulong serial;	/* # of last request processed by server */
	Bool send_event;	/* true if this came from a SendEvent request */
	Display* display;	/* Display the event was read from */
	Window window;
	Atom message_type;
	int format;
	union _Data {
		char[20] b = 0;
		short[10] s;
		c_long[5] l;
		}_Data data;
}

struct XMappingEvent {
	int type;
	c_ulong serial;	/* # of last request processed by server */
	Bool send_event;	/* true if this came from a SendEvent request */
	Display* display;	/* Display the event was read from */
	Window window;		/* unused */
	int request;		/* one of MappingModifier, MappingKeyboard,
				   MappingPointer */
	int first_keycode;	/* first keycode */
	int count;		/* defines range of change w. first_keycode*/
}

struct XErrorEvent {
	int type;
	Display* display;	/* Display the event was read from */
	XID resourceid;		/* resource id */
	c_ulong serial;	/* serial number of failed request */
	ubyte error_code;	/* error code of failed request */
	ubyte request_code;	/* Major op-code of failed request */
	ubyte minor_code;	/* Minor op-code of failed request */
}

struct XAnyEvent {
	int type;
	c_ulong serial;	/* # of last request processed by server */
	Bool send_event;	/* true if this came from a SendEvent request */
	Display* display;/* Display the event was read from */
	Window window;	/* window on which event was requested in event mask */
}


/***************************************************************
 *
 * GenericEvent.  This event is the standard event for all newer extensions.
 */

struct XGenericEvent {
    int type;         /* of event. Always GenericEvent */
    c_ulong serial;       /* # of last request processed */
    Bool send_event;   /* true if from SendEvent request */
    Display* display;     /* Display the event was read from */
    int extension;    /* major opcode of extension that caused the event */
    int evtype;       /* actual event type. */
    }

struct XGenericEventCookie {
    int type;         /* of event. Always GenericEvent */
    c_ulong serial;       /* # of last request processed */
    Bool send_event;   /* true if from SendEvent request */
    Display* display;     /* Display the event was read from */
    int extension;    /* major opcode of extension that caused the event */
    int evtype;       /* actual event type. */
    uint cookie;
    void* data;
}

/*
 * this union is defined so Xlib can always use the same sized
 * event structure internally, to avoid memory fragmentation.
 */
union XEvent {
        int type;		/* must not be changed; first element */
	XAnyEvent xany;
	XKeyEvent xkey;
	XButtonEvent xbutton;
	XMotionEvent xmotion;
	XCrossingEvent xcrossing;
	XFocusChangeEvent xfocus;
	XExposeEvent xexpose;
	XGraphicsExposeEvent xgraphicsexpose;
	XNoExposeEvent xnoexpose;
	XVisibilityEvent xvisibility;
	XCreateWindowEvent xcreatewindow;
	XDestroyWindowEvent xdestroywindow;
	XUnmapEvent xunmap;
	XMapEvent xmap;
	XMapRequestEvent xmaprequest;
	XReparentEvent xreparent;
	XConfigureEvent xconfigure;
	XGravityEvent xgravity;
	XResizeRequestEvent xresizerequest;
	XConfigureRequestEvent xconfigurerequest;
	XCirculateEvent xcirculate;
	XCirculateRequestEvent xcirculaterequest;
	XPropertyEvent xproperty;
	XSelectionClearEvent xselectionclear;
	XSelectionRequestEvent xselectionrequest;
	XSelectionEvent xselection;
	XColormapEvent xcolormap;
	XClientMessageEvent xclient;
	XMappingEvent xmapping;
	XErrorEvent xerror;
	XKeymapEvent xkeymap;
	XGenericEvent xgeneric;
	XGenericEventCookie xcookie;
	c_long[24] pad;
}
}

enum string XAllocID(string dpy) = `((*(cast(_XPrivDisplay)(` ~ dpy ~ `)).resource_alloc)((` ~ dpy ~ `)))`;

/*
 * per character font metric information.
 */
struct XCharStruct {
    short lbearing;	/* origin to left edge of raster */
    short rbearing;	/* origin to right edge of raster */
    short width;		/* advance to next char's origin */
    short ascent;		/* baseline to top edge of raster */
    short descent;	/* baseline to bottom edge of raster */
    ushort attributes;	/* per char flags (not predefined) */
}

/*
 * To allow arbitrary information with fonts, there are additional properties
 * returned.
 */
struct XFontProp {
    Atom name;
    c_ulong card32;
}

struct XFontStruct {
    XExtData* ext_data;	/* hook for extension to hang data */
    Font fid;            /* Font id for this font */
    uint direction;	/* hint about direction the font is painted */
    uint min_char_or_byte2;/* first character */
    uint max_char_or_byte2;/* last character */
    uint min_byte1;	/* first row that exists */
    uint max_byte1;	/* last row that exists */
    Bool all_chars_exist;/* flag if all characters have non-zero size*/
    uint default_char;	/* char to print for undefined character */
    int n_properties;   /* how many properties there are */
    XFontProp* properties;	/* pointer to array of additional properties*/
    XCharStruct min_bounds;	/* minimum bounds over all existing char*/
    XCharStruct max_bounds;	/* maximum bounds over all existing char*/
    XCharStruct* per_char;	/* first_char to last_char information */
    int ascent;		/* log. extent above baseline for spacing */
    int descent;	/* log. descent below baseline for spacing */
}

/*
 * PolyText routines take these as arguments.
 */
struct XTextItem {
    char* chars;		/* pointer to string */
    int nchars;			/* number of characters */
    int delta;			/* delta between strings */
    Font font;			/* font to print it in, None don't change */
}

struct XChar2b {		/* normal 16 bit characters are two bytes */
    ubyte byte1;
    ubyte byte2;
}

struct XTextItem16 {
    XChar2b* chars;		/* two byte characters */
    int nchars;			/* number of characters */
    int delta;			/* delta between strings */
    Font font;			/* font to print it in, None don't change */
}


union XEDataObject { Display* display;
		GC gc;
		Visual* visual;
		Screen* screen;
		ScreenFormat* pixmap_format;
		XFontStruct* font; }

struct XFontSetExtents {
    XRectangle max_ink_extent;
    XRectangle max_logical_extent;
}

/* unused:
void (*XOMProc)();
 */

extern struct _XOM;
extern struct _XOC;


alias XOM = _XOM*;
alias XOC = _XOC*;
alias XFontSet = _XOC*;

struct XmbTextItem {
    char* chars;
    int nchars;
    int delta;
    XFontSet font_set;
}

struct XwcTextItem {
    wchar_t* chars;
    int nchars;
    int delta;
    XFontSet font_set;
}

enum XNRequiredCharSet = "requiredCharSet";
enum XNQueryOrientation = "queryOrientation";
enum XNBaseFontName = "baseFontName";
enum XNOMAutomatic = "omAutomatic";
enum XNMissingCharSet = "missingCharSet";
enum XNDefaultString = "defaultString";
enum XNOrientation = "orientation";
enum XNDirectionalDependentDrawing = "directionalDependentDrawing";
enum XNContextualDrawing = "contextualDrawing";
enum XNFontInfo = "fontInfo";

struct XOMCharSetList {
    int charset_count;
    char** charset_list;
}

enum XOrientation {
    XOMOrientation_LTR_TTB,
    XOMOrientation_RTL_TTB,
    XOMOrientation_TTB_LTR,
    XOMOrientation_TTB_RTL,
    XOMOrientation_Context
}
alias XOMOrientation_LTR_TTB = XOrientation.XOMOrientation_LTR_TTB;
alias XOMOrientation_RTL_TTB = XOrientation.XOMOrientation_RTL_TTB;
alias XOMOrientation_TTB_LTR = XOrientation.XOMOrientation_TTB_LTR;
alias XOMOrientation_TTB_RTL = XOrientation.XOMOrientation_TTB_RTL;
alias XOMOrientation_Context = XOrientation.XOMOrientation_Context;


struct XOMOrientation {
    int num_orientation;
    XOrientation* orientation;	/* Input Text description */
}

struct XOMFontInfo {
    int num_font;
    XFontStruct** font_struct_list;
    char** font_name_list;
}

extern struct _XIM;
extern struct _XIC;


alias XIM = _XIM*;
alias XIC = _XIC*;

alias XIMProc = void function(XIM, XPointer, XPointer);

alias XICProc = Bool function(XIC, XPointer, XPointer);

alias XIDProc = void function(Display*, XPointer, XPointer);

alias XIMStyle = c_ulong;

struct XIMStyles {
    ushort count_styles;
    XIMStyle* supported_styles;
}

enum XIMPreeditArea =		0x0001L;
enum XIMPreeditCallbacks =	0x0002L;
enum XIMPreeditPosition =	0x0004L;
enum XIMPreeditNothing =	0x0008L;
enum XIMPreeditNone =		0x0010L;
enum XIMStatusArea =		0x0100L;
enum XIMStatusCallbacks =	0x0200L;
enum XIMStatusNothing =	0x0400L;
enum XIMStatusNone =		0x0800L;

enum XNVaNestedList = "XNVaNestedList";
enum XNQueryInputStyle = "queryInputStyle";
enum XNClientWindow = "clientWindow";
enum XNInputStyle = "inputStyle";
enum XNFocusWindow = "focusWindow";
enum XNResourceName = "resourceName";
enum XNResourceClass = "resourceClass";
enum XNGeometryCallback = "geometryCallback";
enum XNDestroyCallback = "destroyCallback";
enum XNFilterEvents = "filterEvents";
enum XNPreeditStartCallback = "preeditStartCallback";
enum XNPreeditDoneCallback = "preeditDoneCallback";
enum XNPreeditDrawCallback = "preeditDrawCallback";
enum XNPreeditCaretCallback = "preeditCaretCallback";
enum XNPreeditStateNotifyCallback = "preeditStateNotifyCallback";
enum XNPreeditAttributes = "preeditAttributes";
enum XNStatusStartCallback = "statusStartCallback";
enum XNStatusDoneCallback = "statusDoneCallback";
enum XNStatusDrawCallback = "statusDrawCallback";
enum XNStatusAttributes = "statusAttributes";
enum XNArea = "area";
enum XNAreaNeeded = "areaNeeded";
enum XNSpotLocation = "spotLocation";
enum XNColormap = "colorMap";
enum XNStdColormap = "stdColorMap";
enum XNForeground = "foreground";
enum XNBackground = "background";
enum XNBackgroundPixmap = "backgroundPixmap";
enum XNFontSet = "fontSet";
enum XNLineSpace = "lineSpace";
enum XNCursor = "cursor";

enum XNQueryIMValuesList = "queryIMValuesList";
enum XNQueryICValuesList = "queryICValuesList";
enum XNVisiblePosition = "visiblePosition";
enum XNR6PreeditCallback = "r6PreeditCallback";
enum XNStringConversionCallback = "stringConversionCallback";
enum XNStringConversion = "stringConversion";
enum XNResetState = "resetState";
enum XNHotKey = "hotKey";
enum XNHotKeyState = "hotKeyState";
enum XNPreeditState = "preeditState";
enum XNSeparatorofNestedList = "separatorofNestedList";

enum XBufferOverflow =		-1;
enum XLookupNone =		1;
enum XLookupChars =		2;
enum XLookupKeySym =		3;
enum XLookupBoth =		4;

alias XVaNestedList = void*;

struct XIMCallback {
    XPointer client_data;
    XIMProc callback;
}

struct XICCallback {
    XPointer client_data;
    XICProc callback;
}

alias XIMFeedback = c_ulong;

enum XIMReverse =		1L;
enum XIMUnderline =		(1L<<1);
enum XIMHighlight =		(1L<<2);
enum XIMPrimary =	 	(1L<<5);
enum XIMSecondary =		(1L<<6);
enum XIMTertiary =	 	(1L<<7);
enum XIMVisibleToForward = 	(1L<<8);
enum XIMVisibleToBackword = 	(1L<<9);
enum XIMVisibleToCenter = 	(1L<<10);

struct XIMText {
    ushort length;
    XIMFeedback* feedback;
    Bool encoding_is_wchar;
    union _String {
	char* multi_byte;
	wchar_t* wide_char;
    }_String string;
}

alias XIMPreeditState = c_ulong;

enum	XIMPreeditUnKnown =	0L;
enum	XIMPreeditEnable =	1L;
enum	XIMPreeditDisable =	(1L<<1);

struct XIMPreeditStateNotifyCallbackStruct {
    XIMPreeditState state;
}

alias XIMResetState = c_ulong;

enum	XIMInitialState =		1L;
enum	XIMPreserveState =	(1L<<1);

alias XIMStringConversionFeedback = c_ulong;

enum	XIMStringConversionLeftEdge =	(0x00000001);
enum	XIMStringConversionRightEdge =	(0x00000002);
enum	XIMStringConversionTopEdge =	(0x00000004);
enum	XIMStringConversionBottomEdge =	(0x00000008);
enum	XIMStringConversionConcealed =	(0x00000010);
enum	XIMStringConversionWrapped =	(0x00000020);

struct XIMStringConversionText {
    ushort length;
    XIMStringConversionFeedback* feedback;
    Bool encoding_is_wchar;
    union _String {
	char* mbs;
	wchar_t* wcs;
    }_String string;
}

alias XIMStringConversionPosition = ushort;

alias XIMStringConversionType = ushort;

enum	XIMStringConversionBuffer =	(0x0001);
enum	XIMStringConversionLine =		(0x0002);
enum	XIMStringConversionWord =		(0x0003);
enum	XIMStringConversionChar =		(0x0004);

alias XIMStringConversionOperation = ushort;

enum	XIMStringConversionSubstitution =	(0x0001);
enum	XIMStringConversionRetrieval =	(0x0002);

enum XIMCaretDirection {
    XIMForwardChar, XIMBackwardChar,
    XIMForwardWord, XIMBackwardWord,
    XIMCaretUp, XIMCaretDown,
    XIMNextLine, XIMPreviousLine,
    XIMLineStart, XIMLineEnd,
    XIMAbsolutePosition,
    XIMDontChange
}
alias XIMForwardChar = XIMCaretDirection.XIMForwardChar;
alias XIMBackwardChar = XIMCaretDirection.XIMBackwardChar;
alias XIMForwardWord = XIMCaretDirection.XIMForwardWord;
alias XIMBackwardWord = XIMCaretDirection.XIMBackwardWord;
alias XIMCaretUp = XIMCaretDirection.XIMCaretUp;
alias XIMCaretDown = XIMCaretDirection.XIMCaretDown;
alias XIMNextLine = XIMCaretDirection.XIMNextLine;
alias XIMPreviousLine = XIMCaretDirection.XIMPreviousLine;
alias XIMLineStart = XIMCaretDirection.XIMLineStart;
alias XIMLineEnd = XIMCaretDirection.XIMLineEnd;
alias XIMAbsolutePosition = XIMCaretDirection.XIMAbsolutePosition;
alias XIMDontChange = XIMCaretDirection.XIMDontChange;


struct XIMStringConversionCallbackStruct {
    XIMStringConversionPosition position;
    XIMCaretDirection direction;
    XIMStringConversionOperation operation;
    ushort factor;
    XIMStringConversionText* text;
}

struct XIMPreeditDrawCallbackStruct {
    int caret;		/* Cursor offset within pre-edit string */
    int chg_first;	/* Starting change position */
    int chg_length;	/* Length of the change in character count */
    XIMText* text;
}

enum XIMCaretStyle {
    XIMIsInvisible,	/* Disable caret feedback */
    XIMIsPrimary,	/* UI defined caret feedback */
    XIMIsSecondary	/* UI defined caret feedback */
}
alias XIMIsInvisible = XIMCaretStyle.XIMIsInvisible;
alias XIMIsPrimary = XIMCaretStyle.XIMIsPrimary;
alias XIMIsSecondary = XIMCaretStyle.XIMIsSecondary;


struct XIMPreeditCaretCallbackStruct {
    int position;		 /* Caret offset within pre-edit string */
    XIMCaretDirection direction; /* Caret moves direction */
    XIMCaretStyle style;	 /* Feedback of the caret */
}

enum XIMStatusDataType {
    XIMTextType,
    XIMBitmapType
}
alias XIMTextType = XIMStatusDataType.XIMTextType;
alias XIMBitmapType = XIMStatusDataType.XIMBitmapType;


struct XIMStatusDrawCallbackStruct {
    XIMStatusDataType type;
    union _Data {
	XIMText* text;
	Pixmap bitmap;
    }_Data data;
}

struct XIMHotKeyTrigger {
    KeySym keysym;
    int modifier;
    int modifier_mask;
}

struct XIMHotKeyTriggers {
    int num_hot_key;
    XIMHotKeyTrigger* key;
}

alias XIMHotKeyState = c_ulong;

enum	XIMHotKeyStateON =	(0x0001L);
enum	XIMHotKeyStateOFF =	(0x0002L);

struct XIMValuesList {
    ushort count_values;
    char** supported_values;
}

// _XFUNCPROTOBEGIN

static if (HasVersion!"Windows" && !HasVersion!"_XLIBINT_") {
enum _Xdebug = (*_Xdebug_p);
}

extern int _Xdebug;

extern XFontStruct* XLoadQueryFont(Display*, const char*);

extern XFontStruct* XQueryFont(Display*, XID);


extern XTimeCoord* XGetMotionEvents(Display*, Window, Time, Time, int*);

extern XModifierKeymap* XDeleteModifiermapEntry(XModifierKeymap*, uint, KeyCode, int);

extern XModifierKeymap* XGetModifierMapping(Display*);

extern XModifierKeymap* XInsertModifiermapEntry(XModifierKeymap*, uint, KeyCode, int);

extern XModifierKeymap* XNewModifiermap(int);

extern XImage* XCreateImage(Display*, Visual*, uint, int, int, char*, uint, uint, int, int);
extern Status XInitImage(XImage*);
extern XImage* XGetImage(Display*, Drawable, int, int, uint, uint, c_ulong, int);
extern XImage* XGetSubImage(Display*, Drawable, int, int, uint, uint, c_ulong, int, XImage*, int, int);

/*
 * X function declarations.
 */
extern Display* XOpenDisplay(const char*);

extern void XrmInitialize();

extern char* XFetchBytes(Display*, int*);
extern char* XFetchBuffer(Display*, int*, int);
extern char* XGetAtomName(Display*, Atom);
extern Status XGetAtomNames(Display*, Atom*, int, char**);
extern char* XGetDefault(Display*, const char*, const char*);
extern char* XDisplayName(const char*);
extern char* XKeysymToString(KeySym);

extern int function(Display*) XSynchronize(Display*, Bool);
extern int function(Display*) XSetAfterFunction(Display*, int function(Display*));
extern Atom XInternAtom(Display*, const char*, Bool);
extern Status XInternAtoms(Display*, char**, int, Bool, Atom*);
extern Colormap XCopyColormapAndFree(Display*, Colormap);
extern Colormap XCreateColormap(Display*, Window, Visual*, int);
extern Cursor XCreatePixmapCursor(Display*, Pixmap, Pixmap, XColor*, XColor*, uint, uint);
extern Cursor XCreateGlyphCursor(Display*, Font, Font, uint, uint, XColor _Xconst, XColor _Xconst);
extern Cursor XCreateFontCursor(Display*, uint);
extern Font XLoadFont(Display*, const char*);
extern GC XCreateGC(Display*, Drawable, c_ulong, XGCValues*);
extern GContext XGContextFromGC(GC);
extern void XFlushGC(Display*, GC);
extern Pixmap XCreatePixmap(Display*, Drawable, uint, uint, uint);
extern Pixmap XCreateBitmapFromData(Display*, Drawable, const char*, uint, uint);
extern Pixmap XCreatePixmapFromBitmapData(Display*, Drawable, char*, uint, uint, c_ulong, c_ulong, uint);
extern Window XCreateSimpleWindow(Display*, Window, int, int, uint, uint, uint, c_ulong, c_ulong);
extern Window XGetSelectionOwner(Display*, Atom);
extern Window XCreateWindow(Display*, Window, int, int, uint, uint, uint, int, uint, Visual*, c_ulong, XSetWindowAttributes*);
extern Colormap* XListInstalledColormaps(Display*, Window, int*);
extern char** XListFonts(Display*, const char*, int, int*);
extern char** XListFontsWithInfo(Display*, const char*, int, int*, XFontStruct**);
extern char** XGetFontPath(Display*, int*);
extern char** XListExtensions(Display*, int*);
extern Atom* XListProperties(Display*, Window, int*);
extern XHostAddress* XListHosts(Display*, int*, Bool*);
// extern _X_DEPRECATED XKeycodeToKeysym(Display*, uint, KeyCode, int);
extern KeySym XLookupKeysym(XKeyEvent*, int);
extern KeySym* XGetKeyboardMapping(Display*, uint, KeyCode, int, int*);
extern KeySym XStringToKeysym(const char*);
extern c_long XMaxRequestSize(Display*);
extern c_long XExtendedMaxRequestSize(Display*);
extern char* XResourceManagerString(Display*);
extern char* XScreenResourceString(Screen*);
extern c_ulong XDisplayMotionBufferSize(Display*);
extern VisualID XVisualIDFromVisual(Visual*);

/* multithread routines */

extern Status XInitThreads();

extern Status XFreeThreads();

extern void XLockDisplay(Display*);

extern void XUnlockDisplay(Display*);

/* routines for dealing with extensions */

extern XExtCodes* XInitExtension(Display*, const char*);

extern XExtCodes* XAddExtension(Display*);
extern XExtData* XFindOnExtensionList(XExtData**, int);
extern XExtData** XEHeadOfExtensionList(XEDataObject);

/* these are routines for which there are also macros */
extern Window XRootWindow(Display*, int);
extern Window XDefaultRootWindow(Display*);
extern Window XRootWindowOfScreen(Screen*);
extern Visual* XDefaultVisual(Display*, int);
extern Visual* XDefaultVisualOfScreen(Screen*);
extern GC XDefaultGC(Display*, int);
extern GC XDefaultGCOfScreen(Screen*);
extern c_ulong XBlackPixel(Display*, int);
extern c_ulong XWhitePixel(Display*, int);
extern c_ulong XAllPlanes();
extern c_ulong XBlackPixelOfScreen(Screen*);
extern c_ulong XWhitePixelOfScreen(Screen*);
extern c_ulong XNextRequest(Display*);
extern c_ulong XLastKnownRequestProcessed(Display*);
extern char* XServerVendor(Display*);
extern char* XDisplayString(Display*);
extern Colormap XDefaultColormap(Display*, int);
extern Colormap XDefaultColormapOfScreen(Screen*);
extern Display* XDisplayOfScreen(Screen*);
extern Screen* XScreenOfDisplay(Display*, int);
extern Screen* XDefaultScreenOfDisplay(Display*);
extern c_long XEventMaskOfScreen(Screen*);

extern int XScreenNumberOfScreen(Screen*);

alias XErrorHandler = int function(Display*, XErrorEvent*);

extern XErrorHandler XSetErrorHandler(XErrorHandler);


alias XIOErrorHandler = int function(Display*);

extern XIOErrorHandler XSetIOErrorHandler(XIOErrorHandler);

alias XIOErrorExitHandler = void function(Display*, void*);

extern void XSetIOErrorExitHandler(Display*, XIOErrorExitHandler, void*);

extern XPixmapFormatValues* XListPixmapFormats(Display*, int*);
extern int* XListDepths(Display*, int, int*);

/* ICCCM routines for things that don't require special include files; */
/* other declarations are given in Xutil.h                             */
extern Status XReconfigureWMWindow(Display*, Window, int, uint, XWindowChanges*);

extern Status XGetWMProtocols(Display*, Window, Atom**, int*);
extern Status XSetWMProtocols(Display*, Window, Atom*, int);
extern Status XIconifyWindow(Display*, Window, int);
extern Status XWithdrawWindow(Display*, Window, int);
extern Status XGetCommand(Display*, Window, char***, int*);
extern Status XGetWMColormapWindows(Display*, Window, Window**, int*);
extern Status XSetWMColormapWindows(Display*, Window, Window*, int);
extern void XFreeStringList(char**);
extern int XSetTransientForHint(Display*, Window, Window);

/* The following are given in alphabetical order */

extern int XActivateScreenSaver(Display*);

extern int XAddHost(Display*, XHostAddress*);

extern int XAddHosts(Display*, XHostAddress*, int);

extern int XAddToExtensionList(_XExtData**, XExtData*);

extern int XAddToSaveSet(Display*, Window);

extern Status XAllocColor(Display*, Colormap, XColor*);

extern Status XAllocColorCells(Display*, Colormap, Bool, c_ulong*, uint, c_ulong*, uint);

extern Status XAllocColorPlanes(Display*, Colormap, Bool, c_ulong*, int, int, int, int, c_ulong*, c_ulong*, c_ulong*);

extern Status XAllocNamedColor(Display*, Colormap, const char*, XColor*, XColor*);

extern int XAllowEvents(Display*, int, Time);

extern int XAutoRepeatOff(Display*);

extern int XAutoRepeatOn(Display*);

extern int XBell(Display*, int);

extern int XBitmapBitOrder(Display*);

extern int XBitmapPad(Display*);

extern int XBitmapUnit(Display*);

extern int XCellsOfScreen(Screen*);

extern int XChangeActivePointerGrab(Display*, uint, Cursor, Time);

extern int XChangeGC(Display*, GC, c_ulong, XGCValues*);

extern int XChangeKeyboardControl(Display*, c_ulong, XKeyboardControl*);

extern int XChangeKeyboardMapping(Display*, int, int, KeySym*, int);

extern int XChangePointerControl(Display*, Bool, Bool, int, int, int);

extern int XChangeProperty(Display*, Window, Atom, Atom, int, int, const uint, int);

extern int XChangeSaveSet(Display*, Window, int);

extern int XChangeWindowAttributes(Display*, Window, c_ulong, XSetWindowAttributes*);

extern Bool XCheckIfEvent(Display*, XEvent*, Bool function(Display*, XEvent*, XPointer), XPointer);

extern Bool XCheckMaskEvent(Display*, c_long, XEvent*);

extern Bool XCheckTypedEvent(Display*, int, XEvent*);

extern Bool XCheckTypedWindowEvent(Display*, Window, int, XEvent*);

extern Bool XCheckWindowEvent(Display*, Window, c_long, XEvent*);

extern int XCirculateSubwindows(Display*, Window, int);

extern int XCirculateSubwindowsDown(Display*, Window);

extern int XCirculateSubwindowsUp(Display*, Window);

extern int XClearArea(Display*, Window, int, int, uint, uint, Bool);

extern int XClearWindow(Display*, Window);

extern int XCloseDisplay(Display*);

extern int XConfigureWindow(Display*, Window, uint, XWindowChanges*);

extern int XConnectionNumber(Display*);

extern int XConvertSelection(Display*, Atom, Atom, Atom, Window, Time);

extern int XCopyArea(Display*, Drawable, Drawable, GC, int, int, uint, uint, int, int);

extern int XCopyGC(Display*, GC, c_ulong, GC);

extern int XCopyPlane(Display*, Drawable, Drawable, GC, int, int, uint, uint, int, int, c_ulong);

extern int XDefaultDepth(Display*, int);

extern int XDefaultDepthOfScreen(Screen*);

extern int XDefaultScreen(Display*);

extern int XDefineCursor(Display*, Window, Cursor);

extern int XDeleteProperty(Display*, Window, Atom);

extern int XDestroyWindow(Display*, Window);

extern int XDestroySubwindows(Display*, Window);

extern int XDoesBackingStore(Screen*);

extern Bool XDoesSaveUnders(Screen*);

extern int XDisableAccessControl(Display*);


extern int XDisplayCells(Display*, int);

extern int XDisplayHeight(Display*, int);

extern int XDisplayHeightMM(Display*, int);

extern int XDisplayKeycodes(Display*, int*, int*);

extern int XDisplayPlanes(Display*, int);

extern int XDisplayWidth(Display*, int);

extern int XDisplayWidthMM(Display*, int);

extern int XDrawArc(Display*, Drawable, GC, int, int, uint, uint, int, int);

extern int XDrawArcs(Display*, Drawable, GC, XArc*, int);

extern int XDrawImageString(Display*, Drawable, GC, int, int, const char*, int);

extern int XDrawImageString16(Display*, Drawable, GC, int, int, const XChar2b, int);

extern int XDrawLine(Display*, Drawable, GC, int, int, int, int);

extern int XDrawLines(Display*, Drawable, GC, XPoint*, int, int);

extern int XDrawPoint(Display*, Drawable, GC, int, int);

extern int XDrawPoints(Display*, Drawable, GC, XPoint*, int, int);

extern int XDrawRectangle(Display*, Drawable, GC, int, int, uint, uint);

extern int XDrawRectangles(Display*, Drawable, GC, XRectangle*, int);

extern int XDrawSegments(Display*, Drawable, GC, XSegment*, int);

extern int XDrawString(Display*, Drawable, GC, int, int, const char*, int);

extern int XDrawString16(Display*, Drawable, GC, int, int, const XChar2b, int);

extern int XDrawText(Display*, Drawable, GC, int, int, XTextItem*, int);

extern int XDrawText16(Display*, Drawable, GC, int, int, XTextItem16*, int);

extern int XEnableAccessControl(Display*);

extern int XEventsQueued(Display*, int);

extern Status XFetchName(Display*, Window, char**);

extern int XFillArc(Display*, Drawable, GC, int, int, uint, uint, int, int);

extern int XFillArcs(Display*, Drawable, GC, XArc*, int);

extern int XFillPolygon(Display*, Drawable, GC, XPoint*, int, int, int);

extern int XFillRectangle(Display*, Drawable, GC, int, int, uint, uint);

extern int XFillRectangles(Display*, Drawable, GC, XRectangle*, int);

extern int XFlush(Display*);

extern int XForceScreenSaver(Display*, int);

extern int XFree(void*);

extern int XFreeColormap(Display*, Colormap);

extern int XFreeColors(Display*, Colormap, c_ulong*, int, c_ulong);

extern int XFreeCursor(Display*, Cursor);

extern int XFreeExtensionList(char**);

extern int XFreeFont(Display*, XFontStruct*);

extern int XFreeFontInfo(char**, XFontStruct*, int);

extern int XFreeFontNames(char**);

extern int XFreeFontPath(char**);

extern int XFreeGC(Display*, GC);

extern int XFreeModifiermap(XModifierKeymap*);

extern int XFreePixmap(Display*, Pixmap);

extern int XGeometry(Display*, int, const char*, const char*, uint, uint, uint, int, int, int*, int*, int*, int*);

extern int XGetErrorDatabaseText(Display*, const char*, const char*, const char*, char*, int);

extern int XGetErrorText(Display*, int, char*, int);

extern Bool XGetFontProperty(XFontStruct*, Atom, c_ulong*);

extern Status XGetGCValues(Display*, GC, c_ulong, XGCValues*);

extern Status XGetGeometry(Display*, Drawable, Window*, int*, int*, uint*, uint*, uint*, uint*);

extern Status XGetIconName(Display*, Window, char**);

extern int XGetInputFocus(Display*, Window*, int*);

extern int XGetKeyboardControl(Display*, XKeyboardState*);

extern int XGetPointerControl(Display*, int*, int*, int*);

extern int XGetPointerMapping(Display*, ubyte*, int);

extern int XGetScreenSaver(Display*, int*, int*, int*, int*);

extern Status XGetTransientForHint(Display*, Window, Window*);

extern int XGetWindowProperty(Display*, Window, Atom, c_long, c_long, Bool, Atom, Atom*, int*, c_ulong*, c_ulong*, ubyte**);

extern Status XGetWindowAttributes(Display*, Window, XWindowAttributes*);

extern int XGrabButton(Display*, uint, uint, Window, Bool, uint, int, int, Window, Cursor);

extern int XGrabKey(Display*, int, uint, Window, Bool, int, int);

extern int XGrabKeyboard(Display*, Window, Bool, int, int, Time);

extern int XGrabPointer(Display*, Window, Bool, uint, int, int, Window, Cursor, Time);

extern int XGrabServer(Display*);

extern int XHeightMMOfScreen(Screen*);

extern int XHeightOfScreen(Screen*);

extern int XIfEvent(Display*, XEvent*, Bool function(Display*, XEvent*, XPointer), XPointer);

extern int XImageByteOrder(Display*);

extern int XInstallColormap(Display*, Colormap);

extern KeyCode XKeysymToKeycode(Display*, KeySym);

extern int XKillClient(Display*, XID);

extern Status XLookupColor(Display*, Colormap, const char*, XColor*, XColor*);

extern int XLowerWindow(Display*, Window);

extern int XMapRaised(Display*, Window);

extern int XMapSubwindows(Display*, Window);

extern int XMapWindow(Display*, Window);

extern int XMaskEvent(Display*, c_long, XEvent*);

extern int XMaxCmapsOfScreen(Screen*);

extern int XMinCmapsOfScreen(Screen*);

extern int XMoveResizeWindow(Display*, Window, int, int, uint, uint);

extern int XMoveWindow(Display*, Window, int, int);

extern int XNextEvent(Display*, XEvent*);

extern int XNoOp(Display*);

extern Status XParseColor(Display*, Colormap, const char*, XColor*);

extern int XParseGeometry(const char*, int*, int*, uint*, uint*);

extern int XPeekEvent(Display*, XEvent*);

extern int XPeekIfEvent(Display*, XEvent*, Bool function(Display*, XEvent*, XPointer), XPointer);

extern int XPending(Display*);

extern int XPlanesOfScreen(Screen*);

extern int XProtocolRevision(Display*);

extern int XProtocolVersion(Display*);


extern int XPutBackEvent(Display*, XEvent*);

extern int XPutImage(Display*, Drawable, GC, XImage*, int, int, int, int, uint, uint);

extern int XQLength(Display*);

extern Status XQueryBestCursor(Display*, Drawable, uint, uint, uint*, uint*);

extern Status XQueryBestSize(Display*, int, Drawable, uint, uint, uint*, uint*);

extern Status XQueryBestStipple(Display*, Drawable, uint, uint, uint*, uint*);

extern Status XQueryBestTile(Display*, Drawable, uint, uint, uint*, uint*);

extern int XQueryColor(Display*, Colormap, XColor*);

extern int XQueryColors(Display*, Colormap, XColor*, int);

extern Bool XQueryExtension(Display*, const char*, int*, int*, int*);

extern int XQueryKeymap(Display*, char*);

extern Bool XQueryPointer(Display*, Window, Window*, Window*, int*, int*, int*, int*, uint*);

extern int XQueryTextExtents(Display*, XID, const char*, int, int*, int*, int*, XCharStruct*);

extern int XQueryTextExtents16(Display*, XID, const XChar2b, int, int*, int*, int*, XCharStruct*);

extern Status XQueryTree(Display*, Window, Window*, Window*, Window**, uint*);

extern int XRaiseWindow(Display*, Window);

extern int XReadBitmapFile(Display*, Drawable, const char*, uint*, uint*, Pixmap*, int*, int*);

extern int XReadBitmapFileData(const char*, uint*, uint*, ubyte**, int*, int*);

extern int XRebindKeysym(Display*, KeySym, KeySym*, int, const uint, int);

extern int XRecolorCursor(Display*, Cursor, XColor*, XColor*);

extern int XRefreshKeyboardMapping(XMappingEvent*);

extern int XRemoveFromSaveSet(Display*, Window);

extern int XRemoveHost(Display*, XHostAddress*);

extern int XRemoveHosts(Display*, XHostAddress*, int);

extern int XReparentWindow(Display*, Window, Window, int, int);

extern int XResetScreenSaver(Display*);

extern int XResizeWindow(Display*, Window, uint, uint);

extern int XRestackWindows(Display*, Window*, int);

extern int XRotateBuffers(Display*, int);

extern int XRotateWindowProperties(Display*, Window, Atom*, int, int);

extern int XScreenCount(Display*);

extern int XSelectInput(Display*, Window, c_long);

extern Status XSendEvent(Display*, Window, Bool, c_long, XEvent*);

extern int XSetAccessControl(Display*, int);

extern int XSetArcMode(Display*, GC, int);

extern int XSetBackground(Display*, GC, c_ulong);

extern int XSetClipMask(Display*, GC, Pixmap);

extern int XSetClipOrigin(Display*, GC, int, int);

extern int XSetClipRectangles(Display*, GC, int, int, XRectangle*, int, int);

extern int XSetCloseDownMode(Display*, int);

extern int XSetCommand(Display*, Window, char**, int);

extern int XSetDashes(Display*, GC, int, const char*, int);

extern int XSetFillRule(Display*, GC, int);

extern int XSetFillStyle(Display*, GC, int);

extern int XSetFont(Display*, GC, Font);

extern int XSetFontPath(Display*, char**, int);

extern int XSetForeground(Display*, GC, c_ulong);

extern int XSetFunction(Display*, GC, int);

extern int XSetGraphicsExposures(Display*, GC, Bool);

extern int XSetIconName(Display*, Window, const char*);

extern int XSetInputFocus(Display*, Window, int, Time);

extern int XSetLineAttributes(Display*, GC, uint, int, int, int);

extern int XSetModifierMapping(Display*, XModifierKeymap*);

extern int XSetPlaneMask(Display*, GC, c_ulong);

extern int XSetPointerMapping(Display*, const uint, int);

extern int XSetScreenSaver(Display*, int, int, int, int);

extern int XSetSelectionOwner(Display*, Atom, Window, Time);

extern int XSetState(Display*, GC, c_ulong, c_ulong, int, c_ulong);

extern int XSetStipple(Display*, GC, Pixmap);

extern int XSetSubwindowMode(Display*, GC, int);

extern int XSetTSOrigin(Display*, GC, int, int);

extern int XSetTile(Display*, GC, Pixmap);

extern int XSetWindowBackground(Display*, Window, c_ulong);

extern int XSetWindowBackgroundPixmap(Display*, Window, Pixmap);

extern int XSetWindowBorder(Display*, Window, c_ulong);

extern int XSetWindowBorderPixmap(Display*, Window, Pixmap);

extern int XSetWindowBorderWidth(Display*, Window, uint);

extern int XSetWindowColormap(Display*, Window, Colormap);

extern int XStoreBuffer(Display*, const char*, int, int);

extern int XStoreBytes(Display*, const char*, int);

extern int XStoreColor(Display*, Colormap, XColor*);

extern int XStoreColors(Display*, Colormap, XColor*, int);

extern int XStoreName(Display*, Window, const char*);

extern int XStoreNamedColor(Display*, Colormap, const char*, c_ulong, int);

extern int XSync(Display*, Bool);

extern int XTextExtents(XFontStruct*, const char*, int, int*, int*, int*, XCharStruct*);

extern int XTextExtents16(XFontStruct*, const XChar2b, int, int*, int*, int*, XCharStruct*);

extern int XTextWidth(XFontStruct*, const char*, int);

extern int XTextWidth16(XFontStruct*, const XChar2b, int);

extern Bool XTranslateCoordinates(Display*, Window, Window, int, int, int*, int*, Window*);

extern int XUndefineCursor(Display*, Window);

extern int XUngrabButton(Display*, uint, uint, Window);

extern int XUngrabKey(Display*, int, uint, Window);

extern int XUngrabKeyboard(Display*, Time);

extern int XUngrabPointer(Display*, Time);

extern int XUngrabServer(Display*);

extern int XUninstallColormap(Display*, Colormap);

extern int XUnloadFont(Display*, Font);

extern int XUnmapSubwindows(Display*, Window);

extern int XUnmapWindow(Display*, Window);

extern int XVendorRelease(Display*);

extern int XWarpPointer(Display*, Window, Window, int, int, uint, uint, int, int);

extern int XWidthMMOfScreen(Screen*);

extern int XWidthOfScreen(Screen*);

extern int XWindowEvent(Display*, Window, c_long, XEvent*);

extern int XWriteBitmapFile(Display*, const char*, Pixmap, uint, uint, int, int);

extern Bool XSupportsLocale();

extern char* XSetLocaleModifiers(const(char)*);

extern XOM XOpenOM(Display*, _XrmHashBucketRec*, const char*, const char*);

extern Status XCloseOM(XOM);

extern char* XSetOMValues(XOM, ...);

extern char* XGetOMValues(XOM, ...);

extern Display* XDisplayOfOM(XOM);

extern char* XLocaleOfOM(XOM);

extern XOC XCreateOC(XOM, ...);

extern void XDestroyOC(XOC);

extern XOM XOMOfOC(XOC);

extern char* XSetOCValues(XOC, ...);

extern char* XGetOCValues(XOC, ...);

extern XFontSet XCreateFontSet(Display*, const char*, char***, int*, char**);

extern void XFreeFontSet(Display*, XFontSet);

extern int XFontsOfFontSet(XFontSet, XFontStruct***, char***);

extern char* XBaseFontNameListOfFontSet(XFontSet);

extern char* XLocaleOfFontSet(XFontSet);

extern Bool XContextDependentDrawing(XFontSet);

extern Bool XDirectionalDependentDrawing(XFontSet);

extern Bool XContextualDrawing(XFontSet);

extern XFontSetExtents* XExtentsOfFontSet(XFontSet);

extern int XmbTextEscapement(XFontSet, const char*, int);

extern int XwcTextEscapement(XFontSet, const wchar_t, int);

extern int Xutf8TextEscapement(XFontSet, const char*, int);

extern int XmbTextExtents(XFontSet, const char*, int, XRectangle*, XRectangle*);

extern int XwcTextExtents(XFontSet, const wchar_t, int, XRectangle*, XRectangle*);

extern int Xutf8TextExtents(XFontSet, const char*, int, XRectangle*, XRectangle*);

extern Status XmbTextPerCharExtents(XFontSet, const char*, int, XRectangle*, XRectangle*, int, int*, XRectangle*, XRectangle*);

extern Status XwcTextPerCharExtents(XFontSet, const wchar_t, int, XRectangle*, XRectangle*, int, int*, XRectangle*, XRectangle*);

extern Status Xutf8TextPerCharExtents(XFontSet, const char*, int, XRectangle*, XRectangle*, int, int*, XRectangle*, XRectangle*);

extern void XmbDrawText(Display*, Drawable, GC, int, int, XmbTextItem*, int);

extern void XwcDrawText(Display*, Drawable, GC, int, int, XwcTextItem*, int);

extern void Xutf8DrawText(Display*, Drawable, GC, int, int, XmbTextItem*, int);

extern void XmbDrawString(Display*, Drawable, XFontSet, GC, int, int, const char*, int);

extern void XwcDrawString(Display*, Drawable, XFontSet, GC, int, int, const wchar_t, int);

extern void Xutf8DrawString(Display*, Drawable, XFontSet, GC, int, int, const char*, int);

extern void XmbDrawImageString(Display*, Drawable, XFontSet, GC, int, int, const char*, int);

extern void XwcDrawImageString(Display*, Drawable, XFontSet, GC, int, int, const wchar_t, int);

extern void Xutf8DrawImageString(Display*, Drawable, XFontSet, GC, int, int, const char*, int);

extern XIM XOpenIM(Display*, _XrmHashBucketRec*, char*, char*);

extern Status XCloseIM(XIM);

extern char* XGetIMValues(XIM, ...);

extern char* XSetIMValues(XIM, ...);

extern Display* XDisplayOfIM(XIM);

extern char* XLocaleOfIM(XIM);

extern XIC XCreateIC(XIM, ...);

extern void XDestroyIC(XIC);

extern void XSetICFocus(XIC);

extern void XUnsetICFocus(XIC);

extern wchar_t* XwcResetIC(XIC);

extern char* XmbResetIC(XIC);

extern char* Xutf8ResetIC(XIC);

extern char* XSetICValues(XIC, ...);

extern char* XGetICValues(XIC, ...);

extern XIM XIMOfIC(XIC);

extern Bool XFilterEvent(XEvent*, Window);

extern int XmbLookupString(XIC, XKeyPressedEvent*, char*, int, KeySym*, Status*);

extern int XwcLookupString(XIC, XKeyPressedEvent*, wchar_t*, int, KeySym*, Status*);

extern int Xutf8LookupString(XIC, XKeyPressedEvent*, char*, int, KeySym*, Status*);

extern XVaNestedList XVaCreateNestedList(int, ...);

/* internal connections for IMs */

extern Bool XRegisterIMInstantiateCallback(Display*, _XrmHashBucketRec*, char*, char*, XIDProc, XPointer);

extern Bool XUnregisterIMInstantiateCallback(Display*, _XrmHashBucketRec*, char*, char*, XIDProc, XPointer);

alias XConnectionWatchProc = void function(Display*, XPointer, int, Bool, XPointer*);


extern Status XInternalConnectionNumbers(Display*, int**, int*);

extern void XProcessInternalConnection(Display*, int);

extern Status XAddConnectionWatch(Display*, XConnectionWatchProc, XPointer);

extern void XRemoveConnectionWatch(Display*, XConnectionWatchProc, XPointer);

extern void XSetAuthorization(char*, int, char*, int);

extern int _Xmbtowc(wchar_t*, char*, int);

extern int _Xwctomb(char*, wchar_t);

extern Bool XGetEventData(Display*, XGenericEventCookie*);

extern void XFreeEventData(Display*, XGenericEventCookie*);

// version (__clang__) {
// #pragma clang diagnostic pop
// }

// _XFUNCPROTOEND

// } /* _X11_XLIB_H_ */
