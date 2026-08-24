module externs.X11.extensions.XI2;
@nogc nothrow:
extern(C): __gshared:
/*
 * Copyright © 2009 Red Hat, Inc.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice (including the next
 * paragraph) shall be included in all copies or substantial portions of the
 * Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 */
import externs.X11.Xmd;
import externs.X11.Xlib;

 
enum XInput_2_0 =                              7;
/* DO NOT ADD TO THIS LIST. These are libXi-specific defines.
   See commit libXi-1.4.2-21-ge8531dd */

enum XI_2_Major =                              2;
enum XI_2_Minor =                              4;

/* Property event flags */
enum XIPropertyDeleted =                       0;
enum XIPropertyCreated =                       1;
enum XIPropertyModified =                      2;

/* Property modes */
enum XIPropModeReplace =                       0;
enum XIPropModePrepend =                       1;
enum XIPropModeAppend =                        2;

/* Special property type used for XIGetProperty */
enum XIAnyPropertyType =                       0L;

/* Enter/Leave and Focus In/Out modes */
enum XINotifyNormal =                          0;
enum XINotifyGrab =                            1;
enum XINotifyUngrab =                          2;
enum XINotifyWhileGrabbed =                    3;
enum XINotifyPassiveGrab =                     4;
enum XINotifyPassiveUngrab =                   5;

/* Enter/Leave and focus In/out detail */
enum XINotifyAncestor =                        0;
enum XINotifyVirtual =                         1;
enum XINotifyInferior =                        2;
enum XINotifyNonlinear =                       3;
enum XINotifyNonlinearVirtual =                4;
enum XINotifyPointer =                         5;
enum XINotifyPointerRoot =                     6;
enum XINotifyDetailNone =                      7;

/* Grab modes */
enum XIGrabModeSync =                          0;
enum XIGrabModeAsync =                         1;
enum XIGrabModeTouch =                         2;

/* Grab reply status codes */
enum XIGrabSuccess =                           0;
enum XIAlreadyGrabbed =                        1;
enum XIGrabInvalidTime =                       2;
enum XIGrabNotViewable =                       3;
enum XIGrabFrozen =                            4;

/* Grab owner events values */
enum XIOwnerEvents =                           True;
enum XINoOwnerEvents =                         False;

/* Passive grab types */
enum XIGrabtypeButton =                        0;
enum XIGrabtypeKeycode =                       1;
enum XIGrabtypeEnter =                         2;
enum XIGrabtypeFocusIn =                       3;
enum XIGrabtypeTouchBegin =                    4;
enum XIGrabtypeGesturePinchBegin =             5;
enum XIGrabtypeGestureSwipeBegin =             6;

/* Passive grab modifier */
enum XIAnyModifier =                           (1U << 31);
enum XIAnyButton =                             0;
enum XIAnyKeycode =                            0;

/* XIAllowEvents event-modes */
enum XIAsyncDevice =                           0;
enum XISyncDevice =                            1;
enum XIReplayDevice =                          2;
enum XIAsyncPairedDevice =                     3;
enum XIAsyncPair =                             4;
enum XISyncPair =                              5;
enum XIAcceptTouch =                           6;
enum XIRejectTouch =                           7;

/* DeviceChangedEvent change reasons */
enum XISlaveSwitch =                           1;
enum XIDeviceChange =                          2;

/* Hierarchy flags */
enum XIMasterAdded =                           (1 << 0);
enum XIMasterRemoved =                         (1 << 1);
enum XISlaveAdded =                            (1 << 2);
enum XISlaveRemoved =                          (1 << 3);
enum XISlaveAttached =                         (1 << 4);
enum XISlaveDetached =                         (1 << 5);
enum XIDeviceEnabled =                         (1 << 6);
enum XIDeviceDisabled =                        (1 << 7);

/* ChangeHierarchy constants */
enum XIAddMaster =                             1;
enum XIRemoveMaster =                          2;
enum XIAttachSlave =                           3;
enum XIDetachSlave =                           4;

enum XIAttachToMaster =                        1;
enum XIFloating =                              2;

/* Valuator modes */
enum XIModeRelative =                          0;
enum XIModeAbsolute =                          1;

/* Device types */
enum XIMasterPointer =                         1;
enum XIMasterKeyboard =                        2;
enum XISlavePointer =                          3;
enum XISlaveKeyboard =                         4;
enum XIFloatingSlave =                         5;

/* Device classes: classes that are not identical to Xi 1.x classes must be
 * numbered starting from 8. */
enum XIKeyClass =                              0;
enum XIButtonClass =                           1;
enum XIValuatorClass =                         2;
enum XIScrollClass =                           3;
enum XITouchClass =                            8;
enum XIGestureClass =                          9;

/* Scroll class types */
enum XIScrollTypeVertical =                    1;
enum XIScrollTypeHorizontal =                  2;

/* Scroll class flags */
enum XIScrollFlagNoEmulation =                 (1 << 0);
enum XIScrollFlagPreferred =                   (1 << 1);

/* Device event flags (common) */
/* Device event flags (key events only) */
enum XIKeyRepeat =                             (1 << 16);
/* Device event flags (pointer events only) */
enum XIPointerEmulated =                       (1 << 16);
/* Device event flags (touch events only) */
enum XITouchPendingEnd =                       (1 << 16);
enum XITouchEmulatingPointer =                 (1 << 17);

