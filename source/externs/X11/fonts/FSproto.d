module externs.X11.fonts.FSproto;
@nogc nothrow:
extern(C): __gshared:
/*

Copyright 1990, 1991, 1998  The Open Group

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

 * Copyright 1990, 1991 Network Computing Devices;
 * Portions Copyright 1987 by Digital Equipment Corporation
 *
 * Permission to use, copy, modify, distribute, and sell this software and
 * its documentation for any purpose is hereby granted without fee, provided
 * that the above copyright notice appear in all copies and that both that
 * copyright notice and this permission notice appear in supporting
 * documentation, and that the names of Network Computing Devices, or Digital
 * not be used in advertising or publicity pertaining to distribution
 * of the software without specific, written prior permission.
 *
 * NETWORK COMPUTING DEVICES, AND DIGITAL DISCLAIM ALL WARRANTIES WITH
 * REGARD TO THIS SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS, IN NO EVENT SHALL NETWORK COMPUTING DEVICES,
 * OR DIGITAL BE LIABLE FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL
 * DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR
 * PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS
 * ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF
 * THIS SOFTWARE.
 */

 
public import externs.X11.fonts.FS;

enum sz_fsPropOffset = 20;
enum sz_fsPropInfo = 8;
enum sz_fsResolution = 6;

enum sz_fsChar2b = 2;
enum sz_fsChar2b_version1 = 2;
enum sz_fsOffset32 = 8;
enum sz_fsRange =		4;

enum	sz_fsXCharInfo =		12;
enum	sz_fsXFontInfoHeader =		40;

enum	sz_fsConnClientPrefix =	8;
enum	sz_fsConnSetup =		12;
enum	sz_fsConnSetupExtra =	8;
enum	sz_fsConnSetupAccept =	12;

/* request sizes */
enum	sz_fsReq =		4;
enum	sz_fsListExtensionsReq =	4;
enum	sz_fsResourceReq =	8;

enum	sz_fsNoopReq =			4;
enum	sz_fsListExtensionReq =		4;
enum	sz_fsQueryExtensionReq =		4;
enum	sz_fsListCataloguesReq =		12;
enum	sz_fsSetCataloguesReq =		4;
enum	sz_fsGetCataloguesReq =		4;
enum	sz_fsSetEventMaskReq =		8;
enum	sz_fsGetEventMaskReq =		4;
enum	sz_fsCreateACReq =		8;
enum	sz_fsFreeACReq =			8;
enum	sz_fsSetAuthorizationReq =	8;
enum	sz_fsSetResolutionReq =		4;
enum	sz_fsGetResolutionReq =		4;
enum	sz_fsListFontsReq =		12;
enum	sz_fsListFontsWithXInfoReq =	12;
enum	sz_fsOpenBitmapFontReq =		16;
enum	sz_fsQueryXInfoReq =		8;
enum	sz_fsQueryXExtents8Req =		12;
enum	sz_fsQueryXExtents16Req =		12;
enum	sz_fsQueryXBitmaps8Req =		16;
enum	sz_fsQueryXBitmaps16Req =		16;
enum	sz_fsCloseReq =			8;

/* reply sizes */
enum	sz_fsReply =			8;
enum	sz_fsGenericReply =		8;

enum	sz_fsListExtensionsReply =	8;
enum	sz_fsQueryExtensionReply =	20;
enum	sz_fsListCataloguesReply =	16;
enum	sz_fsGetCataloguesReply =		8;
enum	sz_fsGetEventMaskReply =		12;
enum	sz_fsCreateACReply =		12;
enum	sz_fsGetResolutionReply =		8;
enum	sz_fsListFontsReply =		16;
enum	sz_fsListFontsWithXInfoReply =	(12 + sz_fsXFontInfoHeader);
enum	sz_fsOpenBitmapFontReply =	16;
enum	sz_fsQueryXInfoReply =		(8 + sz_fsXFontInfoHeader);
enum	sz_fsQueryXExtents8Reply =	12;
enum	sz_fsQueryXExtents16Reply =	12;
enum	sz_fsQueryXBitmaps8Reply =	20;
enum	sz_fsQueryXBitmaps16Reply =	20;

enum	sz_fsError =		16;
enum	sz_fsEvent =		12;
enum sz_fsKeepAliveEvent = 	12;

