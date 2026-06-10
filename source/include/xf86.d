module include.xf86;
@nogc nothrow:
extern(C): __gshared:
/*
 * Copyright (c) 1997-2003 by The XFree86 Project, Inc.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
 * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
 * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
 * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 *
 * Except as contained in this notice, the name of the copyright holder(s)
 * and author(s) shall not be used in advertising or otherwise to promote
 * the sale, use or other dealings in this Software without prior written
 * authorization from the copyright holder(s) and author(s).
 */

/*
 * This file contains declarations for public XFree86 functions and variables,
 * and definitions of public macros.
 *
 * "public" means available to video drivers.
 */

 
public import include.xlibre_ptrtypes;
public import include.xf86str;
public import include.xf86Opt;
public import externs.X11.Xfuncproto;
public import core.stdc.stdarg;
//public import externs.X11.extensions._randr;
import include.xf86Xinput;
import os.log;

/* General parameters */
extern bool  xorgHWAccess;

extern DevPrivateKeyRec xf86ScreenKeyRec;

enum xf86ScreenKey = (&xf86ScreenKeyRec);

extern ScrnInfoPtr *xf86Screens;      /* List of pointers to ScrnInfoRecs */
extern ubyte[256] byte_reversed;

enum string XF86SCRNINFO(string p) = `xf86ScreenToScrn(` ~ p ~ `)`;

/* Compatibility functions for pre-input-thread drivers */
pragma(inline, true) private int xf86BlockSIGIO() { input_lock(); return 0; }
pragma(inline, true) private void xf86UnblockSIGIO(int wasset) { input_unlock(); }
/* PCI related */
version (XSERVER_LIBPCIACCESS) {
public import externs.pciaccess;
extern void  xf86CheckPciSlot(const(pci_device)*);
extern void  xf86ClaimPciSlot(pci_device*, DriverPtr drvp, int chipset, GDevPtr dev, Bool active);
extern void  xf86UnclaimPciSlot(pci_device*, GDevPtr dev);
extern void  xf86ParsePciBusString(const(char)* busID, int* bus, int* device, int* func);
extern void  xf86IsPrimaryPci(pci_device* pPci);
extern void  xf86CheckPciMemBase(pci_device* pPci, memType base);
extern pci_device* xf86GetPciInfoForEntity(int entityIndex);
extern void  xf86MatchPciInstances(const(char)* driverName, int vendorID, SymTabPtr chipsets, PciChipsets* PCIchipsets, GDevPtr* devList, int numDevs, DriverPtr drvp, int** foundEntities);
extern void  xf86ConfigPciEntity(ScrnInfoPtr pScrn, int scrnFlag, int entityIndex, PciChipsets* p_chip, void* dummy, EntityProc init, EntityProc enter, EntityProc leave, void* private_);
}

/* xf86Bus.c */

extern void  xf86ClaimFbSlot(DriverPtr drvp, int chipset, GDevPtr dev, Bool active);
extern void  xf86ClaimNoSlot(DriverPtr drvp, int chipset, GDevPtr dev, Bool active);
extern void  xf86AddEntityToScreen(ScrnInfoPtr pScrn, int entityIndex);
extern void  xf86SetEntityInstanceForScreen(ScrnInfoPtr pScrn, int entityIndex, int instance);
extern void  xf86GetNumEntityInstances(int entityIndex);
extern void  xf86GetDevFromEntity(int entityIndex, int instance);
extern void  xf86GetEntityInfo(int entityIndex);

enum string xf86SetLastScrnFlag(string e, string s) = `do { } while (0)`;

extern void  xf86IsEntityShared(int entityIndex);
extern void  xf86SetEntityShared(int entityIndex);
extern void  xf86IsEntitySharable(int entityIndex);
extern void  xf86SetEntitySharable(int entityIndex);
extern void  xf86IsPrimInitDone(int entityIndex);
extern void  xf86SetPrimInitDone(int entityIndex);
extern void  xf86ClearPrimInitDone(int entityIndex);
extern void  xf86AllocateEntityPrivateIndex();
extern void * xf86GetEntityPrivate(int entityIndex, int privIndex);

/* xf86Configure.c */
extern void  xf86AddBusDeviceToConfigure(const(char)* driver, BusType bus, void* busData, int chipset);

/* xf86Cursor.c */

extern void  xf86SetViewport(ScreenPtr pScreen, int x, int y);
extern void  xf86SwitchMode(ScreenPtr pScreen, DisplayModePtr mode);
extern void * xf86GetPointerScreenFuncs();
extern void  xf86ReconfigureLayout();

/* xf86DPMS.c */

extern void  xf86DPMSInit(ScreenPtr pScreen, DPMSSetProcPtr set, int flags);

/* xf86DGA.c */

version (XFreeXDGA) {
extern void  DGAInit(ScreenPtr pScreen, DGAFunctionPtr funcs, DGAModePtr modes, int num);
extern void  DGAReInitModes(ScreenPtr pScreen, DGAModePtr modes, int num);
extern xf86SetDGAModeProc xf86SetDGAMode;
}

/* xf86Events.c */

alias InputInfoPtr = _InputInfoRec*;

extern void  SetTimeSinceLastInputEvent();
extern void * xf86AddGeneralHandler(int fd, InputHandlerProc proc, void* data);
extern void  xf86RemoveGeneralHandler(void* handler);

