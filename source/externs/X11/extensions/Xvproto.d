module externs.X11.extensions.Xvproto;
@nogc nothrow:
extern(C): __gshared:
/***********************************************************
Copyright 1991 by Digital Equipment Corporation, Maynard, Massachusetts,
and the Massachusetts Institute of Technology, Cambridge, Massachusetts.

                        All Rights Reserved

Permission to use, copy, modify, and distribute this software and its
documentation for any purpose and without fee is hereby granted,
provided that the above copyright notice appear in all copies and that
both that copyright notice and this permission notice appear in
supporting documentation, and that the names of Digital or MIT not be
used in advertising or publicity pertaining to distribution of the
software without specific, written prior permission.

DIGITAL DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING
ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT SHALL
DIGITAL BE LIABLE FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR
ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS,
WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION,
ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
SOFTWARE.

******************************************************************/

 
/*
** File:
**
**   Xvproto.h --- Xv protocol header file
**
** Author:
**
**   David Carver (Digital Workstation Engineering/Project Athena)
**
** Revisions:
**
**   11.06.91 Carver
**     - changed SetPortControl to SetPortAttribute
**     - changed GetPortControl to GetPortAttribute
**     - changed QueryBestSize
**
**   15.05.91 Carver
**     - version 2.0 upgrade
**
**   24.01.91 Carver
**     - version 1.4 upgrade
**
*/

public import externs.X11.Xmd;

/* Symbols: These are undefined at the end of this file to restore the
   values they have in Xv.h */

alias XvPortID = CARD32;
alias XvEncodingID = CARD32;
alias ShmSeg = CARD32;
alias VisualID = CARD32;
alias Drawable = CARD32;
alias GContext = CARD32;
alias Time = CARD32;
alias Atom = CARD32;

/* Structures */

struct xvRational {
  INT32 numerator;
  INT32 denominator;
}
enum sz_xvRational = 8;

struct xvAdaptorInfo {
  XvPortID base_id;
  CARD16 name_size;
  CARD16 num_ports;
  CARD16 num_formats;
  CARD8 type;
  CARD8 pad;
}
enum sz_xvAdaptorInfo = 12;

struct xvEncodingInfo {
  XvEncodingID encoding;
  CARD16 name_size;
  CARD16 width, height;
  CARD16 pad;
  xvRational rate;
}
enum sz_xvEncodingInfo = (12 + sz_xvRational);

struct xvFormat {
  VisualID visual;
  CARD8 depth;
  CARD8 pad1;
  CARD16 pad2;
}
enum sz_xvFormat = 8;

struct xvAttributeInfo {
  CARD32 flags;
  INT32 min;
  INT32 max;
  CARD32 size;
}
enum sz_xvAttributeInfo = 16;

struct xvImageFormatInfo {
  CARD32 id;
  CARD8 type;
  CARD8 byte_order;
  CARD16 pad1;
  CARD8[16] guid;
  CARD8 bpp;
  CARD8 num_planes;
  CARD16 pad2;
  CARD8 depth;
  CARD8 pad3;
  CARD16 pad4;
  CARD32 red_mask;
  CARD32 green_mask;
  CARD32 blue_mask;
  CARD8 format;
  CARD8 pad5;
  CARD16 pad6;
  CARD32 y_sample_bits;
  CARD32 u_sample_bits;
  CARD32 v_sample_bits;
  CARD32 horz_y_period;
  CARD32 horz_u_period;
  CARD32 horz_v_period;
  CARD32 vert_y_period;
  CARD32 vert_u_period;
  CARD32 vert_v_period;
  CARD8[32] comp_order;
  CARD8 scanline_order;
  CARD8 pad7;
  CARD16 pad8;
  CARD32 pad9;
  CARD32 pad10;
}
enum sz_xvImageFormatInfo = 128;


/* Requests */

