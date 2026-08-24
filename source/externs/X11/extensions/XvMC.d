module externs.X11.extensions.XvMC;
@nogc nothrow:
extern(C): __gshared:
 
public import externs.X11.X;
public import externs.X11.extensions.Xv;

enum XvMCName = "XVideo-MotionCompensation";
enum XvMCNumEvents = 0;
enum XvMCNumErrors = 3;
enum XvMCVersion = 1;
enum XvMCRevision = 1;

enum XvMCBadContext =          0;
enum XvMCBadSurface =          1;
enum XvMCBadSubpicture =       2;

/* Chroma formats */
enum XVMC_CHROMA_FORMAT_420 =          0x00000001;
enum XVMC_CHROMA_FORMAT_422 =          0x00000002;
enum XVMC_CHROMA_FORMAT_444 =          0x00000003;

/* XvMCSurfaceInfo Flags */
enum XVMC_OVERLAID_SURFACE =                   0x00000001;
enum XVMC_BACKEND_SUBPICTURE =                 0x00000002;
enum XVMC_SUBPICTURE_INDEPENDENT_SCALING =     0x00000004;
enum XVMC_INTRA_UNSIGNED =                     0x00000008;

/* Motion Compensation types */
enum XVMC_MOCOMP =                     0x00000000;
enum XVMC_IDCT =                       0x00010000;

enum XVMC_MPEG_1 =                     0x00000001;
enum XVMC_MPEG_2 =                     0x00000002;
enum XVMC_H263 =                       0x00000003;
enum XVMC_MPEG_4 =                     0x00000004;

enum XVMC_MB_TYPE_MOTION_FORWARD =     0x02;
enum XVMC_MB_TYPE_MOTION_BACKWARD =    0x04;
enum XVMC_MB_TYPE_PATTERN =            0x08;
enum XVMC_MB_TYPE_INTRA =              0x10;

enum XVMC_PREDICTION_FIELD =           0x01;
enum XVMC_PREDICTION_FRAME =           0x02;
enum XVMC_PREDICTION_DUAL_PRIME =      0x03;
enum XVMC_PREDICTION_16x8 =            0x02;
enum XVMC_PREDICTION_4MV =             0x04;

enum XVMC_SELECT_FIRST_FORWARD =       0x01;
enum XVMC_SELECT_FIRST_BACKWARD =      0x02;
enum XVMC_SELECT_SECOND_FORWARD =      0x04;
enum XVMC_SELECT_SECOND_BACKWARD =     0x08;

enum XVMC_DCT_TYPE_FRAME =             0x00;
enum XVMC_DCT_TYPE_FIELD =             0x01;

enum XVMC_TOP_FIELD =          0x00000001;
enum XVMC_BOTTOM_FIELD =       0x00000002;
enum XVMC_FRAME_PICTURE =      (XVMC_TOP_FIELD | XVMC_BOTTOM_FIELD);

enum XVMC_SECOND_FIELD =       0x00000004;

enum XVMC_DIRECT =             0x00000001;

enum XVMC_RENDERING =          0x00000001;
enum XVMC_DISPLAYING =         0x00000002;


struct XvMCSurfaceInfo {
   int surface_type_id;
   int chroma_format;
   ushort max_width;
   ushort max_height;
   ushort subpicture_max_width;
   ushort subpicture_max_height;
   int mc_type;
   int flags;
}

struct XvMCContext {
   XID context_id;
   int surface_type_id;
   ushort width;
   ushort height;
   XvPortID port;
   int flags;
   void* privData;  /* private to the library */
}

struct XvMCSurface {
  XID surface_id;
  XID context_id;
  int surface_type_id;
  ushort width;
  ushort height;
  void* privData;  /* private to the library */
}

struct XvMCSubpicture {
  XID subpicture_id;
  XID context_id;
  int xvimage_id;
  ushort width;
  ushort height;
  int num_palette_entries;
  int entry_bytes;
  char[4] component_order = 0;
  void* privData;    /* private to the library */
}

struct XvMCBlockArray {
  uint num_blocks;
  XID context_id;
  void* privData;
  short* blocks;
}

struct XvMCMacroBlock {
   ushort x;
   ushort y;
   ubyte macroblock_type;
   ubyte motion_type;
   ubyte motion_vertical_field_select;
   ubyte dct_type;
   short[2][2][2] PMV;
   uint index;
   ushort coded_block_pattern;
   ushort pad0;
}


struct XvMCMacroBlockArray {
  uint num_blocks;
  XID context_id;
  void* privData;
  XvMCMacroBlock* macro_blocks;
}


