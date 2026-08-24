module externs.X11.extensions.XKBproto;
@nogc nothrow:
extern(C): __gshared:
/************************************************************
Copyright (c) 1993 by Silicon Graphics Computer Systems, Inc.

Permission to use, copy, modify, and distribute this
software and its documentation for any purpose and without
fee is hereby granted, provided that the above copyright
notice appear in all copies and that both that copyright
notice and this permission notice appear in supporting
documentation, and that the name of Silicon Graphics not be
used in advertising or publicity pertaining to distribution
of the software without specific prior written permission.
Silicon Graphics makes no representation about the suitability
of this software for any purpose. It is provided "as is"
without any express or implied warranty.

SILICON GRAPHICS DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS
SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
AND FITNESS FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL SILICON
GRAPHICS BE LIABLE FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL
DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE
OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION  WITH
THE USE OR PERFORMANCE OF THIS SOFTWARE.

********************************************************/

 
public import externs.X11.Xmd;
public import externs.X11.Xfuncproto;
public import externs.X11.extensions.XKB;

alias Window = CARD32;
alias Atom = CARD32;
alias Time = CARD32;
alias KeyCode = CARD8;
alias KeySym = CARD32;

enum string	XkbPaddedSize(string n) = `(((cast(uint)(` ~ n ~ `)+3) >> 2) << 2)`;

struct xkbUseExtensionReq {
    CARD8 reqType;
    CARD8 xkbReqType;	/* always X_KBUseExtension */
    CARD16 length;
    CARD16 wantedMajor;
    CARD16 wantedMinor;
}
enum	sz_xkbUseExtensionReq =	8;

struct xkbUseExtensionReply {
    BYTE type;		/* X_Reply */
    BOOL supported;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD16 serverMajor;
    CARD16 serverMinor;
    CARD32 pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
}
enum	sz_xkbUseExtensionReply =	32;

struct xkbSelectEventsReq {
    CARD8 reqType;
    CARD8 xkbReqType;	/* X_KBSelectEvents */
    CARD16 length;
    CARD16 deviceSpec;
    CARD16 affectWhich;
    CARD16 clear;
    CARD16 selectAll;
    CARD16 affectMap;
    CARD16 map;
}
enum	sz_xkbSelectEventsReq =	16;

struct xkbBellReq {
    CARD8 reqType;
    CARD8 xkbReqType;	/* X_KBBell */
    CARD16 length;
    CARD16 deviceSpec;
    CARD16 bellClass;
    CARD16 bellID;
    INT8 percent;
    BOOL forceSound;
    BOOL eventOnly;
    CARD8 pad1;
    INT16 pitch;
    INT16 duration;
    CARD16 pad2;
    Atom name;
    Window window;
}
enum	sz_xkbBellReq =		28;

struct xkbGetStateReq {
	CARD8 reqType;
	CARD8 xkbReqType;	/* always X_KBGetState */
	CARD16 length;
	CARD16 deviceSpec;
	CARD16 pad;
}
enum	sz_xkbGetStateReq =	8;

struct xkbGetStateReply {
    BYTE type;
    BYTE deviceID;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD8 mods;
    CARD8 baseMods;
    CARD8 latchedMods;
    CARD8 lockedMods;
    CARD8 group;
    CARD8 lockedGroup;
    INT16 baseGroup;
    INT16 latchedGroup;
    CARD8 compatState;
    CARD8 grabMods;
    CARD8 compatGrabMods;
    CARD8 lookupMods;
    CARD8 compatLookupMods;
    CARD8 pad1;
    CARD16 ptrBtnState;
    CARD16 pad2;
    CARD32 pad3;
}
enum	sz_xkbGetStateReply =	32;

struct xkbLatchLockStateReq {
    CARD8 reqType;
    CARD8 xkbReqType;	/* always X_KBLatchLockState */
    CARD16 length;
    CARD16 deviceSpec;
    CARD8 affectModLocks;
    CARD8 modLocks;
    BOOL lockGroup;
    CARD8 groupLock;
    CARD8 affectModLatches;
    CARD8 modLatches;
    CARD8 pad;
    BOOL latchGroup;
    INT16 groupLatch;
}
enum	sz_xkbLatchLockStateReq =		16;

struct xkbGetControlsReq {
    CARD8 reqType;
    CARD8 xkbReqType;	/* always X_KBGetControls */
    CARD16 length;
    CARD16 deviceSpec;
    CARD16 pad;
}
enum	sz_xkbGetControlsReq =	8;