enum	fsTrue =	1;
enum	fsFalse =	0;

/* temp decls */
alias Mask =		CARD32;
alias Font =		CARD32;
alias AccContext =	CARD32;

alias fsTimestamp = CARD32;

version (NOTDEF) { /* in fsmasks.h */
alias fsBitmapFormat = CARD32;
alias fsBitmapFormatMask = CARD32;
}

enum sz_fsBitmapFormat =	4;

struct fsXCharInfo {
    INT16 left, right;
    INT16 width;
    INT16 ascent, descent;
    CARD16 attributes;
}

struct fsChar2b {
    CARD8 high;
    CARD8 low;
}

struct fsChar2b_version1 {
    CARD8 low;
    CARD8 high;
}

struct fsRange {
    CARD8 min_char_high;
    CARD8 min_char_low;
    CARD8 max_char_high;
    CARD8 max_char_low;
}

struct fsOffset32 {
    CARD32 position;
    CARD32 length;
}

struct fsPropOffset {
    fsOffset32 name;
    fsOffset32 value;
    CARD8 type;
    BYTE pad0;
    CARD16 pad1;
}

struct fsPropInfo {
    CARD32 num_offsets;
    CARD32 data_len;
    /* offsets */
    /* data */
}

struct fsResolution {
    CARD16 x_resolution;
    CARD16 y_resolution;
    CARD16 point_size;
}


struct fsXFontInfoHeader {
    CARD32 flags;
    CARD8 char_range_min_char_high;
    CARD8 char_range_min_char_low;
    CARD8 char_range_max_char_high;
    CARD8 char_range_max_char_low;

    CARD8 draw_direction;
    CARD8 pad;
    CARD8 default_char_high;
    CARD8 default_char_low;
    INT16 min_bounds_left;
    INT16 min_bounds_right;

    INT16 min_bounds_width;
    INT16 min_bounds_ascent;
    INT16 min_bounds_descent;
    CARD16 min_bounds_attributes;

    INT16 max_bounds_left;
    INT16 max_bounds_right;
    INT16 max_bounds_width;
    INT16 max_bounds_ascent;

    INT16 max_bounds_descent;
    CARD16 max_bounds_attributes;
    INT16 font_ascent;
    INT16 font_descent;
    /* propinfo */
}


/* requests */

struct fsConnClientPrefix {
    BYTE byteOrder;
    CARD8 num_auths;
    CARD16 major_version;
    CARD16 minor_version;
    CARD16 auth_len;
    /* auth data */
}

struct fsConnSetup {
    CARD16 status;
    CARD16 major_version;
    CARD16 minor_version;
    CARD8 num_alternates;
    CARD8 auth_index;
    CARD16 alternate_len;
    CARD16 auth_len;
    /* alternates */
    /* auth data */
}

struct fsConnSetupExtra {
    CARD32 length;
    CARD16 status;
    CARD16 pad;
    /* more auth data */
}

struct fsConnSetupAccept {
    CARD32 length;
    CARD16 max_request_len;
    CARD16 vendor_len;
    CARD32 release_number;
    /* vendor string */
}

struct fsReq {
    CARD8 reqType;
    CARD8 data;
    CARD16 length;
}

/*
 * The fsFakeReq structure is never used in the protocol; it is prepended
 * to incoming packets when setting up a connection so we can index
 * through InitialVector.  To avoid alignment problems, it is padded
 * to the size of a word on the largest machine this code runs on.
 * Hence no sz_fsFakeReq constant is necessary.
 */
struct fsFakeReq {
    CARD8 reqType;
    CARD8 data;
    CARD16 length;
    CARD32 pad;		/* to fill out to multiple of 64 bits */
}

struct fsResourceReq {
    CARD8 reqType;
    BYTE pad;
    CARD16 length;
    Font id;
}

alias fsNoopReq = fsReq;
alias fsListExtensionsReq = fsReq;

struct fsQueryExtensionReq {
    CARD8 reqType;
    BYTE nbytes;
    CARD16 length;
    /* name */
}

struct fsListCataloguesReq {
    CARD8 reqType;
    CARD8 data;
    CARD16 length;
    CARD32 maxNames;
    CARD16 nbytes;
    CARD16 pad2;
    /* pattern */
}