enum xv_QueryExtension =                  0;
enum	xv_QueryAdaptors =                   1;
enum	xv_QueryEncodings =                  2;
enum xv_GrabPort =                        3;
enum xv_UngrabPort =                      4;
enum xv_PutVideo =                        5;
enum xv_PutStill =                        6;
enum xv_GetVideo =                        7;
enum xv_GetStill =                        8;
enum xv_StopVideo =                       9;
enum xv_SelectVideoNotify =              10;
enum xv_SelectPortNotify =               11;
enum xv_QueryBestSize =                  12;
enum xv_SetPortAttribute =               13;
enum xv_GetPortAttribute =               14;
enum xv_QueryPortAttributes =            15;
enum xv_ListImageFormats =               16;
enum xv_QueryImageAttributes =           17;
enum xv_PutImage =                       18;
enum xv_ShmPutImage =                    19;
enum xv_LastRequest =                    xv_ShmPutImage;

enum xvNumRequests =                     (xv_LastRequest + 1);

struct xvQueryExtensionReq {
  CARD8 reqType;
  CARD8 xvReqType;
  CARD16 length;
}
enum sz_xvQueryExtensionReq = 4;

struct xvQueryAdaptorsReq {
  CARD8 reqType;
  CARD8 xvReqType;
  CARD16 length;
  CARD32 window;
}
enum sz_xvQueryAdaptorsReq = 8;

struct xvQueryEncodingsReq {
  CARD8 reqType;
  CARD8 xvReqType;
  CARD16 length;
  CARD32 port;
}
enum sz_xvQueryEncodingsReq = 8;

struct xvPutVideoReq {
  CARD8 reqType;
  CARD8 xvReqType;
  CARD16 length;
  XvPortID port;
  Drawable drawable;
  GContext gc;
  INT16 vid_x;
  INT16 vid_y;
  CARD16 vid_w;
  CARD16 vid_h;
  INT16 drw_x;
  INT16 drw_y;
  CARD16 drw_w;
  CARD16 drw_h;
}
enum sz_xvPutVideoReq = 32;

struct xvPutStillReq {
  CARD8 reqType;
  CARD8 xvReqType;
  CARD16 length;
  XvPortID port;
  Drawable drawable;
  GContext gc;
  INT16 vid_x;
  INT16 vid_y;
  CARD16 vid_w;
  CARD16 vid_h;
  INT16 drw_x;
  INT16 drw_y;
  CARD16 drw_w;
  CARD16 drw_h;
}
enum sz_xvPutStillReq = 32;

struct xvGetVideoReq {
  CARD8 reqType;
  CARD8 xvReqType;
  CARD16 length;
  XvPortID port;
  Drawable drawable;
  GContext gc;
  INT16 vid_x;
  INT16 vid_y;
  CARD16 vid_w;
  CARD16 vid_h;
  INT16 drw_x;
  INT16 drw_y;
  CARD16 drw_w;
  CARD16 drw_h;
}
enum sz_xvGetVideoReq = 32;

struct xvGetStillReq {
  CARD8 reqType;
  CARD8 xvReqType;
  CARD16 length;
  XvPortID port;
  Drawable drawable;
  GContext gc;
  INT16 vid_x;
  INT16 vid_y;
  CARD16 vid_w;
  CARD16 vid_h;
  INT16 drw_x;
  INT16 drw_y;
  CARD16 drw_w;
  CARD16 drw_h;
}
enum sz_xvGetStillReq = 32;

struct xvGrabPortReq {
  CARD8 reqType;
  CARD8 xvReqType;
  CARD16 length;
  XvPortID port;
  Time time;
}
enum sz_xvGrabPortReq = 12;

struct xvUngrabPortReq {
  CARD8 reqType;
  CARD8 xvReqType;
  CARD16 length;
  XvPortID port;
  Time time;
}
enum sz_xvUngrabPortReq = 12;

struct xvSelectVideoNotifyReq {
  CARD8 reqType;
  CARD8 xvReqType;
  CARD16 length;
  Drawable drawable;
  BOOL onoff;
  CARD8 pad1;
  CARD16 pad2;
}
enum sz_xvSelectVideoNotifyReq = 12;