struct xkbGetControlsReply {
    BYTE type;		/* X_Reply */
    CARD8 deviceID;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD8 mkDfltBtn;
    CARD8 numGroups;
    CARD8 groupsWrap;
    CARD8 internalMods;
    CARD8 ignoreLockMods;
    CARD8 internalRealMods;
    CARD8 ignoreLockRealMods;
    CARD8 pad1;
    CARD16 internalVMods;
    CARD16 ignoreLockVMods;
    CARD16 repeatDelay;
    CARD16 repeatInterval;
    CARD16 slowKeysDelay;
    CARD16 debounceDelay;
    CARD16 mkDelay;
    CARD16 mkInterval;
    CARD16 mkTimeToMax;
    CARD16 mkMaxSpeed;
    INT16 mkCurve;
    CARD16 axOptions;
    CARD16 axTimeout;
    CARD16 axtOptsMask;
    CARD16 axtOptsValues;
    CARD16 pad2;
    CARD32 axtCtrlsMask;
    CARD32 axtCtrlsValues;
    CARD32 enabledCtrls;
    BYTE[XkbPerKeyBitArraySize] perKeyRepeat;
}
enum	sz_xkbGetControlsReply =	92;

struct xkbSetControlsReq {
    CARD8 reqType;
    CARD8 xkbReqType;	/* always X_KBSetControls */
    CARD16 length;
    CARD16 deviceSpec;
    CARD8 affectInternalMods;
    CARD8 internalMods;
    CARD8 affectIgnoreLockMods;
    CARD8 ignoreLockMods;
    CARD16 affectInternalVMods;
    CARD16 internalVMods;
    CARD16 affectIgnoreLockVMods;
    CARD16 ignoreLockVMods;
    CARD8 mkDfltBtn;
    CARD8 groupsWrap;
    CARD16 axOptions;
    CARD16 pad1;
    CARD32 affectEnabledCtrls;
    CARD32 enabledCtrls;
    CARD32 changeCtrls;
    CARD16 repeatDelay;
    CARD16 repeatInterval;
    CARD16 slowKeysDelay;
    CARD16 debounceDelay;
    CARD16 mkDelay;
    CARD16 mkInterval;
    CARD16 mkTimeToMax;
    CARD16 mkMaxSpeed;
    INT16 mkCurve;
    CARD16 axTimeout;
    CARD32 axtCtrlsMask;
    CARD32 axtCtrlsValues;
    CARD16 axtOptsMask;
    CARD16 axtOptsValues;
    BYTE[XkbPerKeyBitArraySize] perKeyRepeat;
}
enum	sz_xkbSetControlsReq =	100;

struct xkbKTMapEntryWireDesc {
    BOOL active;
    CARD8 mask;
    CARD8 level;
    CARD8 realMods;
    CARD16 virtualMods;
    CARD16 pad;
}
enum sz_xkbKTMapEntryWireDesc =	8;

struct xkbKTSetMapEntryWireDesc {
    CARD8 level;
    CARD8 realMods;
    CARD16 virtualMods;
}
enum	sz_xkbKTSetMapEntryWireDesc =	4;

struct xkbModsWireDesc {
    CARD8 mask;		/* GetMap only */
    CARD8 realMods;
    CARD16 virtualMods;
}
enum	sz_xkbModsWireDesc =	4;

struct xkbKeyTypeWireDesc {
    CARD8 mask;
    CARD8 realMods;
    CARD16 virtualMods;
    CARD8 numLevels;
    CARD8 nMapEntries;
    BOOL preserve;
    CARD8 pad;
}
enum	sz_xkbKeyTypeWireDesc =	8;

struct xkbSymMapWireDesc {
    CARD8[XkbNumKbdGroups] ktIndex;
    CARD8 groupInfo;
    CARD8 width;
    CARD16 nSyms;
}
enum	sz_xkbSymMapWireDesc =	8;

struct xkbVModMapWireDesc {
    KeyCode key;
    CARD8 pad;
    CARD16 vmods;
}
enum	sz_xkbVModMapWireDesc =	4;

struct xkbBehaviorWireDesc {
	CARD8 key;
	CARD8 type;
	CARD8 data;
	CARD8 pad;
}
enum	sz_xkbBehaviorWireDesc =	4;

struct xkbActionWireDesc {
    CARD8 type;
    CARD8[7] data;
}
enum	sz_xkbActionWireDesc =	8;

