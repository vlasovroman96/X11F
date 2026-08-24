module externs.X11.extensions.XIproto;
@nogc nothrow:
extern(C): __gshared:

private template HasVersion(string versionId) {
	mixin("version("~versionId~") {enum HasVersion = true;} else {enum HasVersion = false;}");
}
/************************************************************

Copyright 1989, 1998  The Open Group

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

Copyright 1989 by Hewlett-Packard Company, Palo Alto, California.

			All Rights Reserved

Permission to use, copy, modify, and distribute this software and its
documentation for any purpose and without fee is hereby granted,
provided that the above copyright notice appear in all copies and that
both that copyright notice and this permission notice appear in
supporting documentation, and that the name of Hewlett-Packard not be
used in advertising or publicity pertaining to distribution of the
software without specific, written prior permission.

HEWLETT-PACKARD DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING
ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT SHALL
HEWLETT-PACKARD BE LIABLE FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR
ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS,
WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION,
ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
SOFTWARE.

********************************************************/

 
public import externs.X11.Xproto;
public import externs.X11.X;
public import externs.X11.Xmd;


/* make sure types have right sizes for protocol structures. */
alias Window = CARD32;
alias Time = CARD32;
alias KeyCode = CARD8;
alias Mask = CARD32;
alias Atom = CARD32;
alias Cursor = CARD32;

/*********************************************************
 *
 * number of events, errors, and extension name.
 *
 */

enum MORE_EVENTS =	0x80;
enum DEVICE_BITS =	0x7F;

enum InputClassBits =	0x3F	/* bits in mode field for input classes */;
enum ModeBitsShift =	6	/* amount to shift the remaining bits   */;

enum numInputClasses = 7;

enum IEVENTS =         17       /* does NOT include generic events */;
enum IERRORS =         5;
enum IREQUESTS =       39;

enum CLIENT_REQ =      1;

struct XExtEventInfo {
    Mask mask;
    BYTE type;
    BYTE word;
    }

version (_XITYPEDEF_POINTER) {} else {
alias Pointer = void*;
}

struct tmask
    {
    Mask mask;
    void* dev;
    }

/*********************************************************
 *
 * Event constants used by library.
 *
 */

enum XI_DeviceValuator =		0;
enum XI_DeviceKeyPress =		1;
enum XI_DeviceKeyRelease =		2;
enum XI_DeviceButtonPress =		3;
enum XI_DeviceButtonRelease =		4;
enum XI_DeviceMotionNotify =		5;
enum XI_DeviceFocusIn =		6;
enum XI_DeviceFocusOut =		7;
enum XI_ProximityIn =			8;
enum XI_ProximityOut =			9;
enum XI_DeviceStateNotify =		10;
enum XI_DeviceMappingNotify =		11;
enum XI_ChangeDeviceNotify =		12;
enum XI_DeviceKeystateNotify =		13;
enum XI_DeviceButtonstateNotify =	14;
enum XI_DevicePresenceNotify =		15;
enum XI_DevicePropertyNotify =         16;

/*********************************************************
 *
 * Protocol request constants
 *
 */

enum X_GetExtensionVersion =		1;
enum X_ListInputDevices =		2;
enum X_OpenDevice =			3;
enum X_CloseDevice =			4;
enum X_SetDeviceMode =			5;
enum X_SelectExtensionEvent =		6;
enum X_GetSelectedExtensionEvents =	7;
enum X_ChangeDeviceDontPropagateList = 8;
enum X_GetDeviceDontPropagateList =	9;
enum X_GetDeviceMotionEvents =		10;
enum X_ChangeKeyboardDevice =		11;
enum X_ChangePointerDevice =		12;
enum X_GrabDevice =			13;
enum X_UngrabDevice =			14;
enum X_GrabDeviceKey =			15;
enum X_UngrabDeviceKey =		16;
enum X_GrabDeviceButton =		17;
enum X_UngrabDeviceButton =		18;
enum X_AllowDeviceEvents =		19;
enum X_GetDeviceFocus =		20;
enum X_SetDeviceFocus =		21;
enum X_GetFeedbackControl =		22;
enum X_ChangeFeedbackControl =		23;
enum X_GetDeviceKeyMapping =		24;
enum X_ChangeDeviceKeyMapping =	25;
enum X_GetDeviceModifierMapping =	26;
enum X_SetDeviceModifierMapping =	27;
enum X_GetDeviceButtonMapping =	28;
enum X_SetDeviceButtonMapping =	29;
enum X_QueryDeviceState =		30;
enum X_SendExtensionEvent =		31;
enum X_DeviceBell =			32;
enum X_SetDeviceValuators =		33;
enum X_GetDeviceControl =		34;
enum X_ChangeDeviceControl =		35;
/* XI 1.5 */
enum X_ListDeviceProperties =          36;
enum X_ChangeDeviceProperty =          37;
enum X_DeleteDeviceProperty =          38;
enum X_GetDeviceProperty =             39;

/*********************************************************
 *
 * Protocol request and reply structures.
 *
 * GetExtensionVersion.
 *
 */

struct xGetExtensionVersionReq {
    CARD8 reqType;       /* input extension major code   */
    CARD8 ReqType;       /* always X_GetExtensionVersion */
    CARD16 length;
    CARD16 nbytes;
    CARD8 pad1, pad2;
}

struct xGetExtensionVersionReply {
    CARD8 repType;	/* X_Reply			*/
    CARD8 RepType;	/* always X_GetExtensionVersion */
    CARD16 sequenceNumber;
    CARD32 length;
    CARD16 major_version;
    CARD16 minor_version;
    BOOL present;
    CARD8 pad1, pad2, pad3;
    CARD32 pad01;
    CARD32 pad02;
    CARD32 pad03;
    CARD32 pad04;
}

