module externs.X11.extensions.dpmsproto;
@nogc nothrow:
extern(C): __gshared:
import core.stdc.config: c_long, c_ulong;
/*****************************************************************

Copyright (c) 1996 Digital Equipment Corporation, Maynard, Massachusetts.

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

 
public import externs.X11.extensions.dpmsconst;
public import externs.X11.Xmd;

alias XID = c_ulong;
alias Time = XID;

enum X_DPMSGetVersion =	0;
enum X_DPMSCapable =		1;
enum X_DPMSGetTimeouts =	2;
enum X_DPMSSetTimeouts =	3;
enum X_DPMSEnable =		4;
enum X_DPMSDisable =		5;
enum X_DPMSForceLevel =       	6;
enum X_DPMSInfo =       	7;
enum X_DPMSSelectInput =	8;

enum DPMSNumberEvents =	0;

enum DPMSNumberErrors =	0;


struct xDPMSGetVersionReq {
    CARD8 reqType;	/* always DPMSCode */
    CARD8 dpmsReqType;	/* always X_DPMSGetVersion */
    CARD16 length;
    CARD16 majorVersion;
    CARD16 minorVersion;
}
enum sz_xDPMSGetVersionReq = 8;

struct xDPMSGetVersionReply {
    BYTE type;			/* X_Reply */
    CARD8 pad0;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD16 majorVersion;
    CARD16 minorVersion;
    CARD32 pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
}
enum sz_xDPMSGetVersionReply = 32;

struct xDPMSCapableReq {
    CARD8 reqType;	/* always DPMSCode */
    CARD8 dpmsReqType;	/* always X_DPMSCapable */
    CARD16 length;
}
enum sz_xDPMSCapableReq = 4;

struct xDPMSCapableReply {
    BYTE type;			/* X_Reply */
    CARD8 pad0;
    CARD16 sequenceNumber;
    CARD32 length;
    BOOL xGenericEventcapable;
    CARD8 pad1;
    CARD16 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
    CARD32 pad7;
}
enum sz_xDPMSCapableReply = 32;

struct xDPMSGetTimeoutsReq {
    CARD8 reqType;	/* always DPMSCode */
    CARD8 dpmsReqType;	/* always X_DPMSGetTimeouts */
    CARD16 length;
}
enum sz_xDPMSGetTimeoutsReq = 4;

struct xDPMSGetTimeoutsReply {
    BYTE type;			/* X_Reply */
    CARD8 pad0;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD16 standby;
    CARD16 suspend;
    CARD16 off;
    CARD16 pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
}
enum sz_xDPMSGetTimeoutsReply = 32;

struct xDPMSSetTimeoutsReq {
    CARD8 reqType;	/* always DPMSCode */
    CARD8 dpmsReqType;	/* always X_DPMSSetTimeouts */
    CARD16 length;
    CARD16 standby;
    CARD16 suspend;
    CARD16 off;
    CARD16 pad0;
}
enum sz_xDPMSSetTimeoutsReq = 12;

struct xDPMSEnableReq {
    CARD8 reqType;	/* always DPMSCode */
    CARD8 dpmsReqType;	/* always X_DPMSEnable */
    CARD16 length;
}
enum sz_xDPMSEnableReq = 4;

struct xDPMSDisableReq {
    CARD8 reqType;	/* always DPMSCode */
    CARD8 dpmsReqType;	/* always X_DPMSDisable */
    CARD16 length;
}
enum sz_xDPMSDisableReq = 4;

struct xDPMSForceLevelReq {
    CARD8 reqType;	/* always DPMSCode */
    CARD8 dpmsReqType;	/* always X_DPMSForceLevel */
    CARD16 length;
    CARD16 level;		/* power level requested */
    CARD16 pad0;
}
enum sz_xDPMSForceLevelReq = 8;

struct xDPMSInfoReq {
    CARD8 reqType;	/* always DPMSCode */
    CARD8 dpmsReqType;	/* always X_DPMSInfo */
    CARD16 length;
}
enum sz_xDPMSInfoReq = 4;

struct xDPMSInfoReply {
    BYTE type;			/* X_Reply */
    CARD8 pad0;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD16 power_level;
    BOOL state;
    CARD8 pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
}
enum sz_xDPMSInfoReply = 32;

struct xDPMSSelectInputReq {
    CARD8 reqType;	/* always DPMSCode */
    CARD8 dpmsReqType;	/* always X_DPMSSelectInput */
    CARD16 length;
    CARD32 eventMask;
}
enum sz_xDPMSSelectInputReq = 8;

struct xDPMSInfoNotifyEvent {
    CARD8 type;
    CARD8 extension;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD16 evtype;
    CARD16 pad0;
    Time timestamp;
    CARD16 power_level;
    BOOL state;
    CARD8 pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
}
enum sz_xDPMSInfoNotifyEvent = 32;

 /* _DPMSPROTO_H_ */
