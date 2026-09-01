module externs.X11.extensions.xf86vmproto;
@nogc nothrow:
extern(C): __gshared:
/*

Copyright 1995  Kaleb S. KEITHLEY

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL Kaleb S. KEITHLEY BE LIABLE FOR ANY CLAIM, DAMAGES
OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

Except as contained in this notice, the name of Kaleb S. KEITHLEY
shall not be used in advertising or otherwise to promote the sale, use
or other dealings in this Software without prior written authorization
from Kaleb S. KEITHLEY

*/

/* THIS IS NOT AN X CONSORTIUM STANDARD OR AN X PROJECT TEAM SPECIFICATION */

 
public import externs.X11.extensions.xf86vm;

enum XF86VIDMODENAME = "XFree86-VidModeExtension";

enum XF86VIDMODE_MAJOR_VERSION =	2	/* current version numbers */;
enum XF86VIDMODE_MINOR_VERSION =	2;

enum X_XF86VidModeQueryVersion =	0;
enum X_XF86VidModeGetModeLine =	1;
enum X_XF86VidModeModModeLine =	2;
enum X_XF86VidModeSwitchMode =		3;
enum X_XF86VidModeGetMonitor =		4;
enum X_XF86VidModeLockModeSwitch =	5;
enum X_XF86VidModeGetAllModeLines =	6;
enum X_XF86VidModeAddModeLine =	7;
enum X_XF86VidModeDeleteModeLine =	8;
enum X_XF86VidModeValidateModeLine =	9;
enum X_XF86VidModeSwitchToMode =	10;
enum X_XF86VidModeGetViewPort =	11;
enum X_XF86VidModeSetViewPort =	12;
/* new for version 2.x of this extension */
enum X_XF86VidModeGetDotClocks =	13;
enum X_XF86VidModeSetClientVersion =	14;
enum X_XF86VidModeSetGamma =		15;
enum X_XF86VidModeGetGamma =		16;
enum X_XF86VidModeGetGammaRamp =	17;
enum X_XF86VidModeSetGammaRamp =	18;
enum X_XF86VidModeGetGammaRampSize =	19;
enum X_XF86VidModeGetPermissions =	20;
/*
 * major version 0 == uses parameter-to-wire functions in XFree86 libXxf86vm.
 * major version 1 == uses parameter-to-wire functions hard-coded in xvidtune
 *                    client.
 * major version 2 == uses new protocol version in XFree86 4.0.
 */

struct xXF86VidModeQueryVersionReq {
    CARD8 reqType;		/* always XF86VidModeReqCode */
    CARD8 xf86vidmodeReqType;	/* always X_XF86VidModeQueryVersion */
    CARD16 length;
}
enum sz_xXF86VidModeQueryVersionReq =	4;

struct xXF86VidModeQueryVersionReply {
    BYTE type;			/* X_Reply */
    BOOL pad1;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD16 majorVersion;		/* major version of XF86VidMode */
    CARD16 minorVersion;		/* minor version of XF86VidMode */
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
}
enum sz_xXF86VidModeQueryVersionReply =	32;

struct _XF86VidModeGetModeLine {
    CARD8 reqType;		/* always XF86VidModeReqCode */
    CARD8 xf86vidmodeReqType;
    CARD16 length;
    CARD16 screen;
    CARD16 pad;
}alias xXF86VidModeGetModeLineReq = _XF86VidModeGetModeLine;
alias xXF86VidModeGetAllModeLinesReq = _XF86VidModeGetModeLine;
alias xXF86VidModeGetMonitorReq = _XF86VidModeGetModeLine;
alias xXF86VidModeGetViewPortReq = _XF86VidModeGetModeLine;
alias xXF86VidModeGetDotClocksReq = _XF86VidModeGetModeLine;
alias xXF86VidModeGetPermissionsReq = _XF86VidModeGetModeLine;
enum sz_xXF86VidModeGetModeLineReq =		8;
enum sz_xXF86VidModeGetAllModeLinesReq =	8;
enum sz_xXF86VidModeGetMonitorReq =		8;
enum sz_xXF86VidModeGetViewPortReq =		8;
enum sz_xXF86VidModeGetDotClocksReq =		8;
enum sz_xXF86VidModeGetPermissionsReq =	8;