struct xkbGetMapReq {
    CARD8 reqType;
    CARD8 xkbReqType;	/* always X_KBGetMap */
    CARD16 length;
    CARD16 deviceSpec;
    CARD16 full;
    CARD16 partial;
    CARD8 firstType;
    CARD8 nTypes;
    KeyCode firstKeySym;
    CARD8 nKeySyms;
    KeyCode firstKeyAct;
    CARD8 nKeyActs;
    KeyCode firstKeyBehavior;
    CARD8 nKeyBehaviors;
    CARD16 virtualMods;
    KeyCode firstKeyExplicit;
    CARD8 nKeyExplicit;
    KeyCode firstModMapKey;
    CARD8 nModMapKeys;
    KeyCode firstVModMapKey;
    CARD8 nVModMapKeys;
    CARD16 pad1;
}
enum	sz_xkbGetMapReq =	28;

struct xkbGetMapReply {
    CARD8 type;		/* always X_Reply */
    CARD8 deviceID;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD16 pad1;
    KeyCode minKeyCode;
    KeyCode maxKeyCode;
    CARD16 present;
    CARD8 firstType;
    CARD8 nTypes;
    CARD8 totalTypes;
    KeyCode firstKeySym;
    CARD16 totalSyms;
    CARD8 nKeySyms;
    KeyCode firstKeyAct;
    CARD16 totalActs;
    CARD8 nKeyActs;
    KeyCode firstKeyBehavior;
    CARD8 nKeyBehaviors;
    CARD8 totalKeyBehaviors;
    KeyCode firstKeyExplicit;
    CARD8 nKeyExplicit;
    CARD8 totalKeyExplicit;
    KeyCode firstModMapKey;
    CARD8 nModMapKeys;
    CARD8 totalModMapKeys;
    KeyCode firstVModMapKey;
    CARD8 nVModMapKeys;
    CARD8 totalVModMapKeys;
    CARD8 pad2;
    CARD16 virtualMods;
}
enum	sz_xkbGetMapReply =		40;

enum	XkbSetMapResizeTypes =		(1L<<0);
enum	XkbSetMapRecomputeActions =	(1L<<1);
enum	XkbSetMapAllFlags =		(0x3);

struct xkbSetMapReq {
    CARD8 reqType;
    CARD8 xkbReqType;	/* always X_KBSetMap */
    CARD16 length;
    CARD16 deviceSpec;
    CARD16 present;
    CARD16 flags;
    KeyCode minKeyCode;
    KeyCode maxKeyCode;
    CARD8 firstType;
    CARD8 nTypes;
    KeyCode firstKeySym;
    CARD8 nKeySyms;
    CARD16 totalSyms;
    KeyCode firstKeyAct;
    CARD8 nKeyActs;
    CARD16 totalActs;
    KeyCode firstKeyBehavior;
    CARD8 nKeyBehaviors;
    CARD8 totalKeyBehaviors;
    KeyCode firstKeyExplicit;
    CARD8 nKeyExplicit;
    CARD8 totalKeyExplicit;
    KeyCode firstModMapKey;
    CARD8 nModMapKeys;
    CARD8 totalModMapKeys;
    KeyCode firstVModMapKey;
    CARD8 nVModMapKeys;
    CARD8 totalVModMapKeys;
    CARD16 virtualMods;
}
enum	sz_xkbSetMapReq =	36;

struct xkbSymInterpretWireDesc {
    CARD32 sym;
    CARD8 mods;
    CARD8 match;
    CARD8 virtualMod;
    CARD8 flags;
    xkbActionWireDesc act;
}
enum	sz_xkbSymInterpretWireDesc =	16;

struct xkbGetCompatMapReq {
    CARD8 reqType;
    CARD8 xkbReqType;	/* always X_KBGetCompatMap */
    CARD16 length;
    CARD16 deviceSpec;
    CARD8 groups;
    BOOL getAllSI;
    CARD16 firstSI;
    CARD16 nSI;
}
enum	sz_xkbGetCompatMapReq =	12;

struct xkbGetCompatMapReply {
    CARD8 type;		/* always X_Reply */
    CARD8 deviceID;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD8 groups;
    CARD8 pad1;
    CARD16 firstSI;
    CARD16 nSI;
    CARD16 nTotalSI;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
}
enum	sz_xkbGetCompatMapReply =		32;

struct xkbSetCompatMapReq {
    CARD8 reqType;
    CARD8 xkbReqType;	/* always X_KBSetCompatMap */
    CARD16 length;
    CARD16 deviceSpec;
    CARD8 pad1;
    BOOL recomputeActions;
    BOOL truncateSI;
    CARD8 groups;
    CARD16 firstSI;
    CARD16 nSI;
    CARD16 pad2;
}
enum	sz_xkbSetCompatMapReq =	16;

