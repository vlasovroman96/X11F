module externs.X11.extensions.syncproto;
@nogc nothrow:
extern(C): __gshared:
/*

Copyright 1991, 1993, 1994, 1998  The Open Group

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

/***********************************************************
Copyright 1991,1993 by Digital Equipment Corporation, Maynard, Massachusetts,
and Olivetti Research Limited, Cambridge, England.

                        All Rights Reserved

Permission to use, copy, modify, and distribute this software and its
documentation for any purpose and without fee is hereby granted,
provided that the above copyright notice appear in all copies and that
both that copyright notice and this permission notice appear in
supporting documentation, and that the names of Digital or Olivetti
not be used in advertising or publicity pertaining to distribution of the
software without specific, written prior permission.

DIGITAL AND OLIVETTI DISCLAIM ALL WARRANTIES WITH REGARD TO THIS
SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND
FITNESS, IN NO EVENT SHALL THEY BE LIABLE FOR ANY SPECIAL, INDIRECT OR
CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF
USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
PERFORMANCE OF THIS SOFTWARE.

******************************************************************/

 
public import externs.X11.extensions.syncconst;
public import externs.X11.Xmd;

enum X_SyncInitialize =		0;
enum X_SyncListSystemCounters =	1;
enum X_SyncCreateCounter =		2;
enum X_SyncSetCounter =		3;
enum X_SyncChangeCounter =		4;
enum X_SyncQueryCounter =              5;
enum X_SyncDestroyCounter =		6;
enum X_SyncAwait =			7;
enum X_SyncCreateAlarm =               8;
enum X_SyncChangeAlarm =	        9;
enum X_SyncQueryAlarm =	       10;
enum X_SyncDestroyAlarm =	       11;
enum X_SyncSetPriority =   	       12;
enum X_SyncGetPriority =   	       13;
enum X_SyncCreateFence =	       14;
enum X_SyncTriggerFence =	       15;
enum X_SyncResetFence =	       16;
enum X_SyncDestroyFence =	       17;
enum X_SyncQueryFence =	       18;
enum X_SyncAwaitFence =	       19;

/* cover up types from sync.h to make sure they're the right size for
 * protocol packaging.  These will be undef'ed after all the protocol
 * structures are defined.
 */
alias XSyncCounter = CARD32;
alias XSyncAlarm =   CARD32;
alias XSyncFence =   CARD32;
alias Drawable =     CARD32;

/*
 * Initialize
 */
struct xSyncInitializeReq {
    CARD8 reqType;
    CARD8 syncReqType;
    CARD16 length;
    CARD8 majorVersion;
    CARD8 minorVersion;
    CARD16 pad;
}
enum sz_xSyncInitializeReq =		8;

struct xSyncInitializeReply {
    BYTE type;
    CARD8 unused;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD8 majorVersion;
    CARD8 minorVersion;
    CARD16 pad;
    CARD32 pad0;
    CARD32 pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
}
enum sz_xSyncInitializeReply =	32;

/*
 * ListSystemCounters
 */
struct xSyncListSystemCountersReq {
    CARD8 reqType;
    CARD8 syncReqType;
    CARD16 length;
}
enum sz_xSyncListSystemCountersReq =	4;

struct xSyncListSystemCountersReply {
    BYTE type;
    CARD8 unused;
    CARD16 sequenceNumber;
    CARD32 length;
    INT32 nCounters;
    CARD32 pad0;
    CARD32 pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
}
enum sz_xSyncListSystemCountersReply =	32;

struct xSyncSystemCounter {
    XSyncCounter counter;
    INT32 resolution_hi;
    CARD32 resolution_lo;
    CARD16 name_length;
}
enum sz_xSyncSystemCounter = 14;

/*
 * Create Counter
 */
struct xSyncCreateCounterReq {
    CARD8 reqType;
    CARD8 syncReqType;
    CARD16 length;
    XSyncCounter cid;
    INT32 initial_value_hi;
    CARD32 initial_value_lo;
}
enum sz_xSyncCreateCounterReq =	16;

/*
 * Change Counter
 */
struct xSyncChangeCounterReq {
    CARD8 reqType;
    CARD8 syncReqType;
    CARD16 length;
    XSyncCounter cid;
    INT32 value_hi;
    CARD32 value_lo;
}
enum sz_xSyncChangeCounterReq =	16;

/*
 * Set Counter
 */
struct xSyncSetCounterReq {
    CARD8 reqType;
    CARD8 syncReqType;
    CARD16 length;
    XSyncCounter cid;
    INT32 value_hi;
    CARD32 value_lo;
}
enum sz_xSyncSetCounterReq =	16;

/*
 * Destroy Counter
 */
struct xSyncDestroyCounterReq {
    CARD8 reqType;
    CARD8 syncReqType;
    CARD16 length;
    XSyncCounter counter;
}
enum sz_xSyncDestroyCounterReq =	8;

/*
 * Query Counter
 */
struct xSyncQueryCounterReq {
    CARD8 reqType;
    CARD8 syncReqType;
    CARD16 length;
    XSyncCounter counter;
}
enum sz_xSyncQueryCounterReq =		8;


struct xSyncQueryCounterReply {
    BYTE type;
    CARD8 unused;
    CARD16 sequenceNumber;
    CARD32 length;
    INT32 value_hi;
    CARD32 value_lo;
    CARD32 pad0;
    CARD32 pad1;
    CARD32 pad2;
    CARD32 pad3;
}
enum sz_xSyncQueryCounterReply =	32;

/*
 * Await
 */
struct xSyncAwaitReq {
    CARD8 reqType;
    CARD8 syncReqType;
    CARD16 length;
}
enum sz_xSyncAwaitReq =		4;