/*********************************************************
 *
 * ListInputDevices.
 *
 */

struct xListInputDevicesReq {
    CARD8 reqType;	/* input extension major code	*/
    CARD8 ReqType;	/* always X_ListInputDevices	*/
    CARD16 length;
}

struct xListInputDevicesReply {
    CARD8 repType;	/* X_Reply			*/
    CARD8 RepType;        /* always X_ListInputDevices	*/
    CARD16 sequenceNumber;
    CARD32 length;
    CARD8 ndevices;
    CARD8 pad1, pad2, pad3;
    CARD32 pad01;
    CARD32 pad02;
    CARD32 pad03;
    CARD32 pad04;
    CARD32 pad05;
}

alias xDeviceInfoPtr = _xDeviceInfo*;
alias xDeviceInfo = _xDeviceInfo;


alias xAnyClassPtr = _xAnyClassInfo*;

struct _xAnyClassInfo {
static if (HasVersion!"none" || HasVersion!"c_plusplus") {
    CARD8 c_class;
} else {
    CARD8 class_;
}
    CARD8 length;
    }

struct _xDeviceInfo {
    CARD32 type;
    CARD8 id;
    CARD8 num_classes;
    CARD8 use;      /* IsXPointer | IsXKeyboard | IsXExtension... */
    CARD8 attached; /* id of master dev (if IsXExtension..) */
    }

alias xKeyInfo = _xKeyInfo;
alias xKeyInfoPtr = _xKeyInfo*;


struct _xKeyInfo {
static if (HasVersion!"none" || HasVersion!"c_plusplus") {
    CARD8 c_class;
} else {
    CARD8 class_;
}
    CARD8 length;
    KeyCode min_keycode;
    KeyCode max_keycode;
    CARD16 num_keys;
    CARD8 pad1, pad2;
    }

alias xButtonInfoPtr = _xButtonInfo*;
alias xButtonInfo = _xButtonInfo;


struct _xButtonInfo {
static if (HasVersion!"none" || HasVersion!"c_plusplus") {
    CARD8 c_class;
} else {
    CARD8 class_;
}
    CARD8 length;
    CARD16 num_buttons;
    }

alias xValuatorInfoPtr = _xValuatorInfo*;
alias xValuatorInfo = _xValuatorInfo;


struct _xValuatorInfo {
static if (HasVersion!"none" || HasVersion!"c_plusplus") {
    CARD8 c_class;
} else {
    CARD8 class_;
}
    CARD8 length;
    CARD8 num_axes;
    CARD8 mode;
    CARD32 motion_buffer_size;
    }

alias xAxisInfoPtr = _xAxisInfo*;
alias xAxisInfo = _xAxisInfo;


struct _xAxisInfo {
    CARD32 resolution;
    CARD32 min_value;
    CARD32 max_value;
    }

/*********************************************************
 *
 * OpenDevice.
 *
 */

struct xOpenDeviceReq {
    CARD8 reqType;	/* input extension major code	*/
    CARD8 ReqType;        /* always X_OpenDevice		*/
    CARD16 length;
    CARD8 deviceid;
    BYTE pad1, pad2, pad3;
}

struct xOpenDeviceReply {
    CARD8 repType;	/* X_Reply			*/
    CARD8 RepType;	/* always X_OpenDevice		*/
    CARD16 sequenceNumber;
    CARD32 length;
    CARD8 num_classes;
    BYTE pad1, pad2, pad3;
    CARD32 pad00;
    CARD32 pad01;
    CARD32 pad02;
    CARD32 pad03;
    CARD32 pad04;
    }

struct xInputClassInfo {
static if (HasVersion!"none" || HasVersion!"c_plusplus") {
    CARD8 c_class;
} else {
    CARD8 class_;
}
    CARD8 event_type_base;
    }

/*********************************************************
 *
 * CloseDevice.
 *
 */

struct xCloseDeviceReq {
    CARD8 reqType;	/* input extension major code	*/
    CARD8 ReqType;        /* always X_CloseDevice	*/
    CARD16 length;
    CARD8 deviceid;
    BYTE pad1, pad2, pad3;
}

/*********************************************************
 *
 * SetDeviceMode.
 *
 */

struct xSetDeviceModeReq {
    CARD8 reqType;	/* input extension major code	*/
    CARD8 ReqType;	/* always X_SetDeviceMode	*/
    CARD16 length;
    CARD8 deviceid;
    CARD8 mode;
    BYTE pad1, pad2;
}

struct xSetDeviceModeReply {
    CARD8 repType;	/* X_Reply			*/
    CARD8 RepType;	/* always X_SetDeviceMode	*/
    CARD16 sequenceNumber;
    CARD32 length;
    CARD8 status;
    BYTE pad1, pad2, pad3;
    CARD32 pad01;
    CARD32 pad02;
    CARD32 pad03;
    CARD32 pad04;
    CARD32 pad05;
}

/*********************************************************
 *
 * SelectExtensionEvent.
 *
 */

struct xSelectExtensionEventReq {
    CARD8 reqType;	/* input extension major code	*/
    CARD8 ReqType;        /* always X_SelectExtensionEvent */
    CARD16 length;
    Window window;
    CARD16 count;
    CARD16 pad00;
}

/*********************************************************
 *
 * GetSelectedExtensionEvent.
 *
 */

struct xGetSelectedExtensionEventsReq {
    CARD8 reqType;	/* input extension major code	*/
    CARD8 ReqType;        /* X_GetSelectedExtensionEvents */
    CARD16 length;
    Window window;
}