struct xkbGetIndicatorStateReq {
    CARD8 reqType;
    CARD8 xkbReqType;	/* always X_KBGetIndicatorState */
    CARD16 length;
    CARD16 deviceSpec;
    CARD16 pad1;
}
enum	sz_xkbGetIndicatorStateReq =	8;

struct xkbGetIndicatorStateReply {
    CARD8 type;		/* always X_Reply */
    CARD8 deviceID;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 state;
    CARD32 pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
}
enum	sz_xkbGetIndicatorStateReply =	32;

struct xkbGetIndicatorMapReq {
    CARD8 reqType;
    CARD8 xkbReqType;	/* always X_KBGetIndicatorMap */
    CARD16 length;
    CARD16 deviceSpec;
    CARD16 pad;
    CARD32 which;
}
enum	sz_xkbGetIndicatorMapReq =	12;

struct xkbGetIndicatorMapReply {
    CARD8 type;		/* always X_Reply */
    CARD8 deviceID;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 which;
    CARD32 realIndicators;
    CARD8 nIndicators;
    CARD8 pad1;
    CARD16 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
}
enum	sz_xkbGetIndicatorMapReply =	32;

struct xkbIndicatorMapWireDesc {
    CARD8 flags;
    CARD8 whichGroups;
    CARD8 groups;
    CARD8 whichMods;
    CARD8 mods;
    CARD8 realMods;
    CARD16 virtualMods;
    CARD32 ctrls;
}
enum	sz_xkbIndicatorMapWireDesc =	12;

struct xkbSetIndicatorMapReq {
    CARD8 reqType;
    CARD8 xkbReqType;	/* always X_KBSetIndicatorMap */
    CARD16 length;
    CARD16 deviceSpec;
    CARD16 pad1;
    CARD32 which;
}
enum	sz_xkbSetIndicatorMapReq =	12;

struct xkbGetNamedIndicatorReq {
    CARD8 reqType;
    CARD8 xkbReqType;	/* X_KBGetNamedIndicator */
    CARD16 length;
    CARD16 deviceSpec;
    CARD16 ledClass;
    CARD16 ledID;
    CARD16 pad1;
    Atom indicator;
}
enum	sz_xkbGetNamedIndicatorReq =		16;

struct xkbGetNamedIndicatorReply {
    BYTE type;
    BYTE deviceID;
    CARD16 sequenceNumber;
    CARD32 length;
    Atom indicator;
    BOOL found;
    BOOL on;
    BOOL realIndicator;
    CARD8 ndx;
    CARD8 flags;
    CARD8 whichGroups;
    CARD8 groups;
    CARD8 whichMods;
    CARD8 mods;
    CARD8 realMods;
    CARD16 virtualMods;
    CARD32 ctrls;
    BOOL supported;
    CARD8 pad1;
    CARD16 pad2;
}
enum	sz_xkbGetNamedIndicatorReply =	32;

struct xkbSetNamedIndicatorReq {
    CARD8 reqType;
    CARD8 xkbReqType;	/* X_KBSetNamedIndicator */
    CARD16 length;
    CARD16 deviceSpec;
    CARD16 ledClass;
    CARD16 ledID;
    CARD16 pad1;
    Atom indicator;
    BOOL setState;
    BOOL on;
    BOOL setMap;
    BOOL createMap;
    CARD8 pad2;
    CARD8 flags;
    CARD8 whichGroups;
    CARD8 groups;
    CARD8 whichMods;
    CARD8 realMods;
    CARD16 virtualMods;
    CARD32 ctrls;
}
enum	sz_xkbSetNamedIndicatorReq =	32;

struct xkbGetNamesReq {
    CARD8 reqType;
    CARD8 xkbReqType;	/* always X_KBGetNames */
    CARD16 length;
    CARD16 deviceSpec;
    CARD16 pad;
    CARD32 which;
}
enum	sz_xkbGetNamesReq =		12;

struct xkbGetNamesReply {
    BYTE type;
    BYTE deviceID;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 which;
    KeyCode minKeyCode;
    KeyCode maxKeyCode;
    CARD8 nTypes;
    CARD8 groupNames;
    CARD16 virtualMods;
    KeyCode firstKey;
    CARD8 nKeys;
    CARD32 indicators;
    CARD8 nRadioGroups;
    CARD8 nKeyAliases;
    CARD16 nKTLevels;
    CARD32 pad3;
}
enum	sz_xkbGetNamesReply =	32;

