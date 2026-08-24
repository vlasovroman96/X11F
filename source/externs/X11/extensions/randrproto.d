module externs.X11.extensions.randrproto;
@nogc nothrow:
extern(C): __gshared:
/*
 * Copyright © 2000 Compaq Computer Corporation
 * Copyright © 2002 Hewlett-Packard Company
 * Copyright © 2006 Intel Corporation
 * Copyright © 2008 Red Hat, Inc.
 *
 * Permission to use, copy, modify, distribute, and sell this software and its
 * documentation for any purpose is hereby granted without fee, provided that
 * the above copyright notice appear in all copies and that both that copyright
 * notice and this permission notice appear in supporting documentation, and
 * that the name of the copyright holders not be used in advertising or
 * publicity pertaining to distribution of the software without specific,
 * written prior permission.  The copyright holders make no representations
 * about the suitability of this software for any purpose.  It is provided "as
 * is" without express or implied warranty.
 *
 * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
 * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
 * EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY SPECIAL, INDIRECT OR
 * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
 * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
 * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE
 * OF THIS SOFTWARE.
 *
 * Author:  Jim Gettys, Hewlett-Packard Company, Inc.
 *	    Keith Packard, Intel Corporation
 */

/* note that RANDR 1.0 is incompatible with version 0.0, or 0.1 */
/* V1.0 removes depth switching from the protocol */
 
public import externs.X11.extensions.randr;
public import externs.X11.extensions.renderproto;

alias Window = CARD32;
alias Drawable = CARD32;
alias Font = CARD32;
alias Pixmap = CARD32;
alias Cursor = CARD32;
alias Colormap = CARD32;
alias GContext = CARD32;
alias Atom = CARD32;
alias Time = CARD32;
alias KeyCode = CARD8;
alias KeySym = CARD32;
alias RROutput = CARD32;
alias RRMode = CARD32;
alias RRCrtc = CARD32;
alias RRProvider = CARD32;
alias RRModeFlags = CARD32;
alias RRLease = CARD32;

alias Rotation = CARD16;
alias SizeID = CARD16;
alias SubpixelOrder = CARD16;

/*
 * data structures
 */

struct xScreenSizes {
    CARD16 widthInPixels;
    CARD16 heightInPixels;
    CARD16 widthInMillimeters;
    CARD16 heightInMillimeters;
}
enum sz_xScreenSizes = 8;

/*
 * requests and replies
 */

struct xRRQueryVersionReq {
    CARD8 reqType;
    CARD8 randrReqType;
    CARD16 length;
    CARD32 majorVersion;
    CARD32 minorVersion;
}
enum sz_xRRQueryVersionReq =   12;

struct xRRQueryVersionReply {
    BYTE type;   /* X_Reply */
    BYTE pad1;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 majorVersion;
    CARD32 minorVersion;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
}
enum sz_xRRQueryVersionReply =	32;

struct xRRGetScreenInfoReq {
    CARD8 reqType;
    CARD8 randrReqType;
    CARD16 length;
    Window window;
}
enum sz_xRRGetScreenInfoReq =   8;

/*
 * the xRRScreenInfoReply structure is followed by:
 *
 * the size information
 */


struct xRRGetScreenInfoReply {
    BYTE type;   /* X_Reply */
    BYTE setOfRotations;
    CARD16 sequenceNumber;
    CARD32 length;
    Window root;
    Time timestamp;
    Time configTimestamp;
    CARD16 nSizes;
    SizeID sizeID;
    Rotation rotation;
    CARD16 rate;
    CARD16 nrateEnts;
    CARD16 pad;
}
enum sz_xRRGetScreenInfoReply =	32;

struct xRR1_0SetScreenConfigReq {
    CARD8 reqType;
    CARD8 randrReqType;
    CARD16 length;
    Drawable drawable;
    Time timestamp;
    Time configTimestamp;
    SizeID sizeID;
    Rotation rotation;
}
enum sz_xRR1_0SetScreenConfigReq =   20;

struct xRRSetScreenConfigReq {
    CARD8 reqType;
    CARD8 randrReqType;
    CARD16 length;
    Drawable drawable;
    Time timestamp;
    Time configTimestamp;
    SizeID sizeID;
    Rotation rotation;
    CARD16 rate;
    CARD16 pad;
}
enum sz_xRRSetScreenConfigReq =   24;

