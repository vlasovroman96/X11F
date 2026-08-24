module externs.X11.extensions.XI;
@nogc nothrow:
extern(C): __gshared:
import core.stdc.config: c_long, c_ulong;
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

/* Definitions used by the server, library and client */

 
enum sz_xGetExtensionVersionReq =             8;
enum sz_xGetExtensionVersionReply =           32;
enum sz_xListInputDevicesReq =			4;
enum sz_xListInputDevicesReply =		32;
enum sz_xOpenDeviceReq =			8;
enum sz_xOpenDeviceReply =			32;
enum sz_xCloseDeviceReq =			8;
enum sz_xSetDeviceModeReq =			8;
enum sz_xSetDeviceModeReply =			32;
enum sz_xSelectExtensionEventReq =		12;
enum sz_xGetSelectedExtensionEventsReq =	8;
enum sz_xGetSelectedExtensionEventsReply =	32;
enum sz_xChangeDeviceDontPropagateListReq =	12;
enum sz_xGetDeviceDontPropagateListReq =	8;
enum sz_xGetDeviceDontPropagateListReply =	32;
enum sz_xGetDeviceMotionEventsReq =		16;
enum sz_xGetDeviceMotionEventsReply =		32;
enum sz_xChangeKeyboardDeviceReq =		8;
enum sz_xChangeKeyboardDeviceReply =		32;
enum sz_xChangePointerDeviceReq =		8;
enum sz_xChangePointerDeviceReply =		32;
enum sz_xGrabDeviceReq =			20;
enum sz_xGrabDeviceReply =			32;
enum sz_xUngrabDeviceReq =			12;
enum sz_xGrabDeviceKeyReq =			20;
enum sz_xGrabDeviceKeyReply =			32;
enum sz_xUngrabDeviceKeyReq =			16;
enum sz_xGrabDeviceButtonReq =			20;
enum sz_xGrabDeviceButtonReply =		32;
enum sz_xUngrabDeviceButtonReq =		16;
enum sz_xAllowDeviceEventsReq =		12;
enum sz_xGetDeviceFocusReq =			8;
enum sz_xGetDeviceFocusReply =			32;
enum sz_xSetDeviceFocusReq =			16;
enum sz_xGetFeedbackControlReq =		8;
enum sz_xGetFeedbackControlReply =		32;
enum sz_xChangeFeedbackControlReq =		12;
enum sz_xGetDeviceKeyMappingReq =		8;
enum sz_xGetDeviceKeyMappingReply =		32;
enum sz_xChangeDeviceKeyMappingReq =		8;
enum sz_xGetDeviceModifierMappingReq =		8;
enum sz_xSetDeviceModifierMappingReq =		8;
enum sz_xSetDeviceModifierMappingReply =	32;
enum sz_xGetDeviceButtonMappingReq =		8;
enum sz_xGetDeviceButtonMappingReply =		32;
enum sz_xSetDeviceButtonMappingReq =		8;
enum sz_xSetDeviceButtonMappingReply =		32;
enum sz_xQueryDeviceStateReq =			8;
enum sz_xQueryDeviceStateReply =		32;
enum sz_xSendExtensionEventReq =		16;
enum sz_xDeviceBellReq =			8;
enum sz_xSetDeviceValuatorsReq =		8;
enum sz_xSetDeviceValuatorsReply =		32;
enum sz_xGetDeviceControlReq =			8;
enum sz_xGetDeviceControlReply =		32;
enum sz_xChangeDeviceControlReq =		8;
enum sz_xChangeDeviceControlReply =		32;
enum sz_xListDevicePropertiesReq =             8;
enum sz_xListDevicePropertiesReply =           32;
enum sz_xChangeDevicePropertyReq =             20;
enum sz_xDeleteDevicePropertyReq =             12;
enum sz_xGetDevicePropertyReq =                24;
enum sz_xGetDevicePropertyReply =              32;

enum INAME =		"XInputExtension";

enum XI_KEYBOARD =	"KEYBOARD";
enum XI_MOUSE =	"MOUSE";
enum XI_TABLET =	"TABLET";
enum XI_TOUCHSCREEN =	"TOUCHSCREEN";
enum XI_TOUCHPAD =	"TOUCHPAD";
enum XI_BARCODE =	"BARCODE";
enum XI_BUTTONBOX =	"BUTTONBOX";
enum XI_KNOB_BOX =	"KNOB_BOX";
enum XI_ONE_KNOB =	"ONE_KNOB";
enum XI_NINE_KNOB =	"NINE_KNOB";
enum XI_TRACKBALL =	"TRACKBALL";
enum XI_QUADRATURE =	"QUADRATURE";
enum XI_ID_MODULE =	"ID_MODULE";
enum XI_SPACEBALL =	"SPACEBALL";
enum XI_DATAGLOVE =	"DATAGLOVE";
enum XI_EYETRACKER =	"EYETRACKER";
enum XI_CURSORKEYS =	"CURSORKEYS";
enum XI_FOOTMOUSE =	"FOOTMOUSE";
enum XI_JOYSTICK =	"JOYSTICK";

/* Indices into the versions[] array (XExtInt.c). Used as a index to
 * retrieve the minimum version of XI from _XiCheckExtInit */