struct fsSetCataloguesReq {
    CARD8 reqType;
    BYTE num_catalogues;
    CARD16 length;
    /* catalogues */
}

alias fsGetCataloguesReq = fsReq;

struct fsSetEventMaskReq {
    CARD8 reqType;
    CARD8 ext_opcode;
    CARD16 length;
    Mask event_mask;
}

struct fsGetEventMaskReq {
    CARD8 reqType;
    CARD8 ext_opcode;
    CARD16 length;
}

struct fsCreateACReq {
    CARD8 reqType;
    BYTE num_auths;
    CARD16 length;
    AccContext acid;
    /* auth protocols */
}

alias fsFreeACReq = fsResourceReq;
alias fsSetAuthorizationReq = fsResourceReq;

struct fsSetResolutionReq {
    CARD8 reqType;
    BYTE num_resolutions;
    CARD16 length;
    /* resolutions */
}

alias fsGetResolutionReq = fsReq;

struct fsListFontsReq {
    CARD8 reqType;
    BYTE pad;
    CARD16 length;
    CARD32 maxNames;
    CARD16 nbytes;
    CARD16 pad2;
    /* pattern */
}

alias fsListFontsWithXInfoReq = fsListFontsReq;

struct fsOpenBitmapFontReq {
    CARD8 reqType;
    BYTE pad;
    CARD16 length;
    Font fid;
    fsBitmapFormatMask format_mask;
    fsBitmapFormat format_hint;
    /* pattern */
}

alias fsQueryXInfoReq = fsResourceReq;

struct fsQueryXExtents8Req {
    CARD8 reqType;
    BOOL range;
    CARD16 length;
    Font fid;
    CARD32 num_ranges;
    /* list of chars */
}

alias fsQueryXExtents16Req = fsQueryXExtents8Req;

struct fsQueryXBitmaps8Req {
    CARD8 reqType;
    BOOL range;
    CARD16 length;
    Font fid;
    fsBitmapFormat format;
    CARD32 num_ranges;
    /* list of chars */
}

alias fsQueryXBitmaps16Req = fsQueryXBitmaps8Req;

alias fsCloseReq = fsResourceReq;


/* replies */
struct fsGenericReply {
    BYTE type;
    BYTE data1;
    CARD16 sequenceNumber;
    CARD32 length;
}

struct fsListExtensionsReply {
    BYTE type;
    CARD8 nExtensions;
    CARD16 sequenceNumber;
    CARD32 length;
    /* extension names */
}

struct fsQueryExtensionReply {
    BYTE type;
    CARD8 present;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD16 major_version;
    CARD16 minor_version;
    CARD8 major_opcode;
    CARD8 first_event;
    CARD8 num_events;
    CARD8 first_error;
    CARD8 num_errors;
    CARD8 pad1;
    CARD16 pad2;
}

struct fsListCataloguesReply {
    BYTE type;
    BYTE pad;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 num_replies;
    CARD32 num_catalogues;
    /* catalog names */
}

struct fsGetCataloguesReply {
    BYTE type;
    CARD8 num_catalogues;
    CARD16 sequenceNumber;
    CARD32 length;
    /* catalogue names */
}

struct fsGetEventMaskReply {
    BYTE type;
    BYTE pad1;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 event_mask;
}

struct fsCreateACReply {
    BYTE type;
    CARD8 auth_index;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD16 status;
    CARD16 pad;
    /* auth data */
}

struct fsCreateACExtraReply {
    CARD32 length;
    CARD16 status;
    CARD16 pad;
    /* auth data */
}

struct fsGetResolutionReply {
    BYTE type;
    CARD8 num_resolutions;
    CARD16 sequenceNumber;
    CARD32 length;
    /* resolutions */
}

struct fsListFontsReply {
    BYTE type;
    BYTE pad1;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 following;
    CARD32 nFonts;
    /* font names */
}

/*
 * this one is messy.  the reply itself is variable length (unknown
 * number of replies) and the contents of each is variable (unknown
 * number of properties)
 *
 */