struct xRRSetScreenConfigReply {
    BYTE type;   /* X_Reply */
    CARD8 status;
    CARD16 sequenceNumber;
    CARD32 length;
    Time newTimestamp;
    Time newConfigTimestamp;
    Window root;
    CARD16 subpixelOrder;
    CARD16 pad4;
    CARD32 pad5;
    CARD32 pad6;
}
enum sz_xRRSetScreenConfigReply = 32;

struct xRRSelectInputReq {
    CARD8 reqType;
    CARD8 randrReqType;
    CARD16 length;
    Window window;
    CARD16 enable;
    CARD16 pad2;
}
enum sz_xRRSelectInputReq =   12;

/*
 * Additions for version 1.2
 */

struct xRRModeInfo {
    RRMode id;
    CARD16 width;
    CARD16 height;
    CARD32 dotClock;
    CARD16 hSyncStart;
    CARD16 hSyncEnd;
    CARD16 hTotal;
    CARD16 hSkew;
    CARD16 vSyncStart;
    CARD16 vSyncEnd;
    CARD16 vTotal;
    CARD16 nameLength;
    RRModeFlags modeFlags;
}
enum sz_xRRModeInfo =		    32;

struct xRRGetScreenSizeRangeReq {
    CARD8 reqType;
    CARD8 randrReqType;
    CARD16 length;
    Window window;
}
enum sz_xRRGetScreenSizeRangeReq = 8;

struct xRRGetScreenSizeRangeReply {
    BYTE type;   /* X_Reply */
    CARD8 pad;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD16 minWidth;
    CARD16 minHeight;
    CARD16 maxWidth;
    CARD16 maxHeight;
    CARD32 pad0;
    CARD32 pad1;
    CARD32 pad2;
    CARD32 pad3;
}
enum sz_xRRGetScreenSizeRangeReply = 32;

struct xRRSetScreenSizeReq {
    CARD8 reqType;
    CARD8 randrReqType;
    CARD16 length;
    Window window;
    CARD16 width;
    CARD16 height;
    CARD32 widthInMillimeters;
    CARD32 heightInMillimeters;
}
enum sz_xRRSetScreenSizeReq =	    20;

struct xRRGetScreenResourcesReq {
    CARD8 reqType;
    CARD8 randrReqType;
    CARD16 length;
    Window window;
}
enum sz_xRRGetScreenResourcesReq = 8;

struct xRRGetScreenResourcesReply {
    BYTE type;
    CARD8 pad;
    CARD16 sequenceNumber;
    CARD32 length;
    Time timestamp;
    Time configTimestamp;
    CARD16 nCrtcs;
    CARD16 nOutputs;
    CARD16 nModes;
    CARD16 nbytesNames;
    CARD32 pad1;
    CARD32 pad2;
}
enum sz_xRRGetScreenResourcesReply =	32;

struct xRRGetOutputInfoReq {
    CARD8 reqType;
    CARD8 randrReqType;
    CARD16 length;
    RROutput output;
    Time configTimestamp;
}
enum sz_xRRGetOutputInfoReq =		12;

struct xRRGetOutputInfoReply {
    BYTE type;
    CARD8 status;
    CARD16 sequenceNumber;
    CARD32 length;
    Time timestamp;
    RRCrtc crtc;
    CARD32 mmWidth;
    CARD32 mmHeight;
    CARD8 connection;
    CARD8 subpixelOrder;
    CARD16 nCrtcs;
    CARD16 nModes;
    CARD16 nPreferred;
    CARD16 nClones;
    CARD16 nameLength;
}
enum sz_xRRGetOutputInfoReply =	36;

struct xRRListOutputPropertiesReq {
    CARD8 reqType;
    CARD8 randrReqType;
    CARD16 length;
    RROutput output;
}
enum sz_xRRListOutputPropertiesReq =	8;

struct xRRListOutputPropertiesReply {
    BYTE type;
    CARD8 pad0;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD16 nAtoms;
    CARD16 pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
}
enum sz_xRRListOutputPropertiesReply =	32;