struct xGetSelectedExtensionEventsReply {
    CARD8 repType;	/* X_Reply			*/
    CARD8 RepType;	/* GetSelectedExtensionEvents	*/
    CARD16 sequenceNumber;
    CARD32 length;
    CARD16 this_client_count;
    CARD16 all_clients_count;
    CARD32 pad01;
    CARD32 pad02;
    CARD32 pad03;
    CARD32 pad04;
    CARD32 pad05;
}

/*********************************************************
 *
 * ChangeDeviceDontPropagateList.
 *
 */

struct xChangeDeviceDontPropagateListReq {
    CARD8 reqType;	/* input extension major code	*/
    CARD8 ReqType;        /* X_ChangeDeviceDontPropagateList */
    CARD16 length;
    Window window;
    CARD16 count;
    CARD8 mode;
    BYTE pad;
}

/*********************************************************
 *
 * GetDeviceDontPropagateList.
 *
 */

struct xGetDeviceDontPropagateListReq {
    CARD8 reqType;	/* input extension major code	*/
    CARD8 ReqType;        /* X_GetDeviceDontPropagateList */
    CARD16 length;
    Window window;
}

struct xGetDeviceDontPropagateListReply {
    CARD8 repType;	/* X_Reply			*/
    CARD8 RepType;        /* GetDeviceDontPropagateList   */
    CARD16 sequenceNumber;
    CARD32 length;
    CARD16 count;
    CARD16 pad00;
    CARD32 pad01;
    CARD32 pad02;
    CARD32 pad03;
    CARD32 pad04;
    CARD32 pad05;
    }

/*********************************************************
 *
 * GetDeviceMotionEvents.
 *
 */

struct xGetDeviceMotionEventsReq {
    CARD8 reqType;	/* input extension major code	*/
    CARD8 ReqType;        /* always X_GetDeviceMotionEvents*/
    CARD16 length;
    Time start;
    Time stop;
    CARD8 deviceid;
    BYTE pad1, pad2, pad3;
}

struct xGetDeviceMotionEventsReply {
    CARD8 repType;	/* X_Reply */
    CARD8 RepType;        /* always X_GetDeviceMotionEvents  */
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 nEvents;
    CARD8 axes;
    CARD8 mode;
    BYTE pad1, pad2;
    CARD32 pad01;
    CARD32 pad02;
    CARD32 pad03;
    CARD32 pad04;
}

/*********************************************************
 *
 * ChangeKeyboardDevice.
 *
 */

struct xChangeKeyboardDeviceReq {
    CARD8 reqType;	/* input extension major code	*/
    CARD8 ReqType;        /* X_ChangeKeyboardDevice	*/
    CARD16 length;
    CARD8 deviceid;
    BYTE pad1, pad2, pad3;
}

struct xChangeKeyboardDeviceReply {
    CARD8 repType;	/* X_Reply			*/
    CARD8 RepType;        /* always X_ChangeKeyboardDevice*/
    CARD16 sequenceNumber;
    CARD32 length;		/* 0 */
    CARD8 status;
    BYTE pad1, pad2, pad3;
    CARD32 pad01;
    CARD32 pad02;
    CARD32 pad03;
    CARD32 pad04;
    CARD32 pad05;
    }

/*********************************************************
 *
 * ChangePointerDevice.
 *
 */

struct xChangePointerDeviceReq {
    CARD8 reqType;	/* input extension major code	*/
    CARD8 ReqType;        /* X_ChangePointerDevice	*/
    CARD16 length;
    CARD8 xaxis;
    CARD8 yaxis;
    CARD8 deviceid;
    BYTE pad1;
}

struct xChangePointerDeviceReply {
    CARD8 repType;	/* X_Reply			*/
    CARD8 RepType;        /* always X_ChangePointerDevice */
    CARD16 sequenceNumber;
    CARD32 length;		/* 0 */
    CARD8 status;
    BYTE pad1, pad2, pad3;
    CARD32 pad01;
    CARD32 pad02;
    CARD32 pad03;
    CARD32 pad04;
    CARD32 pad05;
    }

/*********************************************************
 *
 * GrabDevice.
 *
 */

struct xGrabDeviceReq {
    CARD8 reqType;	/* input extension major code	*/
    CARD8 ReqType;        /* always X_GrabDevice */
    CARD16 length;
    Window grabWindow;
    Time time;
    CARD16 event_count;
    CARD8 this_device_mode;
    CARD8 other_devices_mode;
    BOOL ownerEvents;
    CARD8 deviceid;
    CARD16 pad01;
}

struct xGrabDeviceReply {
    CARD8 repType;	/* X_Reply			*/
    CARD8 RepType;        /* always X_GrabDevice	*/
    CARD16 sequenceNumber;
    CARD32 length;		/* 0 */
    CARD8 status;
    BYTE pad1, pad2, pad3;
    CARD32 pad01;
    CARD32 pad02;
    CARD32 pad03;
    CARD32 pad04;
    CARD32 pad05;
    }

/*********************************************************
 *
 * UngrabDevice.
 *
 */

struct xUngrabDeviceReq {
    CARD8 reqType;	/* input extension major code	*/
    CARD8 ReqType;        /* always X_UnGrabDevice	*/
    CARD16 length;
    Time time;
    CARD8 deviceid;
    BYTE pad1, pad2, pad3;
}

/*********************************************************
 *
 * GrabDeviceKey.
 *
 */

struct xGrabDeviceKeyReq {
    CARD8 reqType;	/* input extension major code	*/
    CARD8 ReqType;        /* always X_GrabDeviceKey	*/
    CARD16 length;
    Window grabWindow;
    CARD16 event_count;
    CARD16 modifiers;
    CARD8 modifier_device;
    CARD8 grabbed_device;
    CARD8 key;
    BYTE this_device_mode;
    BYTE other_devices_mode;
    BOOL ownerEvents;
    BYTE pad1, pad2;
}