/* xf86Helper.c */

extern void  xf86AddDriver(DriverPtr driver, void* module_, int flags);
extern void  xf86AllocateScreen(DriverPtr drv, int flags);
extern void  xf86AllocateScrnInfoPrivateIndex();
extern void  xf86SetDepthBpp(ScrnInfoPtr scrp, int depth, int bpp, int fbbpp, int depth24flags);
extern void  xf86PrintDepthBpp(ScrnInfoPtr scrp);
extern void  xf86SetWeight(ScrnInfoPtr scrp, rgb weight, rgb mask);
extern void  xf86SetDefaultVisual(ScrnInfoPtr scrp, int visual);
extern void  xf86SetGamma(ScrnInfoPtr scrp, Gamma newGamma);
extern void  xf86SetDpi(ScrnInfoPtr pScrn, int x, int y);
extern void  xf86SetBlackWhitePixels(ScreenPtr pScreen);
extern void  xf86EnableDisableFBAccess(ScrnInfoPtr pScrn, Bool enable);
extern void  xf86VDrvMsgVerb(int scrnIndex, MessageType type, int verb, const(char)* format, va_list args);
extern void  xf86DrvMsgVerb(int scrnIndex, MessageType type, int verb, const(char)* format, ...);
extern void  _X_ATTRIBUTE_PRINTF();
extern void  _X_ATTRIBUTE_PRINTF();
extern void  _X_ATTRIBUTE_PRINTF();
extern const(void )* xf86TokenToString(SymTabPtr table, int token);
extern void  xf86StringToToken(SymTabPtr table, const(char)* string);
extern void  xf86ShowClocks(ScrnInfoPtr scrp, MessageType from);
extern void  xf86PrintChipsets(const(char)* drvname, const(char)* drvmsg, SymTabPtr chips);
extern void  xf86MatchDevice(const(char)* drivername, GDevPtr** driversectlist);
extern const(void )* xf86GetVisualName(int visual);
extern void  xf86GetVerbosity();
extern void  xf86GetGamma();
extern void  xf86ServerIsExiting();
extern void  xf86ServerIsOnlyDetecting();
extern void  xf86GetAllowMouseOpenFail();
extern void  xorgGetVersion();
extern void  xf86GetModuleVersion(void* module_);
extern void * xf86LoadDrvSubModule(DriverPtr drv, const(char)* name);
extern void * xf86LoadSubModule(ScrnInfoPtr pScrn, const(char)* name);
extern void * xf86LoadOneModule(const(char)* name, void* optlist);
extern void  xf86UnloadSubModule(void* mod);
extern void  xf86LoaderCheckSymbol(const(char)* name);
extern void  xf86SetBackingStore(ScreenPtr pScreen);
extern void  xf86SetSilkenMouse(ScreenPtr pScreen);
extern void  xf86ConfigFbEntity(ScrnInfoPtr pScrn, int scrnFlag, int entityIndex, EntityProc init, EntityProc enter, EntityProc leave, void* private_);

extern void  xf86IsUnblank(int mode);

/* xf86Init.c */

extern void  xf86GetPixFormat(ScrnInfoPtr pScrn, int depth);
extern void  xf86GetBppFromDepth(ScrnInfoPtr pScrn, int depth);

/* xf86Mode.c */

extern void  xf86CheckModeForMonitor(DisplayModePtr mode, MonPtr monitor);
extern void  xf86ValidateModes(ScrnInfoPtr scrp, DisplayModePtr availModes, const(char)** modeNames, ClockRangePtr clockRanges, int* linePitches, int minPitch, int maxPitch, int minHeight, int maxHeight, int pitchInc, int virtualX, int virtualY, int apertureSize, LookupModeFlags strategy);
extern void  xf86DeleteMode(DisplayModePtr* modeList, DisplayModePtr mode);
extern void  xf86PruneDriverModes(ScrnInfoPtr scrp);
extern void  xf86SetCrtcForModes(ScrnInfoPtr scrp, int adjustFlags);
extern void  xf86PrintModes(ScrnInfoPtr scrp);

/* xf86Option.c */

extern void  xf86CollectOptions(ScrnInfoPtr pScrn, XF86OptionPtr extraOpts);

/* convert ScreenPtr to ScrnInfoPtr */
extern void  xf86ScreenToScrn(ScreenPtr pScreen);
/* convert ScrnInfoPtr to ScreenPtr */
extern void  xf86ScrnToScreen(ScrnInfoPtr pScrn);

enum XF86_HAS_SCRN_CONV = 1 /* define for drivers to use in api compat */;

enum XF86_SCRN_INTERFACE = 1 /* define for drivers to use in api compat */;

/* flags passed to xf86 allocate screen */
enum XF86_ALLOCATE_GPU_SCREEN = 1;

/* only for backwards (source) compatibility */
alias xf86MsgVerb = LogMessageVerb;
enum string xf86Msg(string type, string arg) = `LogMessageVerb(` ~ type ~ `, 1, `~arg~`)`;

/*
 * retrieve file descriptor to opened console device.
 * only for some legacy keyboard drivers (xf86-input-keyboard)
 */
int xf86GetConsoleFd();

                          /* _XF86_H */