struct xkbSetNamesReq {
    CARD8 reqType;
    CARD8 xkbReqType;	/* always X_KBSetNames */
    CARD16 length;
    CARD16 deviceSpec;
    CARD16 virtualMods;
    CARD32 which;
    CARD8 firstType;
    CARD8 nTypes;
    CARD8 firstKTLevel;
    CARD8 nKTLevels;
    CARD32 indicators;
    CARD8 groupNames;
    CARD8 nRadioGroups;
    KeyCode firstKey;
    CARD8 nKeys;
    CARD8 nKeyAliases;
    CARD8 pad1;
    CARD16 totalKTLevelNames;
}
enum	sz_xkbSetNamesReq =	28;

struct xkbPointWireDesc {
    INT16 x;
    INT16 y;
}
enum	sz_xkbPointWireDesc =	4;

struct xkbOutlineWireDesc {
    CARD8 nPoints;
    CARD8 cornerRadius;
    CARD16 pad;
}
enum	sz_xkbOutlineWireDesc =	4;

struct xkbShapeWireDesc {
    Atom name;
    CARD8 nOutlines;
    CARD8 primaryNdx;
    CARD8 approxNdx;
    CARD8 pad;
}
enum	sz_xkbShapeWireDesc =	8;

struct xkbSectionWireDesc {
    Atom name;
    INT16 top;
    INT16 left;
    CARD16 width;
    CARD16 height;
    INT16 angle;
    CARD8 priority;
    CARD8 nRows;
    CARD8 nDoodads;
    CARD8 nOverlays;
    CARD16 pad;
}
enum	sz_xkbSectionWireDesc =	20;

struct xkbRowWireDesc {
    INT16 top;
    INT16 left;
    CARD8 nKeys;
    BOOL vertical;
    CARD16 pad;
}
enum	sz_xkbRowWireDesc =	8;

struct xkbKeyWireDesc {
    CARD8[XkbKeyNameLength] name;
    INT16 gap;
    CARD8 shapeNdx;
    CARD8 colorNdx;
}
enum	sz_xkbKeyWireDesc =	8;

struct xkbOverlayWireDesc {
    Atom name;
    CARD8 nRows;
    CARD8 pad1;
    CARD16 pad2;
}
enum	sz_xkbOverlayWireDesc =	8;

struct xkbOverlayRowWireDesc {
   CARD8 rowUnder;
   CARD8 nKeys;
   CARD16 pad1;
}
enum	sz_xkbOverlayRowWireDesc =	4;

struct xkbOverlayKeyWireDesc {
   CARD8[XkbKeyNameLength] over;
   CARD8[XkbKeyNameLength] under;
}
enum	sz_xkbOverlayKeyWireDesc =	8;

struct xkbShapeDoodadWireDesc {
    Atom name;
    CARD8 type;
    CARD8 priority;
    INT16 top;
    INT16 left;
    INT16 angle;
    CARD8 colorNdx;
    CARD8 shapeNdx;
    CARD16 pad1;
    CARD32 pad2;
}
enum	sz_xkbShapeDoodadWireDesc =	20;

struct xkbTextDoodadWireDesc {
    Atom name;
    CARD8 type;
    CARD8 priority;
    INT16 top;
    INT16 left;
    INT16 angle;
    CARD16 width;
    CARD16 height;
    CARD8 colorNdx;
    CARD8 pad1;
    CARD16 pad2;
}
enum	sz_xkbTextDoodadWireDesc =	20;

struct xkbIndicatorDoodadWireDesc {
    Atom name;
    CARD8 type;
    CARD8 priority;
    INT16 top;
    INT16 left;
    INT16 angle;
    CARD8 shapeNdx;
    CARD8 onColorNdx;
    CARD8 offColorNdx;
    CARD8 pad1;
    CARD32 pad2;
}
enum	sz_xkbIndicatorDoodadWireDesc =	20;

struct xkbLogoDoodadWireDesc {
    Atom name;
    CARD8 type;
    CARD8 priority;
    INT16 top;
    INT16 left;
    INT16 angle;
    CARD8 colorNdx;
    CARD8 shapeNdx;
    CARD16 pad1;
    CARD32 pad2;
}
enum	sz_xkbLogoDoodadWireDesc =	20;

struct xkbAnyDoodadWireDesc {
    Atom name;
    CARD8 type;
    CARD8 priority;
    INT16 top;
    INT16 left;
    INT16 angle;
    CARD32 pad2;
    CARD32 pad3;
}
enum	sz_xkbAnyDoodadWireDesc =	20;

union xkbDoodadWireDesc {
    xkbAnyDoodadWireDesc any;
    xkbShapeDoodadWireDesc shape;
    xkbTextDoodadWireDesc text;
    xkbIndicatorDoodadWireDesc indicator;
    xkbLogoDoodadWireDesc logo;
}
enum	sz_xkbDoodadWireDesc =	20;

