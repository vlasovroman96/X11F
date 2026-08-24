module externs.X11.extensions.XKMformat;
@nogc nothrow:
extern(C): __gshared:
/************************************************************
 Copyright (c) 1994 by Silicon Graphics Computer Systems, Inc.

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

version (_XKMFORMAT_H_) {} else {
enum	_XKMFORMAT_H_ = 1;

public import externs.X11.extensions.XKB;
public import externs.X11.extensions.XKBproto;
public import externs.X11.extensions.XKM;

struct xkmFileInfo {
	CARD8 type;
	CARD8 min_kc;
	CARD8 max_kc;
	CARD8 num_toc;
	CARD16 present;
	CARD16 pad;
}
enum	sz_xkmFileInfo =	8;

struct xkmSectionInfo {
	CARD16 type;
	CARD16 format;
	CARD16 size;
	CARD16 offset;
}
enum	sz_xkmSectionInfo =	8;

struct xkmKeyTypeDesc {
	CARD8 realMods;
	CARD8 numLevels;
	CARD16 virtualMods;
	CARD8 nMapEntries;
	CARD8 nLevelNames;
	CARD8 preserve;
	CARD8 pad;
}
enum	sz_xkmKeyTypeDesc =	8;

struct xkmKTMapEntryDesc {
	CARD8 level;
	CARD8 realMods;
	CARD16 virtualMods;
}
enum	sz_xkmKTMapEntryDesc =	4;

struct xkmModsDesc {
	CARD8 realMods;
	CARD8 pad;
	CARD16 virtualMods;
}
enum	sz_xkmModsDesc =	4;

struct xkmVModMapDesc {
	CARD8 key;
	CARD8 pad;
	CARD16 vmods;
}
enum	sz_xkmVModMapDesc =	4;

struct xkmSymInterpretDesc {
	CARD32 sym;
	CARD8 mods;
	CARD8 match;
	CARD8 virtualMod;
	CARD8 flags;
	CARD8 actionType;
	CARD8[7] actionData;
}
enum	sz_xkmSymInterpretDesc =	16;

struct xkmBehaviorDesc {
	CARD8 type;
	CARD8 data;
	CARD16 pad;
}
enum	sz_xkmBehaviorDesc =	4;

struct xkmActionDesc {
	CARD8 type;
	CARD8[7] data;
}
enum	sz_xkmActionDesc =	8;

enum	XkmKeyHasTypes =		(0x0f);
enum	XkmKeyHasGroup1Type =	(1<<0);
enum	XkmKeyHasGroup2Type =	(1<<1);
enum	XkmKeyHasGroup3Type =	(1<<2);
enum	XkmKeyHasGroup4Type =	(1<<3);
enum	XkmKeyHasActions =	(1<<4);
enum	XkmKeyHasBehavior =	(1<<5);
enum	XkmRepeatingKey =		(1<<6);
enum	XkmNonRepeatingKey =	(1<<7);

struct xkmKeySymMapDesc {
	CARD8 width;
	CARD8 num_groups;
	CARD8 modifier_map;
	CARD8 flags;
}
enum sz_xkmKeySymMapDesc =	4;

struct xkmIndicatorMapDesc {
	CARD8 indicator;
	CARD8 flags;
	CARD8 which_mods;
	CARD8 real_mods;
	CARD16 vmods;
	CARD8 which_groups;
	CARD8 groups;
	CARD32 ctrls;
}
enum sz_xkmIndicatorMapDesc =	12;

struct xkmGeometryDesc {
	CARD16 width_mm;
	CARD16 height_mm;
	CARD8 base_color_ndx;
	CARD8 label_color_ndx;
	CARD16 num_properties;
	CARD16 num_colors;
	CARD16 num_shapes;
	CARD16 num_sections;
	CARD16 num_doodads;
	CARD16 num_key_aliases;
	CARD16 pad1;
}
enum	sz_xkmGeometryDesc =	20;

struct xkmPointDesc {
	INT16 x;
	INT16 y;
}
enum	sz_xkmPointDesc =		4;

struct xkmOutlineDesc {
	CARD8 num_points;
	CARD8 corner_radius;
	CARD16 pad;
}
enum	sz_xkmOutlineDesc =	4;

struct xkmShapeDesc {
	CARD8 num_outlines;
	CARD8 primary_ndx;
	CARD8 approx_ndx;
	CARD8 pad;
}
enum	sz_xkmShapeDesc =	4;

struct xkmSectionDesc {
	INT16 top;
	INT16 left;
	CARD16 width;
	CARD16 height;
	INT16 angle;
	CARD8 priority;
	CARD8 num_rows;
	CARD8 num_doodads;
	CARD8 num_overlays;
	CARD16 pad2;
}
enum	sz_xkmSectionDesc =	16;

struct xkmRowDesc {
	INT16 top;
	INT16 left;
	CARD8 num_keys;
	BOOL vertical;
	CARD16 pad;
}
enum	sz_xkmRowDesc =		8;

struct xkmKeyDesc {
	CARD8[XkbKeyNameLength] name;
	INT16 gap;
	CARD8 shape_ndx;
	CARD8 color_ndx;
}
enum	sz_xkmKeyDesc =		8;

struct xkmOverlayDesc {
	CARD8 num_rows;
	CARD8 pad1;
	CARD16 pad2;
}
enum	sz_xkmOverlayDesc =	4;

struct xkmOverlayRowDesc {
	CARD8 row_under;
	CARD8 num_keys;
	CARD16 pad;
}
enum	sz_xkmOverlayRowDesc =	4;

struct xkmOverlayKeyDesc {
	char[XkbKeyNameLength] over = 0;
	char[XkbKeyNameLength] under = 0;
}
enum sz_xkmOverlayKeyDesc =	8;

struct xkmShapeDoodadDesc {
	CARD8 type;
	CARD8 priority;
	INT16 top;
	INT16 left;
	INT16 angle;
	CARD8 color_ndx;
	CARD8 shape_ndx;
	CARD16 pad;
	CARD32 pad1;
}
enum	sz_xkmShapeDoodadDesc =	16;

struct xkmTextDoodadDesc {
	CARD8 type;
	CARD8 priority;
	INT16 top;
	INT16 left;
	INT16 angle;
	CARD16 width;
	CARD16 height;
	CARD8 color_ndx;
	CARD8 pad1;
	CARD16 pad2;
}
enum	sz_xkmTextDoodadDesc =	16;

struct xkmIndicatorDoodadDesc {
	CARD8 type;
	CARD8 priority;
	INT16 top;
	INT16 left;
	CARD8 shape_ndx;
	CARD8 on_color_ndx;
	CARD8 off_color_ndx;
	CARD8 pad1;
	CARD16 pad2;
	CARD32 pad3;
}
enum	sz_xkmIndicatorDoodadDesc =	16;

struct xkmLogoDoodadDesc {
	CARD8 type;
	CARD8 priority;
	INT16 top;
	INT16 left;
	INT16 angle;
	CARD8 color_ndx;
	CARD8 shape_ndx;
	CARD16 pad;
	CARD32 pad1;
}
enum	sz_xkmLogoDoodadDesc =	16;

struct xkmAnyDoodadDesc {
	CARD8 type;
	CARD8 priority;
	INT16 top;
	INT16 left;
	CARD16 pad1;
	CARD32 pad2;
	CARD32 pad3;
}
enum	sz_xkmAnyDoodadDesc =		16;

union xkmDoodadDesc {
	xkmAnyDoodadDesc any;
	xkmShapeDoodadDesc shape;
	xkmTextDoodadDesc text;
	xkmIndicatorDoodadDesc indicator;
	xkmLogoDoodadDesc logo;
}
enum	sz_xkmDoodadDesc =		16;

} /* _XKMFORMAT_H_ */
