module externs.X11.extensions.XResproto;
@nogc nothrow:
extern(C): __gshared:
/*
   Copyright (c) 2002  XFree86 Inc
*/

 
enum XRES_MAJOR_VERSION = 1;
enum XRES_MINOR_VERSION = 2;

enum XRES_NAME = "X-Resource";

public import externs.X11.Xmd;

/* v1.0 */
enum X_XResQueryVersion =            0;
enum X_XResQueryClients =            1;
enum X_XResQueryClientResources =    2;
enum X_XResQueryClientPixmapBytes =  3;

/* Version 1.1 has been accidentally released from the version           */
/* control and while it doesn't have differences to version 1.0, the     */
/* next version is labeled 1.2 in order to remove the risk of confusion. */

/* v1.2 */
enum X_XResQueryClientIds =          4;
enum X_XResQueryResourceBytes =      5;

struct xXResClient {
   CARD32 resource_base;
   CARD32 resource_mask;
}
enum sz_xXResClient = 8;

struct xXResType {
   CARD32 resource_type;
   CARD32 count;
}
enum sz_xXResType = 8;

/* XResQueryVersion */

struct xXResQueryVersionReq {
   CARD8 reqType;
   CARD8 XResReqType;
   CARD16 length;
   CARD8 client_major;
   CARD8 client_minor;
   CARD16 unused;
}
enum sz_xXResQueryVersionReq = 8;

struct xXResQueryVersionReply {
   CARD8 type;
   CARD8 pad1;
   CARD16 sequenceNumber;
   CARD32 length;
   CARD16 server_major;
   CARD16 server_minor;
   CARD32 pad2;
   CARD32 pad3;
   CARD32 pad4;
   CARD32 pad5;
   CARD32 pad6;
}
enum sz_xXResQueryVersionReply =  32;

/* XResQueryClients */

struct xXResQueryClientsReq {
   CARD8 reqType;
   CARD8 XResReqType;
   CARD16 length;
}
enum sz_xXResQueryClientsReq = 4;

struct xXResQueryClientsReply {
   CARD8 type;
   CARD8 pad1;
   CARD16 sequenceNumber;
   CARD32 length;
   CARD32 num_clients;
   CARD32 pad2;
   CARD32 pad3;
   CARD32 pad4;
   CARD32 pad5;
   CARD32 pad6;
}
enum sz_xXResQueryClientsReply =  32;

/* XResQueryClientResources */

struct xXResQueryClientResourcesReq {
   CARD8 reqType;
   CARD8 XResReqType;
   CARD16 length;
   CARD32 xid;
}
enum sz_xXResQueryClientResourcesReq = 8;

struct xXResQueryClientResourcesReply {
   CARD8 type;
   CARD8 pad1;
   CARD16 sequenceNumber;
   CARD32 length;
   CARD32 num_types;
   CARD32 pad2;
   CARD32 pad3;
   CARD32 pad4;
   CARD32 pad5;
   CARD32 pad6;
}
enum sz_xXResQueryClientResourcesReply =  32;

/* XResQueryClientPixmapBytes */

struct xXResQueryClientPixmapBytesReq {
   CARD8 reqType;
   CARD8 XResReqType;
   CARD16 length;
   CARD32 xid;
}
enum sz_xXResQueryClientPixmapBytesReq = 8;

struct xXResQueryClientPixmapBytesReply {
   CARD8 type;
   CARD8 pad1;
   CARD16 sequenceNumber;
   CARD32 length;
   CARD32 bytes;
   CARD32 bytes_overflow;
   CARD32 pad2;
   CARD32 pad3;
   CARD32 pad4;
   CARD32 pad5;
}
enum sz_xXResQueryClientPixmapBytesReply =  32;

/* v1.2 XResQueryClientIds */

enum X_XResClientXIDMask =      0x01;
enum X_XResLocalClientPIDMask = 0x02;

struct xXResClientIdSpec {
   CARD32 client;
   CARD32 mask;
}
enum sz_xXResClientIdSpec = 8;

struct xXResClientIdValue {
   xXResClientIdSpec spec;
   CARD32 length;
   // followed by length CARD32s
}
enum sz_xResClientIdValue = (sz_xXResClientIdSpec + 4);

struct xXResQueryClientIdsReq {
   CARD8 reqType;
   CARD8 XResReqType;
   CARD16 length;
   CARD32 numSpecs;
   // followed by numSpecs times XResClientIdSpec
}
enum sz_xXResQueryClientIdsReq = 8;

struct xXResQueryClientIdsReply {
   CARD8 type;
   CARD8 pad1;
   CARD16 sequenceNumber;
   CARD32 length;
   CARD32 numIds;
   CARD32 pad2;
   CARD32 pad3;
   CARD32 pad4;
   CARD32 pad5;
   CARD32 pad6;
   // followed by numIds times XResClientIdValue
}
enum sz_xXResQueryClientIdsReply =  32;

/* v1.2 XResQueryResourceBytes */

struct xXResResourceIdSpec {
   CARD32 resource;
   CARD32 type;
}
enum sz_xXResResourceIdSpec = 8;

struct xXResQueryResourceBytesReq {
   CARD8 reqType;
   CARD8 XResReqType;
   CARD16 length;
   CARD32 client;
   CARD32 numSpecs;
   // followed by numSpecs times XResResourceIdSpec
}
enum sz_xXResQueryResourceBytesReq = 12;

struct xXResResourceSizeSpec {
   xXResResourceIdSpec spec;
   CARD32 bytes;
   CARD32 refCount;
   CARD32 useCount;
}
enum sz_xXResResourceSizeSpec = (sz_xXResResourceIdSpec + 12);

struct xXResResourceSizeValue {
   xXResResourceSizeSpec size;
   CARD32 numCrossReferences;
   // followed by numCrossReferences times XResResourceSizeSpec
}
enum sz_xXResResourceSizeValue = (sz_xXResResourceSizeSpec + 4);

struct xXResQueryResourceBytesReply {
   CARD8 type;
   CARD8 pad1;
   CARD16 sequenceNumber;
   CARD32 length;
   CARD32 numSizes;
   CARD32 pad2;
   CARD32 pad3;
   CARD32 pad4;
   CARD32 pad5;
   CARD32 pad6;
   // followed by numSizes times XResResourceSizeValue
}
enum sz_xXResQueryResourceBytesReply =  32;

 /* _XRESPROTO_H */
