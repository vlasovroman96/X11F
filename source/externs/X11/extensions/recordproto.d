module externs.X11.extensions.recordproto;
@nogc nothrow:
extern(C): __gshared:
/***************************************************************************
 * Copyright 1995 Network Computing Devices
 *
 * Permission to use, copy, modify, distribute, and sell this software and
 * its documentation for any purpose is hereby granted without fee, provided
 * that the above copyright notice appear in all copies and that both that
 * copyright notice and this permission notice appear in supporting
 * documentation, and that the name of Network Computing Devices
 * not be used in advertising or publicity pertaining to distribution
 * of the software without specific, written prior permission.
 *
 * NETWORK COMPUTING DEVICES DISCLAIMs ALL WARRANTIES WITH REGARD TO
 * THIS SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS, IN NO EVENT SHALL NETWORK COMPUTING DEVICES BE LIABLE
 * FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN
 * AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING
 * OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 **************************************************************************/

 
public import externs.X11.Xmd;
public import externs.X11.extensions.recordconst;

/* only difference between 1.12 and 1.13 is byte order of device events,
   which the library doesn't deal with. */

/*********************************************************
 *
 * Protocol request constants
 *
 */
enum X_RecordQueryVersion =    0     /* First request from client */;
enum X_RecordCreateContext =   1     /* Create client RC */;
enum X_RecordRegisterClients = 2     /* Add to client RC */;
enum X_RecordUnregisterClients = 3   /* Delete from client RC */;
enum X_RecordGetContext =      4     /* Query client RC */;
enum X_RecordEnableContext =   5     /* Enable interception and reporting */;
enum X_RecordDisableContext =  6     /* Disable interception and reporting */;
enum X_RecordFreeContext =     7     /* Free client RC */;

enum sz_XRecordRange =		32;
enum sz_XRecordClientInfo = 	12;
enum sz_XRecordState = 	16;
enum sz_XRecordDatum = 	32;


version = XRecordGlobaldef;
// enum XRecordGlobalref = extern;

enum RecordMaxEvent =     	(128L-1L);
enum RecordMinDeviceEvent =	(2L);
enum RecordMaxDeviceEvent =	(6L);
enum RecordMaxError =          (256L-1L);
enum RecordMaxCoreRequest =    (128L-1L);
enum RecordMaxExtRequest =     (256L-1L);
enum RecordMinExtRequest =     (129L-1L);

alias RECORD_RC = 		CARD32;
alias RECORD_XIDBASE =		CARD32;
alias RECORD_CLIENTSPEC =	CARD32;
alias RECORD_ELEMENT_HEADER =	CARD8;

alias RecordClientSpec = RECORD_CLIENTSPEC;
alias RecordClientSpecPtr = RECORD_CLIENTSPEC*;

struct RECORD_RANGE8 {
    CARD8 first;
    CARD8 last;
}

struct RECORD_RANGE16 {
    CARD16 first;
    CARD16 last;
}

struct RECORD_EXTRANGE {
    RECORD_RANGE8 majorCode;
    RECORD_RANGE16 minorCode;
}

struct RECORDRANGE {
    RECORD_RANGE8 coreRequests;
    RECORD_RANGE8 coreReplies;
    RECORD_EXTRANGE extRequests;
    RECORD_EXTRANGE extReplies;
    RECORD_RANGE8 deliveredEvents;
    RECORD_RANGE8 deviceEvents;
    RECORD_RANGE8 errors;
    BOOL clientStarted;
    BOOL clientDied;
}
enum sz_RECORDRANGE = 	24;

/* typedef RECORDRANGE xRecordRange, *xRecordRangePtr;
#define sz_xRecordRange 24 */

/* Cannot have structures within structures going over the wire */
struct xRecordRange {
    CARD8 coreRequestsFirst;
    CARD8 coreRequestsLast;
    CARD8 coreRepliesFirst;
    CARD8 coreRepliesLast;
    CARD8 extRequestsMajorFirst;
    CARD8 extRequestsMajorLast;
    CARD16 extRequestsMinorFirst;
    CARD16 extRequestsMinorLast;
    CARD8 extRepliesMajorFirst;
    CARD8 extRepliesMajorLast;
    CARD16 extRepliesMinorFirst;
    CARD16 extRepliesMinorLast;
    CARD8 deliveredEventsFirst;
    CARD8 deliveredEventsLast;
    CARD8 deviceEventsFirst;
    CARD8 deviceEventsLast;
    CARD8 errorsFirst;
    CARD8 errorsLast;
    BOOL clientStarted;
    BOOL clientDied;
}
enum sz_xRecordRange = 24;