/* Barrier event flags */
enum XIBarrierPointerReleased =                (1 << 0);
enum XIBarrierDeviceIsGrabbed =                (1 << 1);

/* Gesture pinch event flags */
enum XIGesturePinchEventCancelled =            (1 << 0);

/* Gesture swipe event flags */
enum XIGestureSwipeEventCancelled =            (1 << 0);

/* Touch modes */
enum XIDirectTouch =                           1;
enum XIDependentTouch =                        2;

/* XI2 event mask macros */
enum string XISetMask(string ptr, string event) = `((cast(ubyte*)(` ~ ptr ~ `))[(` ~ event ~ `)>>3] |=  (1 << ((` ~ event ~ `) & 7)))`;
enum string XIClearMask(string ptr, string event) = `((cast(ubyte*)(` ~ ptr ~ `))[(` ~ event ~ `)>>3] &= ~(1 << ((` ~ event ~ `) & 7)))`;
enum string XIMaskIsSet(string ptr, string event) = `((cast(ubyte*)(` ~ ptr ~ `))[(` ~ event ~ `)>>3] &   (1 << ((` ~ event ~ `) & 7)))`;
enum string XIMaskLen(string event) = `(((` ~ event ~ `) >> 3) + 1)`;

/* Fake device ID's for event selection */
enum XIAllDevices =                            0;
enum XIAllMasterDevices =                      1;

/* Event types */
enum XI_DeviceChanged =                 1;
enum XI_KeyPress =                      2;
enum XI_KeyRelease =                    3;
enum XI_ButtonPress =                   4;
enum XI_ButtonRelease =                 5;
enum XI_Motion =                        6;
enum XI_Enter =                         7;
enum XI_Leave =                         8;
enum XI_FocusIn =                       9;
enum XI_FocusOut =                      10;
enum XI_HierarchyChanged =              11;
enum XI_PropertyEvent =                 12;
enum XI_RawKeyPress =                   13;
enum XI_RawKeyRelease =                 14;
enum XI_RawButtonPress =                15;
enum XI_RawButtonRelease =              16;
enum XI_RawMotion =                     17;
enum XI_TouchBegin =                    18 /* XI 2.2 */;
enum XI_TouchUpdate =                   19;
enum XI_TouchEnd =                      20;
enum XI_TouchOwnership =                21;
enum XI_RawTouchBegin =                 22;
enum XI_RawTouchUpdate =                23;
enum XI_RawTouchEnd =                   24;
enum XI_BarrierHit =                    25 /* XI 2.3 */;
enum XI_BarrierLeave =                  26;
enum XI_GesturePinchBegin =             27 /* XI 2.4 */;
enum XI_GesturePinchUpdate =            28;
enum XI_GesturePinchEnd =               29;
enum XI_GestureSwipeBegin =             30;
enum XI_GestureSwipeUpdate =            31;
enum XI_GestureSwipeEnd =               32;
enum XI_LASTEVENT =                     XI_GestureSwipeEnd;
/* NOTE: XI2LASTEVENT in xserver/include/inputstr.h must be the same value
 * as XI_LASTEVENT if the server is supposed to handle masks etc. for this
 * type of event. */

/* Event masks.
 * Note: the protocol spec defines a mask to be of (1 << type). Clients are
 * free to create masks by bitshifting instead of using these defines.
 */
enum XI_DeviceChangedMask =             (1 << XI_DeviceChanged);
enum XI_KeyPressMask =                  (1 << XI_KeyPress);
enum XI_KeyReleaseMask =                (1 << XI_KeyRelease);
enum XI_ButtonPressMask =               (1 << XI_ButtonPress);
enum XI_ButtonReleaseMask =             (1 << XI_ButtonRelease);
enum XI_MotionMask =                    (1 << XI_Motion);
enum XI_EnterMask =                     (1 << XI_Enter);
enum XI_LeaveMask =                     (1 << XI_Leave);
enum XI_FocusInMask =                   (1 << XI_FocusIn);
enum XI_FocusOutMask =                  (1 << XI_FocusOut);
enum XI_HierarchyChangedMask =          (1 << XI_HierarchyChanged);
enum XI_PropertyEventMask =             (1 << XI_PropertyEvent);
enum XI_RawKeyPressMask =               (1 << XI_RawKeyPress);
enum XI_RawKeyReleaseMask =             (1 << XI_RawKeyRelease);
enum XI_RawButtonPressMask =            (1 << XI_RawButtonPress);
enum XI_RawButtonReleaseMask =          (1 << XI_RawButtonRelease);
enum XI_RawMotionMask =                 (1 << XI_RawMotion);
enum XI_TouchBeginMask =                (1 << XI_TouchBegin);
enum XI_TouchEndMask =                  (1 << XI_TouchEnd);
enum XI_TouchOwnershipChangedMask =     (1 << XI_TouchOwnership);
enum XI_TouchUpdateMask =               (1 << XI_TouchUpdate);
enum XI_RawTouchBeginMask =             (1 << XI_RawTouchBegin);
enum XI_RawTouchEndMask =               (1 << XI_RawTouchEnd);
enum XI_RawTouchUpdateMask =            (1 << XI_RawTouchUpdate);
enum XI_BarrierHitMask =                (1 << XI_BarrierHit);
enum XI_BarrierLeaveMask =              (1 << XI_BarrierLeave);

 /* _XI2_H_ */