/*********************************************************
 *
 * UngrabDeviceKey.
 *
 */

struct xUngrabDeviceKeyReq {
    CARD8 reqType;	/* input extension major code	*/
    CARD8 ReqType;        /* always X_UngrabDeviceKey	*/
    CARD16 length;
    Window grabWindow;
    CARD16 modifiers;
    CARD8 modifier_device;
    CARD8 key;
    CARD8 grabbed_device;
    BYTE pad1, pad2, pad3;
}

/*********************************************************
 *
 * GrabDeviceButton.
 *
 */

struct xGrabDeviceButtonReq {
    CARD8 reqType;	/* input extension major code	*/
    CARD8 ReqType;        /* always X_GrabDeviceButton	*/
    CARD16 length;
    Window grabWindow;
    CARD8 grabbed_device;
    CARD8 modifier_device;
    CARD16 event_count;
    CARD16 modifiers;
    BYTE this_device_mode;
    BYTE other_devices_mode;
    CARD8 button;
    BOOL ownerEvents;
    BYTE pad1, pad2;
}

/*********************************************************
 *
 * UngrabDeviceButton.
 *
 */

struct xUngrabDeviceButtonReq {
    CARD8 reqType;	/* input extension major code	*/
    CARD8 ReqType;        /* always X_UngrabDeviceButton	*/
    CARD16 length;
    Window grabWindow;
    CARD16 modifiers;
    CARD8 modifier_device;
    CARD8 button;
    CARD8 grabbed_device;
    BYTE pad1, pad2, pad3;
}

/*********************************************************
 *
 * AllowDeviceEvents.
 *
 */

struct xAllowDeviceEventsReq {
    CARD8 reqType;	/* input extension major code	*/
    CARD8 ReqType;        /* always X_AllowDeviceEvents	*/
    CARD16 length;
    Time time;
    CARD8 mode;
    CARD8 deviceid;
    BYTE pad1, pad2;
}

/*********************************************************
 *
 * GetDeviceFocus.
 *
 */

struct xGetDeviceFocusReq {
    CARD8 reqType;        /* input extension major code   */
    CARD8 ReqType;        /* always X_GetDeviceFocus	*/
    CARD16 length;
    CARD8 deviceid;
    BYTE pad1, pad2, pad3;
}

struct xGetDeviceFocusReply {
    CARD8 repType;	/* X_Reply			*/
    CARD8 RepType;        /* always X_GetDeviceFocus	*/
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 focus;
    Time time;
    CARD8 revertTo;
    BYTE pad1, pad2, pad3;
    CARD32 pad01;
    CARD32 pad02;
    CARD32 pad03;
    }

/*********************************************************
 *
 * SetDeviceFocus.
 *
 */

struct xSetDeviceFocusReq {
    CARD8 reqType;        /* input extension major code   */
    CARD8 ReqType;        /* always X_SetDeviceFocus	*/
    CARD16 length;
    Window focus;
    Time time;
    CARD8 revertTo;
    CARD8 device;
    CARD16 pad01;
}

/*********************************************************
 *
 * GetFeedbackControl.
 *
 */

struct xGetFeedbackControlReq {
    CARD8 reqType;	/* input extension major code	*/
    CARD8 ReqType;        /* X_GetFeedbackControl	*/
    CARD16 length;
    CARD8 deviceid;
    BYTE pad1, pad2, pad3;
}

struct xGetFeedbackControlReply {
    CARD8 repType;	/* X_Reply			*/
    CARD8 RepType;        /* always X_GetFeedbackControl	*/
    CARD16 sequenceNumber;
    CARD32 length;
    CARD16 num_feedbacks;
    CARD16 pad01;
    CARD32 pad02;
    CARD32 pad03;
    CARD32 pad04;
    CARD32 pad05;
    CARD32 pad06;
}

struct xFeedbackState {
static if (HasVersion!"none" || HasVersion!"c_plusplus") {
    CARD8 c_class;	/* feedback class		*/
} else {
    CARD8 class_;		/* feedback class		*/
}
    CARD8 id;		/* feedback id		*/
    CARD16 length;		/* feedback length		*/
}

struct xKbdFeedbackState {
static if (HasVersion!"none" || HasVersion!"c_plusplus") {
    CARD8 c_class;
} else {
    CARD8 class_; 
}
    CARD8 id;
    CARD16 length;
    CARD16 pitch;
    CARD16 duration;
    CARD32 led_mask;
    CARD32 led_values;
    BOOL global_auto_repeat;
    CARD8 click;
    CARD8 percent;
    BYTE pad;
    BYTE[32] auto_repeats;
}

struct xPtrFeedbackState {
static if (HasVersion!"none" || HasVersion!"c_plusplus") {
    CARD8 c_class;
} else {
    CARD8 class_;
}
    CARD8 id;
    CARD16 length;
    CARD8 pad1, pad2;
    CARD16 accelNum;
    CARD16 accelDenom;
    CARD16 threshold;
}

struct xIntegerFeedbackState {
static if (HasVersion!"none" || HasVersion!"c_plusplus") {
    CARD8 c_class;	/* feedback class id		*/
} else {
    CARD8 class_;		/* feedback class id		*/
}
    CARD8 id;
    CARD16 length;		/* feedback length		*/
    CARD32 resolution;
    INT32 min_value;
    INT32 max_value;
}

struct xStringFeedbackState {
static if (HasVersion!"none" || HasVersion!"c_plusplus") {
    CARD8 c_class;	/* feedback class id		*/
} else {
    CARD8 class_;		/* feedback class id		*/
}
    CARD8 id;
    CARD16 length;		/* feedback length		*/
    CARD16 max_symbols;
    CARD16 num_syms_supported;
}