struct xXF86VidModeGetModeLineReply {
    BYTE type;			/* X_Reply */
    BOOL pad1;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 dotclock;
    CARD16 hdisplay;
    CARD16 hsyncstart;
    CARD16 hsyncend;
    CARD16 htotal;
    CARD16 hskew;
    CARD16 vdisplay;
    CARD16 vsyncstart;
    CARD16 vsyncend;
    CARD16 vtotal;
    CARD16 pad2;
    CARD32 flags;
    CARD32 reserved1;
    CARD32 reserved2;
    CARD32 reserved3;
    CARD32 privsize;
}
enum sz_xXF86VidModeGetModeLineReply =	52;

/* 0.x version */
struct xXF86OldVidModeGetModeLineReply {
    BYTE type;			/* X_Reply */
    BOOL pad1;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 dotclock;
    CARD16 hdisplay;
    CARD16 hsyncstart;
    CARD16 hsyncend;
    CARD16 htotal;
    CARD16 vdisplay;
    CARD16 vsyncstart;
    CARD16 vsyncend;
    CARD16 vtotal;
    CARD32 flags;
    CARD32 privsize;
}
enum sz_xXF86OldVidModeGetModeLineReply =	36;

struct xXF86VidModeModeInfo {
    CARD32 dotclock;
    CARD16 hdisplay;
    CARD16 hsyncstart;
    CARD16 hsyncend;
    CARD16 htotal;
    CARD32 hskew;
    CARD16 vdisplay;
    CARD16 vsyncstart;
    CARD16 vsyncend;
    CARD16 vtotal;
    CARD32 pad1;
    CARD32 flags;
    CARD32 reserved1;
    CARD32 reserved2;
    CARD32 reserved3;
    CARD32 privsize;
}

/* 0.x version */
struct xXF86OldVidModeModeInfo {
    CARD32 dotclock;
    CARD16 hdisplay;
    CARD16 hsyncstart;
    CARD16 hsyncend;
    CARD16 htotal;
    CARD16 vdisplay;
    CARD16 vsyncstart;
    CARD16 vsyncend;
    CARD16 vtotal;
    CARD32 flags;
    CARD32 privsize;
}

struct xXF86VidModeGetAllModeLinesReply {
    BYTE type;			/* X_Reply */
    BOOL pad1;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 modecount;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
}
enum sz_xXF86VidModeGetAllModeLinesReply =	32;

struct xXF86VidModeAddModeLineReq {
    CARD8 reqType;		/* always XF86VidModeReqCode */
    CARD8 xf86vidmodeReqType;	/* always X_XF86VidModeAddMode */
    CARD16 length;
    CARD32 screen;			/* could be CARD16 but need the pad */
    CARD32 dotclock;
    CARD16 hdisplay;
    CARD16 hsyncstart;
    CARD16 hsyncend;
    CARD16 htotal;
    CARD16 hskew;
    CARD16 vdisplay;
    CARD16 vsyncstart;
    CARD16 vsyncend;
    CARD16 vtotal;
    CARD16 pad1;
    CARD32 flags;
    CARD32 reserved1;
    CARD32 reserved2;
    CARD32 reserved3;
    CARD32 privsize;
    CARD32 after_dotclock;
    CARD16 after_hdisplay;
    CARD16 after_hsyncstart;
    CARD16 after_hsyncend;
    CARD16 after_htotal;
    CARD16 after_hskew;
    CARD16 after_vdisplay;
    CARD16 after_vsyncstart;
    CARD16 after_vsyncend;
    CARD16 after_vtotal;
    CARD16 pad2;
    CARD32 after_flags;
    CARD32 reserved4;
    CARD32 reserved5;
    CARD32 reserved6;
}
enum sz_xXF86VidModeAddModeLineReq =	92;

/* 0.x version */
struct xXF86OldVidModeAddModeLineReq {
    CARD8 reqType;		/* always XF86VidModeReqCode */
    CARD8 xf86vidmodeReqType;	/* always X_XF86VidModeAddMode */
    CARD16 length;
    CARD32 screen;			/* could be CARD16 but need the pad */
    CARD32 dotclock;
    CARD16 hdisplay;
    CARD16 hsyncstart;
    CARD16 hsyncend;
    CARD16 htotal;
    CARD16 vdisplay;
    CARD16 vsyncstart;
    CARD16 vsyncend;
    CARD16 vtotal;
    CARD32 flags;
    CARD32 privsize;
    CARD32 after_dotclock;
    CARD16 after_hdisplay;
    CARD16 after_hsyncstart;
    CARD16 after_hsyncend;
    CARD16 after_htotal;
    CARD16 after_vdisplay;
    CARD16 after_vsyncstart;
    CARD16 after_vsyncend;
    CARD16 after_vtotal;
    CARD32 after_flags;
}
enum sz_xXF86OldVidModeAddModeLineReq =	60;