struct RECORD_CLIENT_INFO {
    RECORD_CLIENTSPEC clientResource;
    CARD32 nRanges;
/* LISTofRECORDRANGE */
}

alias xRecordClientInfo = RECORD_CLIENT_INFO;

/*
 * Initialize
 */
struct xRecordQueryVersionReq {
    CARD8 reqType;
    CARD8 recordReqType;
    CARD16 length;
    CARD16 majorVersion;
    CARD16 minorVersion;
}
enum sz_xRecordQueryVersionReq = 	8;

struct xRecordQueryVersionReply {
    CARD8 type;
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
enum sz_xRecordQueryVersionReply =  	32;

/*
 * Create RC
 */
struct xRecordCreateContextReq {
    CARD8 reqType;
    CARD8 recordReqType;
    CARD16 length;
    RECORD_RC context;
    RECORD_ELEMENT_HEADER elementHeader;
    CARD8 pad;
    CARD16 pad0;
    CARD32 nClients;
    CARD32 nRanges;
/* LISTofRECORD_CLIENTSPEC */
/* LISTofRECORDRANGE */
}
enum sz_xRecordCreateContextReq = 	20;

/*
 * Add to  RC
 */
struct xRecordRegisterClientsReq {
    CARD8 reqType;
    CARD8 recordReqType;
    CARD16 length;
    RECORD_RC context;
    RECORD_ELEMENT_HEADER elementHeader;
    CARD8 pad;
    CARD16 pad0;
    CARD32 nClients;
    CARD32 nRanges;
/* LISTofRECORD_CLIENTSPEC */
/* LISTofRECORDRANGE */
}
enum sz_xRecordRegisterClientsReq = 	20;

/*
 * Delete from RC
 */
struct xRecordUnregisterClientsReq {
    CARD8 reqType;
    CARD8 recordReqType;
    CARD16 length;
    RECORD_RC context;
    CARD32 nClients;
/* LISTofRECORD_CLIENTSPEC */
}
enum sz_xRecordUnregisterClientsReq = 	12;

/*
 * Query RC
 */
struct xRecordGetContextReq {
    CARD8 reqType;
    CARD8 recordReqType;
    CARD16 length;
    RECORD_RC context;
}
enum sz_xRecordGetContextReq = 		8;

struct xRecordGetContextReply {
    CARD8 type;
    BOOL enabled;
    CARD16 sequenceNumber;
    CARD32 length;
    RECORD_ELEMENT_HEADER elementHeader;
    CARD8 pad;
    CARD16 pad0;
    CARD32 nClients;
    CARD32 pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
/* LISTofCLIENT_INFO */ 		/* intercepted-clients */
}
enum sz_xRecordGetContextReply =  	32;

/*
 * Enable data interception
 */
struct xRecordEnableContextReq {
    CARD8 reqType;
    CARD8 recordReqType;
    CARD16 length;
    RECORD_RC context;
}
enum sz_xRecordEnableContextReq = 	8;

struct xRecordEnableContextReply {
    CARD8 type;
    CARD8 category;
    CARD16 sequenceNumber;
    CARD32 length;
    RECORD_ELEMENT_HEADER elementHeader;
    BOOL clientSwapped;
    CARD16 pad1;
    RECORD_XIDBASE idBase;
    CARD32 serverTime;
    CARD32 recordedSequenceNumber;
    CARD32 pad3;
    CARD32 pad4;
    /* BYTE		data; */
}
enum sz_xRecordEnableContextReply = 	32;

/*
 * Disable data interception
 */
struct xRecordDisableContextReq {
    CARD8 reqType;
    CARD8 recordReqType;
    CARD16 length;
    RECORD_RC context;
}
enum sz_xRecordDisableContextReq =	8;

/*
 * Free RC
 */
struct xRecordFreeContextReq {
    CARD8 reqType;
    CARD8 recordReqType;
    CARD16 length;
    RECORD_RC context;
}
enum sz_xRecordFreeContextReq = 	8;