struct xkbGetGeometryReq {
    CARD8 reqType;
    CARD8 xkbReqType;	/* always X_KBGetGeometry */
    CARD16 length;
    CARD16 deviceSpec;
    CARD16 pad;
    Atom name;
}
enum	sz_xkbGetGeometryReq =	12;

struct xkbGetGeometryReply {
    CARD8 type;		/* always X_Reply */
    CARD8 deviceID;
    CARD16 sequenceNumber;
    CARD32 length;
    Atom name;
    BOOL found;
    CARD8 pad;
    CARD16 widthMM;
    CARD16 heightMM;
    CARD16 nProperties;
    CARD16 nColors;
    CARD16 nShapes;
    CARD16 nSections;
    CARD16 nDoodads;
    CARD16 nKeyAliases;
    CARD8 baseColorNdx;
    CARD8 labelColorNdx;
}
enum	sz_xkbGetGeometryReply =	32;

struct xkbSetGeometryReq {
    CARD8 reqType;
    CARD8 xkbReqType;	/* always X_KBSetGeometry */
    CARD16 length;
    CARD16 deviceSpec;
    CARD8 nShapes;
    CARD8 nSections;
    Atom name;
    CARD16 widthMM;
    CARD16 heightMM;
    CARD16 nProperties;
    CARD16 nColors;
    CARD16 nDoodads;
    CARD16 nKeyAliases;
    CARD8 baseColorNdx;
    CARD8 labelColorNdx;
    CARD16 pad;
}
enum	sz_xkbSetGeometryReq =	28;

struct xkbPerClientFlagsReq {
    CARD8 reqType;
    CARD8 xkbReqType;/* always X_KBPerClientFlags */
    CARD16 length;
    CARD16 deviceSpec;
    CARD16 pad1;
    CARD32 change;
    CARD32 value;
    CARD32 ctrlsToChange;
    CARD32 autoCtrls;
    CARD32 autoCtrlValues;
}
enum	sz_xkbPerClientFlagsReq =	28;

struct xkbPerClientFlagsReply {
    CARD8 type;		/* always X_Reply */
    CARD8 deviceID;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 supported;
    CARD32 value;
    CARD32 autoCtrls;
    CARD32 autoCtrlValues;
    CARD32 pad1;
    CARD32 pad2;
}
enum	sz_xkbPerClientFlagsReply =	32;

struct xkbListComponentsReq {
    CARD8 reqType;
    CARD8 xkbReqType;	/* always X_KBListComponents */
    CARD16 length;
    CARD16 deviceSpec;
    CARD16 maxNames;
}
enum	sz_xkbListComponentsReq =	8;

struct xkbListComponentsReply {
    CARD8 type;		/* always X_Reply */
    CARD8 deviceID;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD16 nKeymaps;
    CARD16 nKeycodes;
    CARD16 nTypes;
    CARD16 nCompatMaps;
    CARD16 nSymbols;
    CARD16 nGeometries;
    CARD16 extra;
    CARD16 pad1;
    CARD32 pad2;
    CARD32 pad3;
}
enum	sz_xkbListComponentsReply =	32;

struct xkbGetKbdByNameReq {
    CARD8 reqType;
    CARD8 xkbReqType;	/* always X_KBGetKbdByName */
    CARD16 length;
    CARD16 deviceSpec;
    CARD16 need;		/* combination of XkbGBN_* */
    CARD16 want;		/* combination of XkbGBN_* */
    BOOL load;
    CARD8 pad;
}
enum	sz_xkbGetKbdByNameReq =	12;

struct xkbGetKbdByNameReply {
    CARD8 type;		/* always X_Reply */
    CARD8 deviceID;
    CARD16 sequenceNumber;
    CARD32 length;
    KeyCode minKeyCode;
    KeyCode maxKeyCode;
    BOOL loaded;
    BOOL newKeyboard;
    CARD16 found;		/* combination of XkbGBN_* */
    CARD16 reported;	/* combination of XkbAllComponents */
    CARD32 pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
}
enum	sz_xkbGetKbdByNameReply =	32;

struct xkbDeviceLedsWireDesc {
    CARD16 ledClass;
    CARD16 ledID;
    CARD32 namesPresent;
    CARD32 mapsPresent;
    CARD32 physIndicators;
    CARD32 state;
}
enum sz_xkbDeviceLedsWireDesc =	20;

struct xkbGetDeviceInfoReq {
    CARD8 reqType;
    CARD8 xkbReqType;	/* always X_KBGetDeviceInfo */
    CARD16 length;
    CARD16 deviceSpec;
    CARD16 wanted;
    BOOL allBtns;
    CARD8 firstBtn;
    CARD8 nBtns;
    CARD8 pad;
    CARD16 ledClass;
    CARD16 ledID;
}
enum	sz_xkbGetDeviceInfoReq =	16;