struct xXF86VidModeModModeLineReq {
    CARD8 reqType;		/* always XF86VidModeReqCode */
    CARD8 xf86vidmodeReqType;	/* always X_XF86VidModeModModeLine */
    CARD16 length;
    CARD32 screen;			/* could be CARD16 but need the pad */
    CARD16 hdisplay;
    CARD16 hsyncstart;
    CARD16 hsyncend;
    CARD16 htotal;
    CARD16 hskew;
    CARD16 vdisplay;
    CARD16 vsyncstart;
    CARD16 vsyncend;
    CARD16 vtotal;
    CARD16 pad1;
    CARD32 flags;
    CARD32 reserved1;
    CARD32 reserved2;
    CARD32 reserved3;
    CARD32 privsize;
}
enum sz_xXF86VidModeModModeLineReq =	48;

/* 0.x version */
struct xXF86OldVidModeModModeLineReq {
    CARD8 reqType;		/* always XF86OldVidModeReqCode */
    CARD8 xf86vidmodeReqType;	/* always X_XF86OldVidModeModModeLine */
    CARD16 length;
    CARD32 screen;			/* could be CARD16 but need the pad */
    CARD16 hdisplay;
    CARD16 hsyncstart;
    CARD16 hsyncend;
    CARD16 htotal;
    CARD16 vdisplay;
    CARD16 vsyncstart;
    CARD16 vsyncend;
    CARD16 vtotal;
    CARD32 flags;
    CARD32 privsize;
}
enum sz_xXF86OldVidModeModModeLineReq =	32;

struct _XF86VidModeValidateModeLine {
    CARD8 reqType;		/* always XF86VidModeReqCode */
    CARD8 xf86vidmodeReqType;
    CARD16 length;
    CARD32 screen;			/* could be CARD16 but need the pad */
    CARD32 dotclock;
    CARD16 hdisplay;
    CARD16 hsyncstart;
    CARD16 hsyncend;
    CARD16 htotal;
    CARD16 hskew;
    CARD16 vdisplay;
    CARD16 vsyncstart;
    CARD16 vsyncend;
    CARD16 vtotal;
    CARD16 pad1;
    CARD32 flags;
    CARD32 reserved1;
    CARD32 reserved2;
    CARD32 reserved3;
    CARD32 privsize;
}alias xXF86VidModeDeleteModeLineReq = _XF86VidModeValidateModeLine;
alias xXF86VidModeValidateModeLineReq = _XF86VidModeValidateModeLine;
alias xXF86VidModeSwitchToModeReq = _XF86VidModeValidateModeLine;
enum sz_xXF86VidModeDeleteModeLineReq =	52;
enum sz_xXF86VidModeValidateModeLineReq =	52;
enum sz_xXF86VidModeSwitchToModeReq =		52;

/* 0.x version */
struct _XF86OldVidModeValidateModeLine {
    CARD8 reqType;		/* always XF86OldVidModeReqCode */
    CARD8 xf86vidmodeReqType;
    CARD16 length;
    CARD32 screen;			/* could be CARD16 but need the pad */
    CARD32 dotclock;
    CARD16 hdisplay;
    CARD16 hsyncstart;
    CARD16 hsyncend;
    CARD16 htotal;
    CARD16 vdisplay;
    CARD16 vsyncstart;
    CARD16 vsyncend;
    CARD16 vtotal;
    CARD32 flags;
    CARD32 privsize;
}alias xXF86OldVidModeDeleteModeLineReq = _XF86OldVidModeValidateModeLine;
alias xXF86OldVidModeValidateModeLineReq = _XF86OldVidModeValidateModeLine;
alias xXF86OldVidModeSwitchToModeReq = _XF86OldVidModeValidateModeLine;
enum sz_xXF86OldVidModeDeleteModeLineReq =	36;
enum sz_xXF86OldVidModeValidateModeLineReq =	36;
enum sz_xXF86OldVidModeSwitchToModeReq =	36;

struct xXF86VidModeSwitchModeReq {
    CARD8 reqType;		/* always XF86VidModeReqCode */
    CARD8 xf86vidmodeReqType;	/* always X_XF86VidModeSwitchMode */
    CARD16 length;
    CARD16 screen;
    CARD16 zoom;
}
enum sz_xXF86VidModeSwitchModeReq =	8;

struct xXF86VidModeLockModeSwitchReq {
    CARD8 reqType;		/* always XF86VidModeReqCode */
    CARD8 xf86vidmodeReqType;	/* always X_XF86VidModeLockModeSwitch */
    CARD16 length;
    CARD16 screen;
    CARD16 lock;
}
enum sz_xXF86VidModeLockModeSwitchReq =	8;