enum Dont_Check =			0;
enum XInput_Initial_Release =		1;
enum XInput_Add_XDeviceBell =		2;
enum XInput_Add_XSetDeviceValuators =	3;
enum XInput_Add_XChangeDeviceControl =	4;
enum XInput_Add_DevicePresenceNotify =	5;
enum XInput_Add_DeviceProperties =	6;
/* DO NOT ADD TO HERE -> XI2 */

enum XI_Absent =		0;
enum XI_Present =		1;

enum XI_Initial_Release_Major =		1;
enum XI_Initial_Release_Minor =		0;

enum XI_Add_XDeviceBell_Major =		1;
enum XI_Add_XDeviceBell_Minor =		1;

enum XI_Add_XSetDeviceValuators_Major =	1;
enum XI_Add_XSetDeviceValuators_Minor =	2;

enum XI_Add_XChangeDeviceControl_Major =	1;
enum XI_Add_XChangeDeviceControl_Minor =	3;

enum XI_Add_DevicePresenceNotify_Major =	1;
enum XI_Add_DevicePresenceNotify_Minor =	4;

enum XI_Add_DeviceProperties_Major =		1;
enum XI_Add_DeviceProperties_Minor =		5;

enum DEVICE_RESOLUTION =	1;
enum DEVICE_ABS_CALIB =        2;
enum DEVICE_CORE =             3;
enum DEVICE_ENABLE =           4;
enum DEVICE_ABS_AREA =         5;

enum NoSuchExtension =		1;

enum COUNT =			0;
enum CREATE =			1;

enum NewPointer =		0;
enum NewKeyboard =		1;

enum XPOINTER =		0;
enum XKEYBOARD =		1;

enum UseXKeyboard =		0xFF;

enum IsXPointer =		0;
enum IsXKeyboard =		1;
enum IsXExtensionDevice =	2;
enum IsXExtensionKeyboard =    3;
enum IsXExtensionPointer =     4;

enum AsyncThisDevice =		0;
enum SyncThisDevice =		1;
enum ReplayThisDevice =	2;
enum AsyncOtherDevices =	3;
enum AsyncAll =		4;
enum SyncAll =			5;

enum FollowKeyboard = 		3;
enum RevertToFollowKeyboard = 	3;


enum DvAccelNum =              (1L << 0);
enum DvAccelDenom =            (1L << 1);
enum DvThreshold =             (1L << 2);

enum DvKeyClickPercent =	(1L<<0);
enum DvPercent =		(1L<<1);
enum DvPitch =			(1L<<2);
enum DvDuration =		(1L<<3);
enum DvLed =			(1L<<4);
enum DvLedMode =		(1L<<5);
enum DvKey =			(1L<<6);
enum DvAutoRepeatMode =	(1L<<7);

enum DvString =                (1L << 0);

enum DvInteger =               (1L << 0);

enum DeviceMode =              (1L << 0);
enum Relative =                0;
enum Absolute =                1;

enum ProximityState =          (1L << 1);
enum InProximity =             (0L << 1);
enum OutOfProximity =          (1L << 1);

enum AddToList =               0;
enum DeleteFromList =          1;

enum KeyClass =  		0;
enum ButtonClass =  		1;
enum ValuatorClass =  		2;
enum FeedbackClass =  		3;
enum ProximityClass =  	4;
enum FocusClass =  		5;
enum OtherClass =  		6;
enum AttachClass =             7;

enum KbdFeedbackClass =  	0;
enum PtrFeedbackClass =  	1;
enum StringFeedbackClass =  	2;
enum IntegerFeedbackClass =  	3;
enum LedFeedbackClass =  	4;
enum BellFeedbackClass =  	5;

enum _devicePointerMotionHint = 0;
enum _deviceButton1Motion =	 1;
enum _deviceButton2Motion =	 2;
enum _deviceButton3Motion =	 3;
enum _deviceButton4Motion =	 4;
enum _deviceButton5Motion =	 5;
enum _deviceButtonMotion =	 6;
enum _deviceButtonGrab =	 7;
enum _deviceOwnerGrabButton =	 8;
enum _noExtensionEvent =	 9;

enum _devicePresence =		 0;

enum _deviceEnter =             0;
enum _deviceLeave =             1;

/* Device presence notify states */
enum DeviceAdded =              0;
enum DeviceRemoved =            1;
enum DeviceEnabled =            2;
enum DeviceDisabled =           3;
enum DeviceUnrecoverable =      4;
enum DeviceControlChanged =     5;

/* XI Errors */
enum XI_BadDevice =	0;
enum XI_BadEvent =	1;
enum XI_BadMode =	2;
enum XI_DeviceBusy =	3;
enum XI_BadClass =	4;

/*
 * Make XEventClass be a CARD32 for 64 bit servers.  Don't affect client
 * definition of XEventClass since that would be a library interface change.
 * See the top of X.h for more _XSERVER64 magic.
 *
 * But, don't actually use the CARD32 type.  We can't get it defined here
 * without polluting the namespace.
 */
version (_XSERVER64) {
alias XEventClass = uint;
} else {
alias XEventClass = c_ulong;
}

/*******************************************************************
 *
 * Extension version structure.
 *
 */

struct XExtensionVersion {
        int present;
        short major_version;
        short minor_version;
}

 /* _XI_H_ */