struct xRRQueryOutputPropertyReq {
    CARD8 reqType;
    CARD8 randrReqType;
    CARD16 length;
    RROutput output;
    Atom property;
}
enum sz_xRRQueryOutputPropertyReq =	12;

struct xRRQueryOutputPropertyReply {
    BYTE type;
    BYTE pad0;
    CARD16 sequenceNumber;
    CARD32 length;
    BOOL pending;
    BOOL range;
    BOOL immutable_;
    BYTE pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
}
enum sz_xRRQueryOutputPropertyReply =	32;

struct xRRConfigureOutputPropertyReq {
    CARD8 reqType;
    CARD8 randrReqType;
    CARD16 length;
    RROutput output;
    Atom property;
    BOOL pending;
    BOOL range;
    CARD16 pad;
}
enum sz_xRRConfigureOutputPropertyReq =	16;

struct xRRChangeOutputPropertyReq {
    CARD8 reqType;
    CARD8 randrReqType;
    CARD16 length;
    RROutput output;
    Atom property;
    Atom type;
    CARD8 format;
    CARD8 mode;
    CARD16 pad;
    CARD32 nUnits;
}
enum sz_xRRChangeOutputPropertyReq =	24;

struct xRRDeleteOutputPropertyReq {
    CARD8 reqType;
    CARD8 randrReqType;
    CARD16 length;
    RROutput output;
    Atom property;
}
enum sz_xRRDeleteOutputPropertyReq =	12;

struct xRRGetOutputPropertyReq {
    CARD8 reqType;
    CARD8 randrReqType;
    CARD16 length;
    RROutput output;
    Atom property;
    Atom type;
    CARD32 longOffset;
    CARD32 longLength;
version (none) {
    BOOL _delete;
} else {
    BOOL delete_;
}
    BOOL pending;
    CARD16 pad1;
}
enum sz_xRRGetOutputPropertyReq =	28;

struct xRRGetOutputPropertyReply {
    BYTE type;
    CARD8 format;
    CARD16 sequenceNumber;
    CARD32 length;
    Atom propertyType;
    CARD32 bytesAfter;
    CARD32 nItems;
    CARD32 pad1;
    CARD32 pad2;
    CARD32 pad3;
}
enum sz_xRRGetOutputPropertyReply =	32;

struct xRRCreateModeReq {
    CARD8 reqType;
    CARD8 randrReqType;
    CARD16 length;
    Window window;
    xRRModeInfo modeInfo;
}
enum sz_xRRCreateModeReq =		40;

struct xRRCreateModeReply {
    BYTE type;
    CARD8 pad0;
    CARD16 sequenceNumber;
    CARD32 length;
    RRMode mode;
    CARD32 pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
}
enum sz_xRRCreateModeReply =		32;

struct xRRDestroyModeReq {
    CARD8 reqType;
    CARD8 randrReqType;
    CARD16 length;
    RRMode mode;
}
enum sz_xRRDestroyModeReq =		8;

struct xRRAddOutputModeReq {
    CARD8 reqType;
    CARD8 randrReqType;
    CARD16 length;
    RROutput output;
    RRMode mode;
}
enum sz_xRRAddOutputModeReq =		12;

struct xRRDeleteOutputModeReq {
    CARD8 reqType;
    CARD8 randrReqType;
    CARD16 length;
    RROutput output;
    RRMode mode;
}
enum sz_xRRDeleteOutputModeReq =	12;

struct xRRGetCrtcInfoReq {
    CARD8 reqType;
    CARD8 randrReqType;
    CARD16 length;
    RRCrtc crtc;
    Time configTimestamp;
}
enum sz_xRRGetCrtcInfoReq =		12;

struct xRRGetCrtcInfoReply {
    BYTE type;
    CARD8 status;
    CARD16 sequenceNumber;
    CARD32 length;
    Time timestamp;
    INT16 x;
    INT16 y;
    CARD16 width;
    CARD16 height;
    RRMode mode;
    Rotation rotation;
    Rotation rotations;
    CARD16 nOutput;
    CARD16 nPossibleOutput;
}
enum sz_xRRGetCrtcInfoReply =		32;

struct xRRSetCrtcConfigReq {
    CARD8 reqType;
    CARD8 randrReqType;
    CARD16 length;
    RRCrtc crtc;
    Time timestamp;
    Time configTimestamp;
    INT16 x;
    INT16 y;
    RRMode mode;
    Rotation rotation;
    CARD16 pad;
}
enum sz_xRRSetCrtcConfigReq =		28;

