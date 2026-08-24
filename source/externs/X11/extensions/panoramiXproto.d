module externs.X11.extensions.panoramiXproto;
@nogc nothrow:
extern(C): __gshared:
/*****************************************************************
Copyright (c) 1991, 1997 Digital Equipment Corporation, Maynard, Massachusetts.
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software.

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
DIGITAL EQUIPMENT CORPORATION BE LIABLE FOR ANY CLAIM, DAMAGES, INCLUDING,
BUT NOT LIMITED TO CONSEQUENTIAL OR INCIDENTAL DAMAGES, OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Except as contained in this notice, the name of Digital Equipment Corporation
shall not be used in advertising or otherwise to promote the sale, use or other
dealings in this Software without prior written authorization from Digital
Equipment Corporation.
******************************************************************/

/* THIS IS NOT AN X PROJECT TEAM SPECIFICATION */

 
public import externs.X11.Xmd;

enum PANORAMIX_MAJOR_VERSION =         1       /* current version number */;
enum PANORAMIX_MINOR_VERSION =         1;

enum PANORAMIX_PROTOCOL_NAME = "XINERAMA";

enum X_PanoramiXQueryVersion =		0;
enum X_PanoramiXGetState =		1;
enum X_PanoramiXGetScreenCount =	2;
enum X_PanoramiXGetScreenSize =	3;

enum X_XineramaIsActive =		4;
enum X_XineramaQueryScreens =		5;

struct xPanoramiXQueryVersionReq {
	CARD8 reqType;		/* always PanoramiXReqCode */
	CARD8 panoramiXReqType;	/* always X_PanoramiXQueryVersion */
	CARD16 length;
	CARD8 clientMajor;
	CARD8 clientMinor;
	CARD16 unused;
}

enum sz_xPanoramiXQueryVersionReq =	8;

struct xPanoramiXQueryVersionReply {
	CARD8 type;			/* must be X_Reply */
	CARD8 pad1;			/* unused	*/
	CARD16 sequenceNumber;		/* last sequence number */
	CARD32 length;			/* 0 */
	CARD16 majorVersion;
	CARD16 minorVersion;
	CARD32 pad2;			/* unused */
	CARD32 pad3;			/* unused */
	CARD32 pad4;			/* unused */
	CARD32 pad5;			/* unused */
	CARD32 pad6;			/* unused */
}

enum sz_xPanoramiXQueryVersionReply =	32;


struct xPanoramiXGetStateReq {
        CARD8 reqType;	        /* always PanoramiXReqCode */
        CARD8 panoramiXReqType;    	/* always X_PanoramiXGetState */
        CARD16 length;
        CARD32 window;
}
enum sz_xPanoramiXGetStateReq =	8;

struct xPanoramiXGetStateReply {
	BYTE type;
	BYTE state;
	CARD16 sequenceNumber;
	CARD32 length;
	CARD32 window;
	CARD32 pad1;			/* unused */
	CARD32 pad2;			/* unused */
	CARD32 pad3;			/* unused */
	CARD32 pad4;			/* unused */
	CARD32 pad5;			/* unused */
}

enum sz_panoramiXGetStateReply =	32;

struct xPanoramiXGetScreenCountReq {
        CARD8 reqType;             /* always PanoramiXReqCode */
        CARD8 panoramiXReqType;    /* always X_PanoramiXGetScreenCount */
        CARD16 length;
        CARD32 window;
}
enum sz_xPanoramiXGetScreenCountReq =	8;

struct xPanoramiXGetScreenCountReply {
	BYTE type;
	BYTE ScreenCount;
	CARD16 sequenceNumber;
	CARD32 length;
	CARD32 window;
	CARD32 pad1;			/* unused */
	CARD32 pad2;			/* unused */
	CARD32 pad3;			/* unused */
	CARD32 pad4;			/* unused */
	CARD32 pad5;			/* unused */
}
enum sz_panoramiXGetScreenCountReply =	32;

struct xPanoramiXGetScreenSizeReq {
        CARD8 reqType;                /* always PanoramiXReqCode */
        CARD8 panoramiXReqType;	/* always X_PanoramiXGetState */
        CARD16 length;
        CARD32 window;
        CARD32 screen;
}
enum sz_xPanoramiXGetScreenSizeReq =	12;

struct xPanoramiXGetScreenSizeReply {
	BYTE type;
	CARD8 pad1;
	CARD16 sequenceNumber;
	CARD32 length;
	CARD32 width;
	CARD32 height;
	CARD32 window;
	CARD32 screen;
	CARD32 pad2;			/* unused */
	CARD32 pad3;			/* unused */
}
enum sz_panoramiXGetScreenSizeReply = 32;

/************  Alternate protocol  ******************/

struct xXineramaIsActiveReq {
        CARD8 reqType;
        CARD8 panoramiXReqType;
        CARD16 length;
}
enum sz_xXineramaIsActiveReq = 4;

struct xXineramaIsActiveReply {
	BYTE type;
	CARD8 pad1;
	CARD16 sequenceNumber;
	CARD32 length;
	CARD32 state;
	CARD32 pad2;
	CARD32 pad3;
	CARD32 pad4;
	CARD32 pad5;
	CARD32 pad6;
}
enum sz_XineramaIsActiveReply = 32;


struct xXineramaQueryScreensReq {
        CARD8 reqType;
        CARD8 panoramiXReqType;
        CARD16 length;
}
enum sz_xXineramaQueryScreensReq = 4;

struct xXineramaQueryScreensReply {
	BYTE type;
	CARD8 pad1;
	CARD16 sequenceNumber;
	CARD32 length;
	CARD32 number;
	CARD32 pad2;
	CARD32 pad3;
	CARD32 pad4;
	CARD32 pad5;
	CARD32 pad6;
}
enum sz_XineramaQueryScreensReply = 32;

struct xXineramaScreenInfo {
	INT16 x_org;
	INT16 y_org;
	CARD16 width;
	CARD16 height;
}
enum sz_XineramaScreenInfo = 8;