struct xBellFeedbackState {
static if (HasVersion!"none" || HasVersion!"c_plusplus") {
    CARD8 c_class;	/* feedback class id		*/
} else {
    CARD8 class_;		/* feedback class id		*/
}
    CARD8 id;
    CARD16 length;		/* feedback length		*/
    CARD8 percent;
    BYTE pad1, pad2, pad3;
    CARD16 pitch;
    CARD16 duration;
}

struct xLedFeedbackState {
static if (HasVersion!"none" || HasVersion!"c_plusplus") {
    CARD8 c_class;	/* feedback class id		*/
} else {
    CARD8 class_;		/* feedback class id		*/
}
    CARD8 id;
    CARD16 length;		/* feedback length		*/
    CARD32 led_mask;
    CARD32 led_values;
}

/*********************************************************
 *
 * ChangeFeedbackControl.
 *
 */

struct xChangeFeedbackControlReq {
    CARD8 reqType;	/* input extension major code	*/
    CARD8 ReqType;        /* X_ChangeFeedbackControl	*/
    CARD16 length;
    CARD32 mask;
    CARD8 deviceid;
    CARD8 feedbackid;
    BYTE pad1, pad2;
}

struct xFeedbackCtl {
static if (HasVersion!"none" || HasVersion!"c_plusplus") {
    CARD8 c_class;	/* feedback class id		*/
} else {
    CARD8 class_;		/* feedback class id		*/
}
    CARD8 id;		/* feedback id		*/
    CARD16 length;		/* feedback length		*/
}

struct xKbdFeedbackCtl {
static if (HasVersion!"none" || HasVersion!"c_plusplus") {
    CARD8 c_class;	/* feedback class id		*/
} else {
    CARD8 class_;		/* feedback class id		*/
}
    CARD8 id;		/* feedback length		*/
    CARD16 length;		/* feedback length		*/
    KeyCode key;
    CARD8 auto_repeat_mode;
    INT8 click;
    INT8 percent;
    INT16 pitch;
    INT16 duration;
    CARD32 led_mask;
    CARD32 led_values;
}

struct xPtrFeedbackCtl {
static if (HasVersion!"none" || HasVersion!"c_plusplus") {
    CARD8 c_class;	/* feedback class id		*/
} else {
    CARD8 class_;		/* feedback class id		*/
}
    CARD8 id;		/* feedback id		*/
    CARD16 length;		/* feedback length		*/
    CARD8 pad1, pad2;
    INT16 num;
    INT16 denom;
    INT16 thresh;
}

struct xIntegerFeedbackCtl {
static if (HasVersion!"none" || HasVersion!"c_plusplus") {
    CARD8 c_class;	/* feedback class id		*/
} else {
    CARD8 class_;		/* feedback class id		*/
}
    CARD8 id;		/* feedback id		*/
    CARD16 length;		/* feedback length		*/
    INT32 int_to_display;
}

struct xStringFeedbackCtl {
static if (HasVersion!"none" || HasVersion!"c_plusplus") {
    CARD8 c_class;	/* feedback class id		*/
} else {
    CARD8 class_;		/* feedback class id		*/
}
    CARD8 id;		/* feedback id		*/
    CARD16 length;		/* feedback length		*/
    CARD8 pad1, pad2;
    CARD16 num_keysyms;
}

struct xBellFeedbackCtl {
static if (HasVersion!"none" || HasVersion!"c_plusplus") {
    CARD8 c_class;	/* feedback class id		*/
} else {
    CARD8 class_;		/* feedback class id		*/
}
    CARD8 id;		/* feedback id		*/
    CARD16 length;		/* feedback length		*/
    INT8 percent;
    BYTE pad1, pad2, pad3;
    INT16 pitch;
    INT16 duration;
}

struct xLedFeedbackCtl {
static if (HasVersion!"none" || HasVersion!"c_plusplus") {
    CARD8 c_class;	/* feedback class id		*/
} else {
    CARD8 class_;		/* feedback class id		*/
}
    CARD8 id;		/* feedback id		*/
    CARD16 length;		/* feedback length		*/
    CARD32 led_mask;
    CARD32 led_values;
}

/*********************************************************
 *
 * GetDeviceKeyMapping.
 *
 */

struct xGetDeviceKeyMappingReq {
    CARD8 reqType;        /* input extension major code   */
    CARD8 ReqType;	/* always X_GetDeviceKeyMapping */
    CARD16 length;
    CARD8 deviceid;
    KeyCode firstKeyCode;
    CARD8 count;
    BYTE pad1;
}

struct xGetDeviceKeyMappingReply {
    CARD8 repType;	/* X_Reply			*/
    CARD8 RepType;	/* always X_GetDeviceKeyMapping */
    CARD16 sequenceNumber;
    CARD32 length;
    CARD8 keySymsPerKeyCode;
    CARD8 pad0;
    CARD16 pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
}

/*********************************************************
 *
 * ChangeDeviceKeyMapping.
 *
 */

struct xChangeDeviceKeyMappingReq {
    CARD8 reqType;        /* input extension major code   */
    CARD8 ReqType;        /* always X_ChangeDeviceKeyMapping */
    CARD16 length;
    CARD8 deviceid;
    KeyCode firstKeyCode;
    CARD8 keySymsPerKeyCode;
    CARD8 keyCodes;
}

/*********************************************************
 *
 * GetDeviceModifierMapping.
 *
 */