struct xRRSetCrtcConfigReply {
    BYTE type;
    CARD8 status;
    CARD16 sequenceNumber;
    CARD32 length;
    Time newTimestamp;
    CARD32 pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
}
enum sz_xRRSetCrtcConfigReply =	32;

struct xRRGetCrtcGammaSizeReq {
    CARD8 reqType;
    CARD8 randrReqType;
    CARD16 length;
    RRCrtc crtc;
}
enum sz_xRRGetCrtcGammaSizeReq =	8;

struct xRRGetCrtcGammaSizeReply {
    BYTE type;
    CARD8 status;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD16 size;
    CARD16 pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
}
enum sz_xRRGetCrtcGammaSizeReply =	32;

struct xRRGetCrtcGammaReq {
    CARD8 reqType;
    CARD8 randrReqType;
    CARD16 length;
    RRCrtc crtc;
}
enum sz_xRRGetCrtcGammaReq =		8;

struct xRRGetCrtcGammaReply {
    BYTE type;
    CARD8 status;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD16 size;
    CARD16 pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
}
enum sz_xRRGetCrtcGammaReply =		32;

struct xRRSetCrtcGammaReq {
    CARD8 reqType;
    CARD8 randrReqType;
    CARD16 length;
    RRCrtc crtc;
    CARD16 size;
    CARD16 pad1;
}
enum sz_xRRSetCrtcGammaReq =		12;

/*
 * Additions for V1.3
 */

alias xRRGetScreenResourcesCurrentReq = xRRGetScreenResourcesReq;

enum sz_xRRGetScreenResourcesCurrentReq = sz_xRRGetScreenResourcesReq;

alias xRRGetScreenResourcesCurrentReply = xRRGetScreenResourcesReply;
enum sz_xRRGetScreenResourcesCurrentReply =	sz_xRRGetScreenResourcesReply;

struct xRRSetCrtcTransformReq {
    CARD8 reqType;
    CARD8 randrReqType;
    CARD16 length;
    RRCrtc crtc;
    xRenderTransform transform;
    CARD16 nbytesFilter;	/* number of bytes in filter name */
    CARD16 pad;
}

enum sz_xRRSetCrtcTransformReq =	48;

struct xRRGetCrtcTransformReq {
    CARD8 reqType;
    CARD8 randrReqType;
    CARD16 length;
    RRCrtc crtc;
}

enum sz_xRRGetCrtcTransformReq =	8;

struct xRRGetCrtcTransformReply {
    BYTE type;
    CARD8 status;
    CARD16 sequenceNumber;
    CARD32 length;
    xRenderTransform pendingTransform;
    BYTE hasTransforms;
    CARD8 pad0;
    CARD16 pad1;
    xRenderTransform currentTransform;
    CARD32 pad2;
    CARD16 pendingNbytesFilter;    /* number of bytes in filter name */
    CARD16 pendingNparamsFilter;   /* number of filter params */
    CARD16 currentNbytesFilter;    /* number of bytes in filter name */
    CARD16 currentNparamsFilter;   /* number of filter params */
}

enum sz_xRRGetCrtcTransformReply =	96;

struct xRRSetOutputPrimaryReq {
    CARD8 reqType;
    CARD8 randrReqType;
    CARD16 length;
    Window window;
    RROutput output;
}
enum sz_xRRSetOutputPrimaryReq =	12;

struct xRRGetOutputPrimaryReq {
    CARD8 reqType;
    CARD8 randrReqType;
    CARD16 length;
    Window window;
}
enum sz_xRRGetOutputPrimaryReq =	8;

struct xRRGetOutputPrimaryReply {
    BYTE type;
    CARD8 pad;
    CARD16 sequenceNumber;
    CARD32 length;
    RROutput output;
    CARD32 pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
}
enum sz_xRRGetOutputPrimaryReply =	32;

/*
 * Additions for V1.4
 */

struct xRRGetProvidersReq {
    CARD8 reqType;
    CARD8 randrReqType;
    CARD16 length;
    Window window;
}
enum sz_xRRGetProvidersReq = 8;