struct xXF86VidModeValidateModeLineReply {
    BYTE type;			/* X_Reply */
    BOOL pad1;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 status;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
}
enum sz_xXF86VidModeValidateModeLineReply =	32;

struct xXF86VidModeGetMonitorReply {
    BYTE type;			/* X_Reply */
    BOOL pad1;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD8 vendorLength;
    CARD8 modelLength;
    CARD8 nhsync;
    CARD8 nvsync;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
}
enum sz_xXF86VidModeGetMonitorReply =	32;

struct xXF86VidModeGetViewPortReply {
    BYTE type;
    BOOL pad1;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 x;
    CARD32 y;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
}
enum sz_xXF86VidModeGetViewPortReply =	32;

struct xXF86VidModeSetViewPortReq {
    CARD8 reqType;		/* always VidModeReqCode */
    CARD8 xf86vidmodeReqType;	/* always X_XF86VidModeSetViewPort */
    CARD16 length;
    CARD16 screen;
    CARD16 pad;
    CARD32 x;
    CARD32 y;
}
enum sz_xXF86VidModeSetViewPortReq =	16;

struct xXF86VidModeGetDotClocksReply {
    BYTE type;
    BOOL pad1;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 flags;
    CARD32 clocks;
    CARD32 maxclocks;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
}
enum sz_xXF86VidModeGetDotClocksReply =	32;

struct xXF86VidModeSetClientVersionReq {
    CARD8 reqType;		/* always XF86VidModeReqCode */
    CARD8 xf86vidmodeReqType;
    CARD16 length;
    CARD16 major;
    CARD16 minor;
}
enum sz_xXF86VidModeSetClientVersionReq =	8;

struct xXF86VidModeGetGammaReq {
    CARD8 reqType;		/* always XF86VidModeReqCode */
    CARD8 xf86vidmodeReqType;
    CARD16 length;
    CARD16 screen;
    CARD16 pad;
    CARD32 pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
}
enum sz_xXF86VidModeGetGammaReq =		32;

struct xXF86VidModeGetGammaReply {
    BYTE type;
    BOOL pad;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 red;
    CARD32 green;
    CARD32 blue;
    CARD32 pad1;
    CARD32 pad2;
    CARD32 pad3;
}
enum sz_xXF86VidModeGetGammaReply =		32;

struct xXF86VidModeSetGammaReq {
    CARD8 reqType;		/* always XF86VidModeReqCode */
    CARD8 xf86vidmodeReqType;
    CARD16 length;
    CARD16 screen;
    CARD16 pad;
    CARD32 red;
    CARD32 green;
    CARD32 blue;
    CARD32 pad1;
    CARD32 pad2;
    CARD32 pad3;
}
enum sz_xXF86VidModeSetGammaReq =		32;


struct xXF86VidModeSetGammaRampReq {
    CARD8 reqType;                /* always XF86VidModeReqCode */
    CARD8 xf86vidmodeReqType;
    CARD16 length;
    CARD16 screen;
    CARD16 size;
}
enum sz_xXF86VidModeSetGammaRampReq =             8;

struct xXF86VidModeGetGammaRampReq {
    CARD8 reqType;                /* always XF86VidModeReqCode */
    CARD8 xf86vidmodeReqType;
    CARD16 length;
    CARD16 screen;
    CARD16 size;
}
enum sz_xXF86VidModeGetGammaRampReq =             8;

struct xXF86VidModeGetGammaRampReply {
    BYTE type;
    BOOL pad;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD16 size;
    CARD16 pad0;
    CARD32 pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
}
enum sz_xXF86VidModeGetGammaRampReply =            32;

struct xXF86VidModeGetGammaRampSizeReq {
    CARD8 reqType;                /* always XF86VidModeReqCode */
    CARD8 xf86vidmodeReqType;
    CARD16 length;
    CARD16 screen;
    CARD16 pad;
}
enum sz_xXF86VidModeGetGammaRampSizeReq =             8;

struct xXF86VidModeGetGammaRampSizeReply {
    BYTE type;
    BOOL pad;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD16 size;
    CARD16 pad0;
    CARD32 pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
}
enum sz_xXF86VidModeGetGammaRampSizeReply =            32;

struct xXF86VidModeGetPermissionsReply {
    BYTE type;
    BOOL pad;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 permissions;
    CARD32 pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
}
enum sz_xXF86VidModeGetPermissionsReply =            32;


 /* _XF86VIDMODEPROTO_H_ */

