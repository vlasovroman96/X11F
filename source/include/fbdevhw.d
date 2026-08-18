module include.fbdevhw;
@nogc nothrow:
extern(C): __gshared:

 
public import include.xf86str;
import externs.pciaccess;

enum FBDEVHW_PACKED_PIXELS =		0       /* Packed Pixels        */;
enum FBDEVHW_INTERLEAVED_PLANES =	2       /* Interleaved planes   */;
enum FBDEVHW_TEXT =			3       /* Text/attributes      */;
enum FBDEVHW_VGA_PLANES =		4       /* EGA/VGA planes       */;

int fbdevHWProbe(pci_device* pPci, const(char)* device, char** namep);
int fbdevHWInit(ScrnInfoPtr pScrn, pci_device* pPci, const(char)* device);

int* fbdevHWGetName(ScrnInfoPtr pScrn);
int fbdevHWGetDepth(ScrnInfoPtr pScrn, int* fbbpp);
int fbdevHWGetLineLength(ScrnInfoPtr pScrn);
int fbdevHWGetType(ScrnInfoPtr pScrn);
int fbdevHWGetVidmem(ScrnInfoPtr pScrn);

int* fbdevHWMapVidmem(ScrnInfoPtr pScrn);
int fbdevHWLinearOffset(ScrnInfoPtr pScrn);
int fbdevHWUnmapVidmem(ScrnInfoPtr pScrn);
int* fbdevHWMapMMIO(ScrnInfoPtr pScrn);
int fbdevHWUnmapMMIO(ScrnInfoPtr pScrn);

int fbdevHWSetVideoModes(ScrnInfoPtr pScrn);
int fbdevHWUseBuildinMode(ScrnInfoPtr pScrn);
int fbdevHWModeInit(ScrnInfoPtr pScrn, DisplayModePtr mode);
int fbdevHWSave(ScrnInfoPtr pScrn);
int fbdevHWRestore(ScrnInfoPtr pScrn);

int fbdevHWLoadPalette(ScrnInfoPtr pScrn, int numColors, int* indices, LOCO* colors, VisualPtr pVisual);

int fbdevHWValidMode(ScrnInfoPtr pScrn, DisplayModePtr mode, Bool verbose, int flags);
int fbdevHWSwitchMode(ScrnInfoPtr pScrn, DisplayModePtr mode);
int fbdevHWAdjustFrame(ScrnInfoPtr pScrn, int x, int y);
int fbdevHWEnterVT(ScrnInfoPtr pScrn);
int fbdevHWLeaveVT(ScrnInfoPtr pScrn);
int fbdevHWDPMSSet(ScrnInfoPtr pScrn, int mode, int flags);

int fbdevHWSaveScreen(ScreenPtr pScreen, int mode);

xf86SwitchModeProc *fbdevHWSwitchModeWeak();
xf86AdjustFrameProc *fbdevHWAdjustFrameWeak();
xf86LeaveVTProc *fbdevHWLeaveVTWeak();
xf86ValidModeProc *fbdevHWValidModeWeak();
xf86DPMSSetProc *fbdevHWDPMSSetWeak();
xf86LoadPaletteProc *fbdevHWLoadPaletteWeak();