struct xRRGetProvidersReply {
    BYTE type;
    CARD8 pad;
    CARD16 sequenceNumber;
    CARD32 length;
    Time timestamp;
    CARD16 nProviders;
    CARD16 pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
}
enum sz_xRRGetProvidersReply = 32;

struct xRRGetProviderInfoReq {
    CARD8 reqType;
    CARD8 randrReqType;
    CARD16 length;
    RRProvider provider;
    Time configTimestamp;
}
enum sz_xRRGetProviderInfoReq = 12;

struct xRRGetProviderInfoReply {
    BYTE type;
    CARD8 status;
    CARD16 sequenceNumber;
    CARD32 length;
    Time timestamp;
    CARD32 capabilities;
    CARD16 nCrtcs;
    CARD16 nOutputs;
    CARD16 nAssociatedProviders;
    CARD16 nameLength;
    CARD32 pad1;
    CARD32 pad2;
}
enum sz_xRRGetProviderInfoReply = 32;

struct xRRSetProviderOutputSourceReq {
    CARD8 reqType;
    CARD8 randrReqType;
    CARD16 length;
    RRProvider provider;
    RRProvider source_provider;
    Time configTimestamp;
}
enum sz_xRRSetProviderOutputSourceReq = 16;

struct xRRSetProviderOffloadSinkReq {
    CARD8 reqType;
    CARD8 randrReqType;
    CARD16 length;
    RRProvider provider;
    RRProvider sink_provider;
    Time configTimestamp;
}
enum sz_xRRSetProviderOffloadSinkReq = 16;

struct xRRListProviderPropertiesReq {
    CARD8 reqType;
    CARD8 randrReqType;
    CARD16 length;
    RRProvider provider;
}
enum sz_xRRListProviderPropertiesReq =	8;

struct xRRListProviderPropertiesReply {
    BYTE type;
    CARD8 pad0;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD16 nAtoms;
    CARD16 pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
}
enum sz_xRRListProviderPropertiesReply =	32;

struct xRRQueryProviderPropertyReq {
    CARD8 reqType;
    CARD8 randrReqType;
    CARD16 length;
    RRProvider provider;
    Atom property;
}
enum sz_xRRQueryProviderPropertyReq =	12;

struct xRRQueryProviderPropertyReply {
    BYTE type;
    BYTE pad0;
    CARD16 sequenceNumber;
    CARD32 length;
    BOOL pending;
    BOOL range;
    BOOL immutable_;
    BYTE pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
}
enum sz_xRRQueryProviderPropertyReply =	32;

struct xRRConfigureProviderPropertyReq {
    CARD8 reqType;
    CARD8 randrReqType;
    CARD16 length;
    RRProvider provider;
    Atom property;
    BOOL pending;
    BOOL range;
    CARD16 pad;
}
enum sz_xRRConfigureProviderPropertyReq =	16;

struct xRRChangeProviderPropertyReq {
    CARD8 reqType;
    CARD8 randrReqType;
    CARD16 length;
    RRProvider provider;
    Atom property;
    Atom type;
    CARD8 format;
    CARD8 mode;
    CARD16 pad;
    CARD32 nUnits;
}
enum sz_xRRChangeProviderPropertyReq =	24;

struct xRRDeleteProviderPropertyReq {
    CARD8 reqType;
    CARD8 randrReqType;
    CARD16 length;
    RRProvider provider;
    Atom property;
}
enum sz_xRRDeleteProviderPropertyReq =	12;

struct xRRGetProviderPropertyReq {
    CARD8 reqType;
    CARD8 randrReqType;
    CARD16 length;
    RRProvider provider;
    Atom property;
    Atom type;
    CARD32 longOffset;
    CARD32 longLength;
version (none) {
    BOOL _delete;
} else {
    BOOL delete_;
}
    BOOL pending;
    CARD16 pad1;
}
enum sz_xRRGetProviderPropertyReq =	28;

struct xRRGetProviderPropertyReply {
    BYTE type;
    CARD8 format;
    CARD16 sequenceNumber;
    CARD32 length;
    Atom propertyType;
    CARD32 bytesAfter;
    CARD32 nItems;
    CARD32 pad1;
    CARD32 pad2;
    CARD32 pad3;
}
enum sz_xRRGetProviderPropertyReply =	32;