struct xGetDeviceModifierMappingReq {
    CARD8 reqType;        /* input extension major code   */
    CARD8 ReqType;        /* always X_GetDeviceModifierMapping */
    CARD16 length;
    CARD8 deviceid;
    BYTE pad1, pad2, pad3;
}

struct xGetDeviceModifierMappingReply {
    CARD8 repType;	/* X_Reply */
    CARD8 RepType;        /* always X_GetDeviceModifierMapping */
    CARD16 sequenceNumber;
    CARD32 length;
    CARD8 numKeyPerModifier;
    CARD8 pad0;
    CARD16 pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
}

/*********************************************************
 *
 * SetDeviceModifierMapping.
 *
 */

struct xSetDeviceModifierMappingReq {
    CARD8 reqType;        /* input extension major code   */
    CARD8 ReqType;        /* always X_SetDeviceModifierMapping */
    CARD16 length;
    CARD8 deviceid;
    CARD8 numKeyPerModifier;
    CARD16 pad1;
}

struct xSetDeviceModifierMappingReply {
    CARD8 repType;	/* X_Reply */
    CARD8 RepType;        /* always X_SetDeviceModifierMapping */
    CARD16 sequenceNumber;
    CARD32 length;
    CARD8 success;
    CARD8 pad0;
    CARD16 pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
}

/*********************************************************
 *
 * GetDeviceButtonMapping.
 *
 */

struct xGetDeviceButtonMappingReq {
    CARD8 reqType;	/* input extension major code	*/
    CARD8 ReqType;        /* X_GetDeviceButtonMapping     */
    CARD16 length;
    CARD8 deviceid;
    BYTE pad1, pad2, pad3;
}

struct xGetDeviceButtonMappingReply {
    CARD8 repType;	/* X_Reply */
    CARD8 RepType;        /* always X_GetDeviceButtonMapping */
    CARD16 sequenceNumber;
    CARD32 length;
    CARD8 nElts;
    BYTE pad1, pad2, pad3;
    CARD32 pad01;
    CARD32 pad02;
    CARD32 pad03;
    CARD32 pad04;
    CARD32 pad05;
}

/*********************************************************
 *
 * SetDeviceButtonMapping.
 *
 */

struct xSetDeviceButtonMappingReq {
    CARD8 reqType;	/* input extension major code	*/
    CARD8 ReqType;        /* X_SetDeviceButtonMapping     */
    CARD16 length;
    CARD8 deviceid;
    CARD8 map_length;
    BYTE pad1, pad2;
}

struct xSetDeviceButtonMappingReply {
    CARD8 repType;		/* X_Reply */
    CARD8 RepType;	/* always X_SetDeviceButtonMapping */
    CARD16 sequenceNumber;
    CARD32 length;
    CARD8 status;
    BYTE pad0;
    CARD16 pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
}

/*********************************************************
 *
 * QueryDeviceState.
 *
 */

struct xQueryDeviceStateReq {
    CARD8 reqType;
    CARD8 ReqType;        /* always X_QueryDeviceState */
    CARD16 length;
    CARD8 deviceid;
    BYTE pad1, pad2, pad3;
}

struct xQueryDeviceStateReply {
    CARD8 repType;		/* X_Reply */
    CARD8 RepType;	/* always X_QueryDeviceState	*/
    CARD16 sequenceNumber;
    CARD32 length;
    CARD8 num_classes;
    BYTE pad0;
    CARD16 pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
}

struct xKeyState {
static if (HasVersion!"none" || HasVersion!"c_plusplus") {
    CARD8 c_class;
} else {
    CARD8 class_;
}
    CARD8 length;
    CARD8 num_keys;
    BYTE pad1;
    CARD8[32] keys;
}

struct xButtonState {
static if (HasVersion!"none" || HasVersion!"c_plusplus") {
    CARD8 c_class;
} else {
    CARD8 class_;
}
    CARD8 length;
    CARD8 num_buttons;
    BYTE pad1;
    CARD8[32] buttons;
}

struct xValuatorState {
static if (HasVersion!"none" || HasVersion!"c_plusplus") {
    CARD8 c_class;
} else {
    CARD8 class_;
}
    CARD8 length;
    CARD8 num_valuators;
    CARD8 mode;
}

/*********************************************************
 *
 * SendExtensionEvent.
 * THIS REQUEST MUST BE KEPT A MULTIPLE OF 8 BYTES IN LENGTH!
 * MORE EVENTS MAY FOLLOW AND THEY MUST BE QUAD-ALIGNED!
 *
 */

struct xSendExtensionEventReq {
    CARD8 reqType;
    CARD8 ReqType;        /* always X_SendExtensionEvent */
    CARD16 length;
    Window destination;
    CARD8 deviceid;
    BOOL propagate;
    CARD16 count;
    CARD8 num_events;
    BYTE pad1, pad2, pad3;
}

/*********************************************************
 *
 * DeviceBell.
 *
 */

struct xDeviceBellReq {
    CARD8 reqType;
    CARD8 ReqType;        /* always X_DeviceBell */
    CARD16 length;
    CARD8 deviceid;
    CARD8 feedbackid;
    CARD8 feedbackclass;
    INT8 percent;
}

/*********************************************************
 *
 * SetDeviceValuators.
 *
 */

struct xSetDeviceValuatorsReq {
    CARD8 reqType;	/* input extension major code	*/
    CARD8 ReqType;	/* always X_SetDeviceValuators	*/
    CARD16 length;
    CARD8 deviceid;
    CARD8 first_valuator;
    CARD8 num_valuators;
    BYTE pad1;
}

struct xSetDeviceValuatorsReply {
    CARD8 repType;	/* X_Reply			*/
    CARD8 RepType;	/* always X_SetDeviceValuators	*/
    CARD16 sequenceNumber;
    CARD32 length;
    CARD8 status;
    BYTE pad1, pad2, pad3;
    CARD32 pad01;
    CARD32 pad02;
    CARD32 pad03;
    CARD32 pad04;
    CARD32 pad05;
}