struct fsListFontsWithXInfoReply {
    BYTE type;
    CARD8 nameLength;	/* 0 is end-of-reply */
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 nReplies;
    CARD32 font_header_flags;
    CARD8 font_hdr_char_range_min_char_high;
    CARD8 font_hdr_char_range_min_char_low;
    CARD8 font_hdr_char_range_max_char_high;
    CARD8 font_hdr_char_range_max_char_low;
    CARD8 font_header_draw_direction;
    CARD8 font_header_pad;
    CARD8 font_header_default_char_high;
    CARD8 font_header_default_char_low;
    INT16 font_header_min_bounds_left;
    INT16 font_header_min_bounds_right;
    INT16 font_header_min_bounds_width;
    INT16 font_header_min_bounds_ascent;
    INT16 font_header_min_bounds_descent;
    CARD16 font_header_min_bounds_attributes;
    INT16 font_header_max_bounds_left;
    INT16 font_header_max_bounds_right;
    INT16 font_header_max_bounds_width;
    INT16 font_header_max_bounds_ascent;
    INT16 font_header_max_bounds_descent;
    CARD16 font_header_max_bounds_attributes;
    INT16 font_header_font_ascent;
    INT16 font_header_font_descent;
    /* propinfo */
    /* name */
}

struct fsOpenBitmapFontReply {
    BYTE type;
    CARD8 otherid_valid;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 otherid;
    BYTE cachable;
    BYTE pad1;
    CARD16 pad2;
}

struct fsQueryXInfoReply {
    BYTE type;
    CARD8 pad0;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 font_header_flags;
    CARD8 font_hdr_char_range_min_char_high;
    CARD8 font_hdr_char_range_min_char_low;
    CARD8 font_hdr_char_range_max_char_high;
    CARD8 font_hdr_char_range_max_char_low;
    CARD8 font_header_draw_direction;
    CARD8 font_header_pad;
    CARD8 font_header_default_char_high;
    CARD8 font_header_default_char_low;
    INT16 font_header_min_bounds_left;
    INT16 font_header_min_bounds_right;
    INT16 font_header_min_bounds_width;
    INT16 font_header_min_bounds_ascent;
    INT16 font_header_min_bounds_descent;
    CARD16 font_header_min_bounds_attributes;
    INT16 font_header_max_bounds_left;
    INT16 font_header_max_bounds_right;
    INT16 font_header_max_bounds_width;
    INT16 font_header_max_bounds_ascent;
    INT16 font_header_max_bounds_descent;
    CARD16 font_header_max_bounds_attributes;
    INT16 font_header_font_ascent;
    INT16 font_header_font_descent;
    /* propinfo */
}

struct fsQueryXExtents8Reply {
    BYTE type;
    CARD8 pad0;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 num_extents;
    /* extents */
}

alias fsQueryXExtents16Reply = fsQueryXExtents8Reply;

struct fsQueryXBitmaps8Reply {
    BYTE type;
    CARD8 pad0;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 replies_hint;
    CARD32 num_chars;
    CARD32 nbytes;
    /* offsets */
    /* glyphs */
}

alias fsQueryXBitmaps16Reply = fsQueryXBitmaps8Reply;

union fsReply {
    fsGenericReply generic;
    fsListExtensionsReply extensions;
    fsGetResolutionReply getres;
}

/* errors */
struct fsError {
    BYTE type;
    BYTE request;
    CARD16 sequenceNumber;
    CARD32 length;
    fsTimestamp timestamp;
    CARD8 major_opcode;
    CARD8 minor_opcode;
    CARD16 pad;
}

struct fsRequestError {
    BYTE type;
    BYTE request;
    CARD16 sequenceNumber;
    CARD32 length;
    fsTimestamp timestamp;
    CARD8 major_opcode;
    CARD8 minor_opcode;
    CARD16 pad;
}

struct fsFormatError {
    BYTE type;
    BYTE request;
    CARD16 sequenceNumber;
    CARD32 length;
    fsTimestamp timestamp;
    CARD8 major_opcode;
    CARD8 minor_opcode;
    CARD16 pad;
    fsBitmapFormat format;
}

struct fsFontError {
    BYTE type;
    BYTE request;
    CARD16 sequenceNumber;
    CARD32 length;
    fsTimestamp timestamp;
    CARD8 major_opcode;
    CARD8 minor_opcode;
    CARD16 pad;
    Font fontid;
}

