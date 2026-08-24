module externs.X11.extensions.XvMCproto;
@nogc nothrow:
extern(C): __gshared:
 
public import externs.X11.Xmd;

enum xvmc_QueryVersion =		0;
enum xvmc_ListSurfaceTypes =		1;
enum xvmc_CreateContext =		2;
enum xvmc_DestroyContext =		3;
enum xvmc_CreateSurface =		4;
enum xvmc_DestroySurface =		5;
enum xvmc_CreateSubpicture =		6;
enum xvmc_DestroySubpicture =		7;
enum xvmc_ListSubpictureTypes =	8;
enum xvmc_GetDRInfo =                  9;
enum xvmc_LastRequest =		xvmc_GetDRInfo;

enum xvmcNumRequest =			(xvmc_LastRequest + 1);


struct xvmcSurfaceInfo {
  CARD32 surface_type_id;
  CARD16 chroma_format;
  CARD16 pad0;
  CARD16 max_width;
  CARD16 max_height;
  CARD16 subpicture_max_width;
  CARD16 subpicture_max_height;
  CARD32 mc_type;
  CARD32 flags;
}
enum sz_xvmcSurfaceInfo = 24;

struct xvmcQueryVersionReq {
  CARD8 reqType;
  CARD8 xvmcReqType;
  CARD16 length;
}
enum sz_xvmcQueryVersionReq = 4;

struct xvmcQueryVersionReply {
  BYTE type;  /* X_Reply */
  BYTE padb1;
  CARD16 sequenceNumber;
  CARD32 length;
  CARD32 major;
  CARD32 minor;
  CARD32 padl4;
  CARD32 padl5;
  CARD32 padl6;
  CARD32 padl7;
}
enum sz_xvmcQueryVersionReply = 32;

struct xvmcListSurfaceTypesReq {
  CARD8 reqType;
  CARD8 xvmcReqType;
  CARD16 length;
  CARD32 port;
}
enum sz_xvmcListSurfaceTypesReq = 8;

struct xvmcListSurfaceTypesReply {
  BYTE type;  /* X_Reply */
  BYTE padb1;
  CARD16 sequenceNumber;
  CARD32 length;
  CARD32 num;
  CARD32 padl3;
  CARD32 padl4;
  CARD32 padl5;
  CARD32 padl6;
  CARD32 padl7;
}
enum sz_xvmcListSurfaceTypesReply = 32;

struct xvmcCreateContextReq {
  CARD8 reqType;
  CARD8 xvmcReqType;
  CARD16 length;
  CARD32 context_id;
  CARD32 port;
  CARD32 surface_type_id;
  CARD16 width;
  CARD16 height;
  CARD32 flags;
}
enum sz_xvmcCreateContextReq = 24;

struct xvmcCreateContextReply {
  BYTE type;  /* X_Reply */
  BYTE padb1;
  CARD16 sequenceNumber;
  CARD32 length;
  CARD16 width_actual;
  CARD16 height_actual;
  CARD32 flags_return;
  CARD32 padl4;
  CARD32 padl5;
  CARD32 padl6;
  CARD32 padl7;
}
enum sz_xvmcCreateContextReply = 32;

struct xvmcDestroyContextReq {
  CARD8 reqType;
  CARD8 xvmcReqType;
  CARD16 length;
  CARD32 context_id;
}
enum sz_xvmcDestroyContextReq = 8;

struct xvmcCreateSurfaceReq {
  CARD8 reqType;
  CARD8 xvmcReqType;
  CARD16 length;
  CARD32 surface_id;
  CARD32 context_id;
}
enum sz_xvmcCreateSurfaceReq = 12;

struct xvmcCreateSurfaceReply {
  BYTE type;  /* X_Reply */
  BYTE padb1;
  CARD16 sequenceNumber;
  CARD32 length;
  CARD32 padl2;
  CARD32 padl3;
  CARD32 padl4;
  CARD32 padl5;
  CARD32 padl6;
  CARD32 padl7;
}
enum sz_xvmcCreateSurfaceReply = 32;

struct xvmcDestroySurfaceReq {
  CARD8 reqType;
  CARD8 xvmcReqType;
  CARD16 length;
  CARD32 surface_id;
}
enum sz_xvmcDestroySurfaceReq = 8;


struct xvmcCreateSubpictureReq {
  CARD8 reqType;
  CARD8 xvmcReqType;
  CARD16 length;
  CARD32 subpicture_id;
  CARD32 context_id;
  CARD32 xvimage_id;
  CARD16 width;
  CARD16 height;
}
enum sz_xvmcCreateSubpictureReq = 20;

struct xvmcCreateSubpictureReply {
  BYTE type;  /* X_Reply */
  BYTE padb1;
  CARD16 sequenceNumber;
  CARD32 length;
  CARD16 width_actual;
  CARD16 height_actual;
  CARD16 num_palette_entries;
  CARD16 entry_bytes;
  CARD8[4] component_order;
  CARD32 padl5;
  CARD32 padl6;
  CARD32 padl7;
}
enum sz_xvmcCreateSubpictureReply = 32;

struct xvmcDestroySubpictureReq {
  CARD8 reqType;
  CARD8 xvmcReqType;
  CARD16 length;
  CARD32 subpicture_id;
}
enum sz_xvmcDestroySubpictureReq = 8;

struct xvmcListSubpictureTypesReq {
  CARD8 reqType;
  CARD8 xvmcReqType;
  CARD16 length;
  CARD32 port;
  CARD32 surface_type_id;
}
enum sz_xvmcListSubpictureTypesReq = 12;

struct xvmcListSubpictureTypesReply {
  BYTE type;  /* X_Reply */
  BYTE padb1;
  CARD16 sequenceNumber;
  CARD32 length;
  CARD32 num;
  CARD32 padl2;
  CARD32 padl3;
  CARD32 padl4;
  CARD32 padl5;
  CARD32 padl6;
}
enum sz_xvmcListSubpictureTypesReply = 32;

struct xvmcGetDRInfoReq {
  CARD8 reqType;
  CARD8 xvmcReqType;
  CARD16 length;
  CARD32 port;
  CARD32 shmKey;
  CARD32 magic;
}
enum sz_xvmcGetDRInfoReq = 16;

struct xvmcGetDRInfoReply {
  BYTE type;  /* X_Reply */
  BYTE padb1;
  CARD16 sequenceNumber;
  CARD32 length;
  CARD32 major;
  CARD32 minor;
  CARD32 patchLevel;
  CARD32 nameLen;
  CARD32 busIDLen;
  CARD32 isLocal;
}
enum sz_xvmcGetDRInfoReply = 32;