/*********************************************************
 *
 * GetDeviceControl.
 *
 */

struct xGetDeviceControlReq {
    CARD8 reqType;	/* input extension major code	*/
    CARD8 ReqType;	/* always X_GetDeviceControl	*/
    CARD16 length;
    CARD16 control;
    CARD8 deviceid;
    BYTE pad2;
}

struct xGetDeviceControlReply {
    CARD8 repType;	/* X_Reply			*/
    CARD8 RepType;	/* always X_GetDeviceControl	*/
    CARD16 sequenceNumber;
    CARD32 length;
    CARD8 status;
    BYTE pad1, pad2, pad3;
    CARD32 pad01;
    CARD32 pad02;
    CARD32 pad03;
    CARD32 pad04;
    CARD32 pad05;
}

struct xDeviceState {
    CARD16 control;	/* control type			*/
    CARD16 length;		/* control length		*/
}

struct xDeviceResolutionState {
    CARD16 control;	/* control type			*/
    CARD16 length;		/* control length		*/
    CARD32 num_valuators;	/* number of valuators		*/
}

struct xDeviceAbsCalibState {
     CARD16 control;
     CARD16 length;
     INT32 min_x;
     INT32 max_x;
     INT32 min_y;
     INT32 max_y;
     CARD32 flip_x;
     CARD32 flip_y;
     CARD32 rotation;
     CARD32 button_threshold;
}

struct xDeviceAbsAreaState {
     CARD16 control;
     CARD16 length;
     CARD32 offset_x;
     CARD32 offset_y;
     CARD32 width;
     CARD32 height;
     CARD32 screen;
     CARD32 following;
}

struct xDeviceCoreState {
    CARD16 control;	/* control type                 */
    CARD16 length; 	/* control length               */
    CARD8 status;
    CARD8 iscore;
    CARD16 pad1;
}

struct xDeviceEnableState {
    CARD16 control;	/* control type                 */
    CARD16 length; 	/* control length               */
    CARD8 enable;
    CARD8 pad0;
    CARD16 pad1;
}

/*********************************************************
 *
 * ChangeDeviceControl.
 *
 */

struct xChangeDeviceControlReq {
    CARD8 reqType;	/* input extension major code	*/
    CARD8 ReqType;	/* always X_ChangeDeviceControl */
    CARD16 length;
    CARD16 control;
    CARD8 deviceid;
    BYTE pad0;
}

struct xChangeDeviceControlReply {
    CARD8 repType;	/* X_Reply			*/
    CARD8 RepType;	/* always X_ChangeDeviceControl	*/
    CARD16 sequenceNumber;
    CARD32 length;
    CARD8 status;
    BYTE pad1, pad2, pad3;
    CARD32 pad01;
    CARD32 pad02;
    CARD32 pad03;
    CARD32 pad04;
    CARD32 pad05;
}

struct xDeviceCtl {
    CARD16 control;		/* control type			*/
    CARD16 length;			/* control length		*/
}

struct xDeviceResolutionCtl {
    CARD16 control;		/* control type			*/
    CARD16 length;			/* control length		*/
    CARD8 first_valuator;		/* first valuator to change     */
    CARD8 num_valuators;		/* number of valuators to change*/
    CARD8 pad1, pad2;
}

struct xDeviceAbsCalibCtl {
     CARD16 control;
     CARD16 length;
     INT32 min_x;
     INT32 max_x;
     INT32 min_y;
     INT32 max_y;
     CARD32 flip_x;
     CARD32 flip_y;
     CARD32 rotation;
     CARD32 button_threshold;
}

struct xDeviceAbsAreaCtl {
     CARD16 control;
     CARD16 length;
     CARD32 offset_x;
     CARD32 offset_y;
     INT32 width;
     INT32 height;
     INT32 screen;
     CARD32 following;
}

struct xDeviceCoreCtl {
    CARD16 control;
    CARD16 length;
    CARD8 status;
    CARD8 pad0;
    CARD16 pad1;
}

struct xDeviceEnableCtl {
    CARD16 control;
    CARD16 length;
    CARD8 enable;
    CARD8 pad0;
    CARD16 pad1;
}

/* XI 1.5 */

/*********************************************************
 *
 * ListDeviceProperties.
 *
 */

struct xListDevicePropertiesReq {
    CARD8 reqType;        /* input extension major opcode */
    CARD8 ReqType;        /* always X_ListDeviceProperties */
    CARD16 length;
    CARD8 deviceid;
    CARD8 pad0;
    CARD16 pad1;
}