struct fsRangeError {
    BYTE type;
    BYTE request;
    CARD16 sequenceNumber;
    CARD32 length;
    fsTimestamp timestamp;
    CARD8 major_opcode;
    CARD8 minor_opcode;
    CARD16 pad;
    fsRange range;
}

struct fsEventMaskError {
    BYTE type;
    BYTE request;
    CARD16 sequenceNumber;
    CARD32 length;
    fsTimestamp timestamp;
    CARD8 major_opcode;
    CARD8 minor_opcode;
    CARD16 pad;
    Mask event_mask;
}

struct fsAccessContextError {
    BYTE type;
    BYTE request;
    CARD16 sequenceNumber;
    CARD32 length;
    fsTimestamp timestamp;
    CARD8 major_opcode;
    CARD8 minor_opcode;
    CARD16 pad;
    AccContext acid;
}

struct fsIDChoiceError {
    BYTE type;
    BYTE request;
    CARD16 sequenceNumber;
    CARD32 length;
    fsTimestamp timestamp;
    CARD8 major_opcode;
    CARD8 minor_opcode;
    CARD16 pad;
    Font fontid;
}

struct fsNameError {
    BYTE type;
    BYTE request;
    CARD16 sequenceNumber;
    CARD32 length;
    fsTimestamp timestamp;
    CARD8 major_opcode;
    CARD8 minor_opcode;
    CARD16 pad;
}

struct fsResolutionError {
    BYTE type;
    BYTE request;
    CARD16 sequenceNumber;
    CARD32 length;
    fsTimestamp timestamp;
    CARD8 major_opcode;
    CARD8 minor_opcode;
    fsResolution resolution;
}

struct fsAllocError {
    BYTE type;
    BYTE request;
    CARD16 sequenceNumber;
    CARD32 length;
    fsTimestamp timestamp;
    CARD8 major_opcode;
    CARD8 minor_opcode;
    CARD16 pad;
}

struct fsLengthError {
    BYTE type;
    BYTE request;
    CARD16 sequenceNumber;
    CARD32 length;
    fsTimestamp timestamp;
    CARD8 major_opcode;
    CARD8 minor_opcode;
    CARD16 pad;
    CARD32 bad_length;
}

struct fsImplementationError {
    BYTE type;
    BYTE request;
    CARD16 sequenceNumber;
    CARD32 length;
    fsTimestamp timestamp;
    CARD8 major_opcode;
    CARD8 minor_opcode;
    CARD16 pad;
}

/* events */
struct fsKeepAliveEvent {
    BYTE type;
    BYTE event_code;
    CARD16 sequenceNumber;
    CARD32 length;
    fsTimestamp timestamp;
}

struct fsCatalogueChangeNotifyEvent {
    BYTE type;
    BYTE event_code;
    CARD16 sequenceNumber;
    CARD32 length;
    fsTimestamp timestamp;
    BOOL added;
    BOOL deleted;
    CARD16 pad;
}

alias fsFontChangeNotifyEvent = fsCatalogueChangeNotifyEvent;

alias fsEvent = fsCatalogueChangeNotifyEvent;

/* reply codes */
enum	FS_Reply =		0	/* normal reply */;
enum	FS_Error =		1	/* error */;
enum	FS_Event =		2;

/* request codes */
enum		FS_Noop =			0;
enum		FS_ListExtensions =	1;
enum		FS_QueryExtension =	2;
enum		FS_ListCatalogues =	3;
enum		FS_SetCatalogues =	4;
enum		FS_GetCatalogues =	5;
enum		FS_SetEventMask =		6;
enum		FS_GetEventMask =		7;
enum		FS_CreateAC =		8;
enum		FS_FreeAC =		9;
enum		FS_SetAuthorization =	10;
enum		FS_SetResolution =	11;
enum		FS_GetResolution =	12;
enum		FS_ListFonts =		13;
enum		FS_ListFontsWithXInfo =	14;
enum		FS_OpenBitmapFont =	15;
enum		FS_QueryXInfo =		16;
enum		FS_QueryXExtents8 =	17;
enum		FS_QueryXExtents16 =	18;
enum		FS_QueryXBitmaps8 =	19;
enum		FS_QueryXBitmaps16 =	20;
enum		FS_CloseFont =		21;

/* restore decls */
				/* _FS_PROTO_H_ */