/*
 * Additions for V1.6
 */

struct xRRCreateLeaseReq {
    CARD8 reqType;
    CARD8 randrReqType;
    CARD16 length;
    Window window;
    RRLease lid;
    CARD16 nCrtcs;
    CARD16 nOutputs;
}
enum sz_xRRCreateLeaseReq =	16;

struct xRRCreateLeaseReply {
    BYTE type;
    CARD8 nfd;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
    CARD32 pad7;
}
enum sz_xRRCreateLeaseReply =		32;

struct xRRFreeLeaseReq {
    CARD8 reqType;
    CARD8 randrReqType;
    CARD16 length;
    RRLease lid;
    BYTE terminate;
    CARD8 pad1;
    CARD16 pad2;
}
enum sz_xRRFreeLeaseReq =		12;

/*
 * event
 */
struct xRRScreenChangeNotifyEvent {
    CARD8 type;				/* always evBase + ScreenChangeNotify */
    CARD8 rotation;			/* new rotation */
    CARD16 sequenceNumber;
    Time timestamp;			/* time screen was changed */
    Time configTimestamp;		/* time config data was changed */
    Window root;			/* root window */
    Window window;			/* window requesting notification */
    SizeID sizeID;			/* new size ID */
    CARD16 subpixelOrder;		/* subpixel order */
    CARD16 widthInPixels;		/* new size */
    CARD16 heightInPixels;
    CARD16 widthInMillimeters;
    CARD16 heightInMillimeters;
}
enum sz_xRRScreenChangeNotifyEvent =	32;

struct xRRCrtcChangeNotifyEvent {
    CARD8 type;				/* always evBase + RRNotify */
    CARD8 subCode;			/* RRNotify_CrtcChange */
    CARD16 sequenceNumber;
    Time timestamp;			/* time crtc was changed */
    Window window;			/* window requesting notification */
    RRCrtc crtc;			/* affected CRTC */
    RRMode mode;			/* current mode */
    CARD16 rotation;			/* rotation and reflection */
    CARD16 pad1;			/* unused */
    INT16 x;				/* new location */
    INT16 y;
    CARD16 width;			/* new size */
    CARD16 height;
}
enum sz_xRRCrtcChangeNotifyEvent =	32;

struct xRROutputChangeNotifyEvent {
    CARD8 type;				/* always evBase + RRNotify */
    CARD8 subCode;			/* RRNotify_OutputChange */
    CARD16 sequenceNumber;
    Time timestamp;			/* time output was changed */
    Time configTimestamp;		/* time config was changed */
    Window window;			/* window requesting notification */
    RROutput output;			/* affected output */
    RRCrtc crtc;			/* current crtc */
    RRMode mode;			/* current mode */
    CARD16 rotation;			/* rotation and reflection */
    CARD8 connection;			/* connection status */
    CARD8 subpixelOrder;		/* subpixel order */
}
enum sz_xRROutputChangeNotifyEvent =	32;

struct xRROutputPropertyNotifyEvent {
    CARD8 type;				/* always evBase + RRNotify */
    CARD8 subCode;			/* RRNotify_OutputProperty */
    CARD16 sequenceNumber;
    Window window;			/* window requesting notification */
    RROutput output;			/* affected output */
    Atom atom;				/* property name */
    Time timestamp;			/* time crtc was changed */
    CARD8 state;			/* NewValue or Deleted */
    CARD8 pad1;
    CARD16 pad2;
    CARD32 pad3;
    CARD32 pad4;
}
enum sz_xRROutputPropertyNotifyEvent =	32;

struct xRRProviderChangeNotifyEvent {
    CARD8 type;				/* always evBase + RRNotify */
    CARD8 subCode;			/* RRNotify_ProviderChange */
    CARD16 sequenceNumber;
    Time timestamp;			/* time provider was changed */
    Window window;			/* window requesting notification */
    RRProvider provider;		/* affected provider */
    CARD32 pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
}
enum sz_xRRProviderChangeNotifyEvent =	32;