struct xkbGetDeviceInfoReply {
    CARD8 type;		/* always X_Reply */
    CARD8 deviceID;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD16 present;
    CARD16 supported;
    CARD16 unsupported;
    CARD16 nDeviceLedFBs;
    CARD8 firstBtnWanted;
    CARD8 nBtnsWanted;
    CARD8 firstBtnRtrn;
    CARD8 nBtnsRtrn;
    CARD8 totalBtns;
    BOOL hasOwnState;
    CARD16 dfltKbdFB;
    CARD16 dfltLedFB;
    CARD16 pad;
    Atom devType;
}
enum	sz_xkbGetDeviceInfoReply =	32;

struct xkbSetDeviceInfoReq {
    CARD8 reqType;
    CARD8 xkbReqType;	/* always X_KBSetDeviceInfo */
    CARD16 length;
    CARD16 deviceSpec;
    CARD8 firstBtn;
    CARD8 nBtns;
    CARD16 change;
    CARD16 nDeviceLedFBs;
}
enum	sz_xkbSetDeviceInfoReq =	12;

struct xkbSetDebuggingFlagsReq {
    CARD8 reqType;
    CARD8 xkbReqType;	/* always X_KBSetDebuggingFlags */
    CARD16 length;
    CARD16 msgLength;
    CARD16 pad;
    CARD32 affectFlags;
    CARD32 flags;
    CARD32 affectCtrls;
    CARD32 ctrls;
}
enum	sz_xkbSetDebuggingFlagsReq =	24;

struct xkbSetDebuggingFlagsReply {
    BYTE type;		/* X_Reply */
    CARD8 pad0;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 currentFlags;
    CARD32 currentCtrls;
    CARD32 supportedFlags;
    CARD32 supportedCtrls;
    CARD32 pad1;
    CARD32 pad2;
}
enum	sz_xkbSetDebuggingFlagsReply =	32;

	/*
	 * X KEYBOARD EXTENSION EVENT STRUCTURES
	 */

struct xkbAnyEvent {
    BYTE type;
    BYTE xkbType;
    CARD16 sequenceNumber;
    Time time;
    CARD8 deviceID;
    CARD8 pad1;
    CARD16 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;
    CARD32 pad7;
}
enum	sz_xkbAnyEvent = 32;

struct xkbNewKeyboardNotify {
    BYTE type;
    BYTE xkbType;
    CARD16 sequenceNumber;
    Time time;
    CARD8 deviceID;
    CARD8 oldDeviceID;
    KeyCode minKeyCode;
    KeyCode maxKeyCode;
    KeyCode oldMinKeyCode;
    KeyCode oldMaxKeyCode;
    CARD8 requestMajor;
    CARD8 requestMinor;
    CARD16 changed;
    CARD8 detail;
    CARD8 pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
}
enum	sz_xkbNewKeyboardNotify =	32;

struct xkbMapNotify {
    BYTE type;
    BYTE xkbType;
    CARD16 sequenceNumber;
    Time time;
    CARD8 deviceID;
    CARD8 ptrBtnActions;
    CARD16 changed;
    KeyCode minKeyCode;
    KeyCode maxKeyCode;
    CARD8 firstType;
    CARD8 nTypes;
    KeyCode firstKeySym;
    CARD8 nKeySyms;
    KeyCode firstKeyAct;
    CARD8 nKeyActs;
    KeyCode firstKeyBehavior;
    CARD8 nKeyBehaviors;
    KeyCode firstKeyExplicit;
    CARD8 nKeyExplicit;
    KeyCode firstModMapKey;
    CARD8 nModMapKeys;
    KeyCode firstVModMapKey;
    CARD8 nVModMapKeys;
    CARD16 virtualMods;
    CARD16 pad1;
}
enum	sz_xkbMapNotify =	32;

struct xkbStateNotify {
    BYTE type;
    BYTE xkbType;
    CARD16 sequenceNumber;
    Time time;
    CARD8 deviceID;
    CARD8 mods;
    CARD8 baseMods;
    CARD8 latchedMods;
    CARD8 lockedMods;
    CARD8 group;
    INT16 baseGroup;
    INT16 latchedGroup;
    CARD8 lockedGroup;
    CARD8 compatState;
    CARD8 grabMods;
    CARD8 compatGrabMods;
    CARD8 lookupMods;
    CARD8 compatLookupMods;
    CARD16 ptrBtnState;
    CARD16 changed;
    KeyCode keycode;
    CARD8 eventType;
    CARD8 requestMajor;
    CARD8 requestMinor;
}
enum	sz_xkbStateNotify =	32;