struct xvSelectPortNotifyReq {
  CARD8 reqType;
  CARD8 xvReqType;
  CARD16 length;
  XvPortID port;
  BOOL onoff;
  CARD8 pad1;
  CARD16 pad2;
}
enum sz_xvSelectPortNotifyReq = 12;

struct xvStopVideoReq {
  CARD8 reqType;
  CARD8 xvReqType;
  CARD16 length;
  XvPortID port;
  Drawable drawable;
}
enum sz_xvStopVideoReq = 12;

struct xvSetPortAttributeReq {
  CARD8 reqType;
  CARD8 xvReqType;
  CARD16 length;
  XvPortID port;
  Atom attribute;
  INT32 value;
}
enum sz_xvSetPortAttributeReq = 16;

struct xvGetPortAttributeReq {
  CARD8 reqType;
  CARD8 xvReqType;
  CARD16 length;
  XvPortID port;
  Atom attribute;
}
enum sz_xvGetPortAttributeReq = 12;

struct xvQueryBestSizeReq {
  CARD8 reqType;
  CARD8 xvReqType;
  CARD16 length;
  XvPortID port;
  CARD16 vid_w;
  CARD16 vid_h;
  CARD16 drw_w;
  CARD16 drw_h;
  CARD8 motion;
  CARD8 pad1;
  CARD16 pad2;
}
enum sz_xvQueryBestSizeReq = 20;

struct xvQueryPortAttributesReq {
  CARD8 reqType;
  CARD8 xvReqType;
  CARD16 length;
  XvPortID port;
}
enum sz_xvQueryPortAttributesReq = 8;

struct xvPutImageReq {
  CARD8 reqType;
  CARD8 xvReqType;
  CARD16 length;
  XvPortID port;
  Drawable drawable;
  GContext gc;
  CARD32 id;
  INT16 src_x;
  INT16 src_y;
  CARD16 src_w;
  CARD16 src_h;
  INT16 drw_x;
  INT16 drw_y;
  CARD16 drw_w;
  CARD16 drw_h;
  CARD16 width;
  CARD16 height;
}
enum sz_xvPutImageReq = 40;

struct xvShmPutImageReq {
  CARD8 reqType;
  CARD8 xvReqType;
  CARD16 length;
  XvPortID port;
  Drawable drawable;
  GContext gc;
  ShmSeg shmseg;
  CARD32 id;
  CARD32 offset;
  INT16 src_x;
  INT16 src_y;
  CARD16 src_w;
  CARD16 src_h;
  INT16 drw_x;
  INT16 drw_y;
  CARD16 drw_w;
  CARD16 drw_h;
  CARD16 width;
  CARD16 height;
  CARD8 send_event;
  CARD8 pad1;
  CARD16 pad2;
}
enum sz_xvShmPutImageReq = 52;

struct xvListImageFormatsReq {
  CARD8 reqType;
  CARD8 xvReqType;
  CARD16 length;
  XvPortID port;
}
enum sz_xvListImageFormatsReq = 8;

struct xvQueryImageAttributesReq {
  CARD8 reqType;
  CARD8 xvReqType;
  CARD16 length;
  CARD32 port;
  CARD32 id;
  CARD16 width;
  CARD16 height;
}
enum sz_xvQueryImageAttributesReq = 16;


/* Replies */

struct xvQueryExtensionReply {
  BYTE type;   /* X_Reply */
  CARD8 padb1;
  CARD16 sequenceNumber;
  CARD32 length;
  CARD16 version_;
  CARD16 revision;
  CARD32 padl4;
  CARD32 padl5;
  CARD32 padl6;
  CARD32 padl7;
  CARD32 padl8;
}
enum sz_xvQueryExtensionReply = 32;

struct xvQueryAdaptorsReply {
  BYTE type;   /* X_Reply */
  CARD8 padb1;
  CARD16 sequenceNumber;
  CARD32 length;
  CARD16 num_adaptors;
  CARD16 pads3;
  CARD32 padl4;
  CARD32 padl5;
  CARD32 padl6;
  CARD32 padl7;
  CARD32 padl8;
}
enum sz_xvQueryAdaptorsReply = 32;