struct xSyncWaitCondition {
    XSyncCounter counter;
    CARD32 value_type;
    INT32 wait_value_hi;
    CARD32 wait_value_lo;
    CARD32 test_type;
    INT32 event_threshold_hi;
    CARD32 event_threshold_lo;
}
enum sz_xSyncWaitCondition =		28;

/*
 * Create Alarm
 */
struct xSyncCreateAlarmReq {
    CARD8 reqType;
    CARD8 syncReqType;
    CARD16 length;
    XSyncAlarm id;
    CARD32 valueMask;
}
enum sz_xSyncCreateAlarmReq =		12;

/*
 * Destroy Alarm
 */
struct xSyncDestroyAlarmReq {
    CARD8 reqType;
    CARD8 syncReqType;
    CARD16 length;
    XSyncAlarm alarm;
}
enum sz_xSyncDestroyAlarmReq =		8;

/*
 * Query Alarm
 */
struct xSyncQueryAlarmReq {
    CARD8 reqType;
    CARD8 syncReqType;
    CARD16 length;
    XSyncAlarm alarm;
}
enum sz_xSyncQueryAlarmReq =		8;

struct xSyncQueryAlarmReply {
    BYTE type;
    CARD8 unused;
    CARD16 sequenceNumber;
    CARD32 length;
    XSyncCounter counter;
    CARD32 value_type;
    INT32 wait_value_hi;
    CARD32 wait_value_lo;
    CARD32 test_type;
    INT32 delta_hi;
    CARD32 delta_lo;
    BOOL events;
    BYTE state;
    BYTE pad0;
    BYTE pad1;
}
enum sz_xSyncQueryAlarmReply =		40;

/*
 * Change Alarm
 */
struct xSyncChangeAlarmReq {
    CARD8 reqType;
    CARD8 syncReqType;
    CARD16 length;
    XSyncAlarm alarm;
    CARD32 valueMask;
}
enum sz_xSyncChangeAlarmReq =		12;

/*
 * SetPriority
 */
struct xSyncSetPriorityReq {
    CARD8 reqType;
    CARD8 syncReqType;
    CARD16 length;
    CARD32 id;
    INT32 priority;
}
enum sz_xSyncSetPriorityReq =	    	12;

/*
 * Get Priority
 */
struct xSyncGetPriorityReq {
    CARD8 reqType;
    CARD8 syncReqType;
    CARD16 length;
    CARD32 id; /*XXX XID? */
}
enum sz_xSyncGetPriorityReq =	    	 8;

struct xSyncGetPriorityReply {
    BYTE type;
    CARD8 unused;
    CARD16 sequenceNumber;
    CARD32 length;
    INT32 priority;
    CARD32 pad0;
    CARD32 pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
}
enum sz_xSyncGetPriorityReply =	32;

/*
 * Create Fence
 */
struct xSyncCreateFenceReq {
    CARD8 reqType;
    CARD8 syncReqType;
    CARD16 length;
    Drawable d;
    XSyncFence fid;
    BOOL initially_triggered;
    CARD8 pad0;
    CARD16 pad1;
}
enum sz_xSyncCreateFenceReq =		16;

/*
 * Put a fence object in the "triggered" state.
 */
struct xSyncTriggerFenceReq {
    CARD8 reqType;
    CARD8 syncReqType;
    CARD16 length;
    XSyncFence fid;
}
enum sz_xSyncTriggerFenceReq =		8;

/*
 * Put a fence in the "untriggered" state.
 */
struct xSyncResetFenceReq {
    CARD8 reqType;
    CARD8 syncReqType;
    CARD16 length;
    XSyncFence fid;
}
enum sz_xSyncResetFenceReq =		8;

/*
 * Destroy a fence object
 */
struct xSyncDestroyFenceReq {
    CARD8 reqType;
    CARD8 syncReqType;
    CARD16 length;
    XSyncFence fid;
}
enum sz_xSyncDestroyFenceReq =		8;

/*
 * Query a fence object
 */
struct xSyncQueryFenceReq {
    CARD8 reqType;
    CARD8 syncReqType;
    CARD16 length;
    XSyncFence fid;
}
enum sz_xSyncQueryFenceReq =		8;

/*
 * Wait for any of a list of fence sync objects
 * to reach the "triggered" state.
 */
struct xSyncAwaitFenceReq {
    CARD8 reqType;
    CARD8 syncReqType;
    CARD16 length;
}
enum sz_xSyncAwaitFenceReq =		4;

struct xSyncQueryFenceReply {
    BYTE type;
    CARD8 unused;
    CARD16 sequenceNumber;
    CARD32 length;
    BOOL triggered;
    BYTE pad0;
    CARD16 pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
}
enum sz_xSyncQueryFenceReply =		32;

/*
 * Events
 */

struct xSyncCounterNotifyEvent {
    BYTE type;
    BYTE kind;
    CARD16 sequenceNumber;
    XSyncCounter counter;
    INT32 wait_value_hi;
    CARD32 wait_value_lo;
    INT32 counter_value_hi;
    CARD32 counter_value_lo;
    CARD32 time;
    CARD16 count;
    BOOL destroyed;
    BYTE pad0;
}

struct xSyncAlarmNotifyEvent {
    BYTE type;
    BYTE kind;
    CARD16 sequenceNumber;
    XSyncAlarm alarm;
    INT32 counter_value_hi;
    CARD32 counter_value_lo;
    INT32 alarm_value_hi;
    CARD32 alarm_value_lo;
    CARD32 time;
    CARD8 state;
    BYTE pad0;
    BYTE pad1;
    BYTE pad2;
}

 /* _SYNCPROTO_H_ */