struct xkbControlsNotify {
    BYTE type;
    BYTE xkbType;
    CARD16 sequenceNumber;
    Time time;
    CARD8 deviceID;
    CARD8 numGroups;
    CARD16 pad1;
    CARD32 changedControls;
    CARD32 enabledControls;
    CARD32 enabledControlChanges;
    KeyCode keycode;
    CARD8 eventType;
    CARD8 requestMajor;
    CARD8 requestMinor;
    CARD32 pad2;
}
enum	sz_xkbControlsNotify =	32;

struct xkbIndicatorNotify {
    BYTE type;
    BYTE xkbType;
    CARD16 sequenceNumber;
    Time time;
    CARD8 deviceID;
    CARD8 pad1;
    CARD16 pad2;
    CARD32 state;
    CARD32 changed;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
}
enum	sz_xkbIndicatorNotify =	32;

struct xkbNamesNotify {
    BYTE type;
    BYTE xkbType;
    CARD16 sequenceNumber;
    Time time;
    CARD8 deviceID;
    CARD8 pad1;
    CARD16 changed;
    CARD8 firstType;
    CARD8 nTypes;
    CARD8 firstLevelName;
    CARD8 nLevelNames;
    CARD8 pad2;
    CARD8 nRadioGroups;
    CARD8 nAliases;
    CARD8 changedGroupNames;
    CARD16 changedVirtualMods;
    CARD8 firstKey;
    CARD8 nKeys;
    CARD32 changedIndicators;
    CARD32 pad3;
}
enum	sz_xkbNamesNotify =	32;

struct xkbCompatMapNotify {
    BYTE type;
    BYTE xkbType;
    CARD16 sequenceNumber;
    Time time;
    CARD8 deviceID;
    CARD8 changedGroups;
    CARD16 firstSI;
    CARD16 nSI;
    CARD16 nTotalSI;
    CARD32 pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
}
enum sz_xkbCompatMapNotify =	32;

struct xkbBellNotify {
    BYTE type;
    BYTE xkbType;
    CARD16 sequenceNumber;
    Time time;
    CARD8 deviceID;
    CARD8 bellClass;
    CARD8 bellID;
    CARD8 percent;
    CARD16 pitch;
    CARD16 duration;
    Atom name;
    Window window;
    BOOL eventOnly;
    CARD8 pad1;
    CARD16 pad2;
    CARD32 pad3;
}
enum	sz_xkbBellNotify =	32;

struct xkbActionMessage {
    BYTE type;
    BYTE xkbType;
    CARD16 sequenceNumber;
    Time time;
    CARD8 deviceID;
    KeyCode keycode;
    BOOL press;
    BOOL keyEventFollows;
    CARD8 mods;
    CARD8 group;
    CARD8[8] message;
    CARD16 pad1;
    CARD32 pad2;
    CARD32 pad3;
}
enum	sz_xkbActionMessage =		32;

struct xkbAccessXNotify {
    BYTE type;
    BYTE xkbType;
    CARD16 sequenceNumber;
    Time time;
    CARD8 deviceID;
    KeyCode keycode;
    CARD16 detail;
    CARD16 slowKeysDelay;
    CARD16 debounceDelay;
    CARD32 pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
}
enum	sz_xkbAccessXNotify =	32;

struct xkbExtensionDeviceNotify {
    BYTE type;
    BYTE xkbType;
    CARD16 sequenceNumber;
    Time time;
    CARD8 deviceID;
    CARD8 pad1;
    CARD16 reason;
    CARD16 ledClass;
    CARD16 ledID;
    CARD32 ledsDefined;
    CARD32 ledState;
    CARD8 firstBtn;
    CARD8 nBtns;
    CARD16 supported;
    CARD16 unsupported;
    CARD16 pad3;
}
enum	sz_xkbExtensionDeviceNotify =		32;

struct xkbEvent {
    union _U {
	xkbAnyEvent any;
	xkbNewKeyboardNotify new_kbd;
	xkbMapNotify map;
	xkbStateNotify state;
	xkbControlsNotify ctrls;
	xkbIndicatorNotify indicators;
	xkbNamesNotify names;
	xkbCompatMapNotify compat;
	xkbBellNotify bell;
	xkbActionMessage message;
	xkbAccessXNotify accessx;
	xkbExtensionDeviceNotify device;
    }_U u;
}
enum sz_xkbEvent =	32;

 /* _XKBPROTO_H_ */