struct xvQueryEncodingsReply {
  BYTE type;   /* X_Reply */
  CARD8 padb1;
  CARD16 sequenceNumber;
  CARD32 length;
  CARD16 num_encodings;
  CARD16 padl3;
  CARD32 padl4;
  CARD32 padl5;
  CARD32 padl6;
  CARD32 padl7;
  CARD32 padl8;
}
enum sz_xvQueryEncodingsReply = 32;

struct xvGrabPortReply {
  BYTE type;  /* X_Reply */
  BYTE result;
  CARD16 sequenceNumber;
  CARD32 length;  /* 0 */
  CARD32 padl3;
  CARD32 padl4;
  CARD32 padl5;
  CARD32 padl6;
  CARD32 padl7;
  CARD32 padl8;
}
enum sz_xvGrabPortReply = 32;

struct xvGetPortAttributeReply {
  BYTE type;  /* X_Reply */
  BYTE padb1;
  CARD16 sequenceNumber;
  CARD32 length;  /* 0 */
  INT32 value;
  CARD32 padl4;
  CARD32 padl5;
  CARD32 padl6;
  CARD32 padl7;
  CARD32 padl8;
}
enum sz_xvGetPortAttributeReply = 32;

struct xvQueryBestSizeReply {
  BYTE type;  /* X_Reply */
  BYTE padb1;
  CARD16 sequenceNumber;
  CARD32 length;  /* 0 */
  CARD16 actual_width;
  CARD16 actual_height;
  CARD32 padl4;
  CARD32 padl5;
  CARD32 padl6;
  CARD32 padl7;
  CARD32 padl8;
}
enum sz_xvQueryBestSizeReply = 32;

struct xvQueryPortAttributesReply {
  BYTE type;  /* X_Reply */
  BYTE padb1;
  CARD16 sequenceNumber;
  CARD32 length;  /* 0 */
  CARD32 num_attributes;
  CARD32 text_size;
  CARD32 padl5;
  CARD32 padl6;
  CARD32 padl7;
  CARD32 padl8;
}
enum sz_xvQueryPortAttributesReply = 32;

struct xvListImageFormatsReply {
  BYTE type;  /* X_Reply */
  BYTE padb1;
  CARD16 sequenceNumber;
  CARD32 length;
  CARD32 num_formats;
  CARD32 padl4;
  CARD32 padl5;
  CARD32 padl6;
  CARD32 padl7;
  CARD32 padl8;
}
enum sz_xvListImageFormatsReply = 32;

struct xvQueryImageAttributesReply {
  BYTE type;  /* X_Reply */
  BYTE padb1;
  CARD16 sequenceNumber;
  CARD32 length;
  CARD32 num_planes;
  CARD32 data_size;
  CARD16 width;
  CARD16 height;
  CARD32 padl6;
  CARD32 padl7;
  CARD32 padl8;
}
enum sz_xvQueryImageAttributesReply = 32;

/* DEFINE EVENT STRUCTURE */

struct xvEvent {
  union _U {
    struct _U {
      BYTE type;
      BYTE detail;
      CARD16 sequenceNumber;
    }_U u;
    struct _VideoNotify {
      BYTE type;
      BYTE reason;
      CARD16 sequenceNumber;
      Time time;
      Drawable drawable;
      XvPortID port;
      CARD32 padl5;
      CARD32 padl6;
      CARD32 padl7;
      CARD32 padl8;
    }_VideoNotify videoNotify;
    struct _PortNotify {
      BYTE type;
      BYTE padb1;
      CARD16 sequenceNumber;
      Time time;
      XvPortID port;
      Atom attribute;
      INT32 value;
      CARD32 padl6;
      CARD32 padl7;
      CARD32 padl8;
    }_PortNotify portNotify;
  }_U u;
}

 /* XVPROTO_H */