struct xRRProviderPropertyNotifyEvent {
    CARD8 type;				/* always evBase + RRNotify */
    CARD8 subCode;			/* RRNotify_ProviderProperty */
    CARD16 sequenceNumber;
    Window window;			/* window requesting notification */
    RRProvider provider;		/* affected provider */
    Atom atom;				/* property name */
    Time timestamp;			/* time provider was changed */
    CARD8 state;			/* NewValue or Deleted */
    CARD8 pad1;
    CARD16 pad2;
    CARD32 pad3;
    CARD32 pad4;
}
enum sz_xRRProviderPropertyNotifyEvent =	32;

struct xRRResourceChangeNotifyEvent {
    CARD8 type;				/* always evBase + RRNotify */
    CARD8 subCode;			/* RRNotify_ResourceChange */
    CARD16 sequenceNumber;
    Time timestamp;			/* time resource was changed */
    Window window;			/* window requesting notification */
    CARD32 pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
}
enum sz_xRRResourceChangeNotifyEvent =	32;

struct xRRLeaseNotifyEvent {
    CARD8 type;				/* always evBase + RRNotify */
    CARD8 subCode;			/* RRNotify_Lease */
    CARD16 sequenceNumber;
    Time timestamp;			/* time resource was changed */
    Window window;			/* window requesting notification */
    RRLease lease;
    CARD8 created;			/* created/deleted */
    CARD8 pad0;
    CARD16 pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
}
enum sz_xRRLeaseNotifyEvent =		32;

struct xRRGetPanningReq {
    CARD8 reqType;
    CARD8 randrReqType;
    CARD16 length;
    RRCrtc crtc;
}
enum sz_xRRGetPanningReq =		8;

struct xRRGetPanningReply {
    BYTE type;
    CARD8 status;
    CARD16 sequenceNumber;
    CARD32 length;
    Time timestamp;
    CARD16 left;
    CARD16 top;
    CARD16 width;
    CARD16 height;
    CARD16 track_left;
    CARD16 track_top;
    CARD16 track_width;
    CARD16 track_height;
    INT16 border_left;
    INT16 border_top;
    INT16 border_right;
    INT16 border_bottom;
}
enum sz_xRRGetPanningReply =		36;

struct xRRSetPanningReq {
    CARD8 reqType;
    CARD8 randrReqType;
    CARD16 length;
    RRCrtc crtc;
    Time timestamp;
    CARD16 left;
    CARD16 top;
    CARD16 width;
    CARD16 height;
    CARD16 track_left;
    CARD16 track_top;
    CARD16 track_width;
    CARD16 track_height;
    INT16 border_left;
    INT16 border_top;
    INT16 border_right;
    INT16 border_bottom;
}
enum sz_xRRSetPanningReq =		36;

struct xRRSetPanningReply {
    BYTE type;
    CARD8 status;
    CARD16 sequenceNumber;
    CARD32 length;
    Time newTimestamp;
    CARD32 pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
}
enum sz_xRRSetPanningReply =	32;

struct xRRMonitorInfo {
    Atom name;
    BOOL primary;
    BOOL automatic;
    CARD16 noutput;
    INT16 x;
    INT16 y;
    CARD16 width;
    CARD16 height;
    CARD32 widthInMillimeters;
    CARD32 heightInMillimeters;
}
enum sz_xRRMonitorInfo =	24;

struct xRRGetMonitorsReq {
    CARD8 reqType;
    CARD8 randrReqType;
    CARD16 length;
    Window window;
    BOOL get_active;
    CARD8 pad;
    CARD16 pad2;
}
enum sz_xRRGetMonitorsReq =	12;

struct xRRGetMonitorsReply {
    BYTE type;
    CARD8 status;
    CARD16 sequenceNumber;
    CARD32 length;
    Time timestamp;
    CARD32 nmonitors;
    CARD32 noutputs;
    CARD32 pad1;
    CARD32 pad2;
    CARD32 pad3;
}
enum sz_xRRGetMonitorsReply =	32;

struct xRRSetMonitorReq {
    CARD8 reqType;
    CARD8 randrReqType;
    CARD16 length;
    Window window;
    xRRMonitorInfo monitor;
}
enum sz_xRRSetMonitorReq =	32;

struct xRRDeleteMonitorReq {
    CARD8 reqType;
    CARD8 randrReqType;
    CARD16 length;
    Window window;
    Atom name;
}
enum sz_xRRDeleteMonitorReq =	12;

 /* _XRANDRP_H_ */