struct xListDevicePropertiesReply {
    CARD8 repType;        /* X_Reply                       */
    CARD8 RepType;        /* always X_ListDeviceProperties */
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

/*********************************************************
 *
 * ChangeDeviceProperty.
 *
 */

struct xChangeDevicePropertyReq {
    CARD8 reqType;        /* input extension major opcode */
    CARD8 ReqType;        /* always X_ChangeDeviceProperty */
    CARD16 length;
    Atom property;
    Atom type;
    CARD8 deviceid;
    CARD8 format;
    CARD8 mode;
    CARD8 pad;
    CARD32 nUnits;
}

/*********************************************************
 *
 * DeleteDeviceProperty.
 *
 */

struct xDeleteDevicePropertyReq {
    CARD8 reqType;        /* input extension major opcode */
    CARD8 ReqType;        /* always X_DeleteDeviceProperty */
    CARD16 length;
    Atom property;
    CARD8 deviceid;
    CARD8 pad0;
    CARD16 pad1;
}

/*********************************************************
 *
 * GetDeviceProperty.
 *
 */

struct xGetDevicePropertyReq {
    CARD8 reqType;        /* input extension major opcode */
    CARD8 ReqType;        /* always X_GetDeviceProperty */
    CARD16 length;
    Atom property;
    Atom type;
    CARD32 longOffset;
    CARD32 longLength;
    CARD8 deviceid;
static if (HasVersion!"none" || HasVersion!"c_plusplus") {
    BOOL c_delete;
} else {
    BOOL delete_;
}
    CARD16 pad;
}

struct xGetDevicePropertyReply {
    CARD8 repType;        /* X_Reply                        */
    CARD8 RepType;        /* always X_GetDeviceProperty   */
    CARD16 sequenceNumber;
    CARD32 length;
    Atom propertyType;
    CARD32 bytesAfter;
    CARD32 nItems;
    CARD8 format;
    CARD8 deviceid;
    CARD16 pad1;
    CARD32 pad2;
    CARD32 pad3;
}


/**********************************************************
 *
 * Input extension events.
 *
 * DeviceValuator
 *
 */

struct deviceValuator {
    BYTE type;
    CARD8 deviceid;
    CARD16 sequenceNumber;
    KeyButMask device_state;
    CARD8 num_valuators;
    CARD8 first_valuator;
    INT32 valuator0;
    INT32 valuator1;
    INT32 valuator2;
    INT32 valuator3;
    INT32 valuator4;
    INT32 valuator5;
    }

/**********************************************************
 *
 * DeviceKeyButtonPointer.
 *
 * Used for: DeviceKeyPress, DeviceKeyRelease,
 *	     DeviceButtonPress, DeviceButtonRelease,
 *	     ProximityIn, ProximityOut
 *	     DeviceMotionNotify,
 *
 */

struct deviceKeyButtonPointer {
    BYTE type;
    BYTE detail;
    CARD16 sequenceNumber;
    Time time;
    Window root;
    Window event;
    Window child;
    INT16 root_x;
    INT16 root_y;
    INT16 event_x;
    INT16 event_y;
    KeyButMask state;
    BOOL same_screen;
    CARD8 deviceid;
    }

/**********************************************************
 *
 * DeviceFocus.
 *
 */

struct deviceFocus {
    BYTE type;
    BYTE detail;
    CARD16 sequenceNumber;
    Time time;
    Window window;
    BYTE mode;
    CARD8 deviceid;
    BYTE pad1, pad2;
    CARD32 pad00;
    CARD32 pad01;
    CARD32 pad02;
    CARD32 pad03;
    }

/**********************************************************
 *
 * DeviceStateNotify.
 *
 * Note that the two high-order bits in the classes_reported
 * field are the proximity state (InProximity or OutOfProximity),
 * and the device mode (Absolute or Relative), respectively.
 *
 */

struct deviceStateNotify {
    BYTE type;
    BYTE deviceid;
    CARD16 sequenceNumber;
    Time time;
    CARD8 num_keys;
    CARD8 num_buttons;
    CARD8 num_valuators;
    CARD8 classes_reported;
    CARD8[4] buttons;
    CARD8[4] keys;
    INT32 valuator0;
    INT32 valuator1;
    INT32 valuator2;
    }

/**********************************************************
 *
 * DeviceKeyStateNotify.
 *
 */

struct deviceKeyStateNotify {
    BYTE type;
    BYTE deviceid;
    CARD16 sequenceNumber;
    CARD8[28] keys;
    }

/**********************************************************
 *
 * DeviceButtonStateNotify.
 *
 */

struct deviceButtonStateNotify {
    BYTE type;
    BYTE deviceid;
    CARD16 sequenceNumber;
    CARD8[28] buttons;
    }

/**********************************************************
 *
 * DeviceMappingNotify.
 * Fields must be kept in sync with core mappingnotify event.
 *
 */

struct deviceMappingNotify {
    BYTE type;
    BYTE deviceid;
    CARD16 sequenceNumber;
    CARD8 request;
    KeyCode firstKeyCode;
    CARD8 count;
    BYTE pad1;
    Time time;
    CARD32 pad00;
    CARD32 pad01;
    CARD32 pad02;
    CARD32 pad03;
    CARD32 pad04;
    }

/**********************************************************
 *
 * ChangeDeviceNotify.
 *
 */

struct changeDeviceNotify {
    BYTE type;
    BYTE deviceid;
    CARD16 sequenceNumber;
    Time time;
    CARD8 request;
    BYTE pad1, pad2, pad3;
    CARD32 pad00;
    CARD32 pad01;
    CARD32 pad02;
    CARD32 pad03;
    CARD32 pad04;
    }

/**********************************************************
 *
 * devicePresenceNotify.
 *
 */

struct devicePresenceNotify {
    BYTE type;
    BYTE pad00;
    CARD16 sequenceNumber;
    Time time;
    BYTE devchange; /* Device{Added|Removed|Enabled|Disabled|ControlChanged} */
    BYTE deviceid;
    CARD16 control;
    CARD32 pad02;
    CARD32 pad03;
    CARD32 pad04;
    CARD32 pad05;
    CARD32 pad06;
    }


/*********************************************************
 * DevicePropertyNotifyEvent
 *
 * Sent whenever a device's property changes.
 *
 */

struct devicePropertyNotify {
    BYTE type;
    BYTE state;               /* NewValue or Deleted */
    CARD16 sequenceNumber;
    CARD32 time;
    Atom atom;                /* affected property */
    CARD32 pad0;
    CARD32 pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD16 pad5;
    CARD8 pad4;
    CARD8 deviceid;            /* id of device */
    }


