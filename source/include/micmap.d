module include.micmap;
@nogc nothrow:
extern(C): __gshared:
import core.stdc.config: c_long, c_ulong;
 
//public import externs.X11.X;
//public import externs.X11.Xdefs;
// //public import externs.X11.Xfuncproto;

public import include.colormap;
public import include.privates;
public import include.screenint;
public import mi.micmap;

extern DevPrivateKeyRec micmapScrPrivateKeyRec;

enum micmapScrPrivateKey = (&micmapScrPrivateKeyRec);

// extern void  miListInstalledColormaps(ScreenPtr pScreen, Colormap* pmaps);
// extern void  miInstallColormap(ColormapPtr pmap);
// extern void  miUninstallColormap(ColormapPtr pmap);
// extern void  miResolveColor(ushort*, ushort*, ushort*, VisualPtr);
// extern void  miInitializeColormap(ColormapPtr);
// extern void  miCreateDefColormap(ScreenPtr);
// extern void  miClearVisualTypes();
// extern void  miSetVisualTypes(int, int, int, int);
extern void  miSetPixmapDepths();
// extern void  miSetVisualTypesAndMasks(int depth, int visuals, int bitsPerRGB, int preferredCVC, Pixel redMask, Pixel greenMask, Pixel blueMask);
extern void  miGetDefaultVisualMask(int);
// extern void  miInitVisuals(VisualPtr*, DepthPtr*, int*, int*, int*, VisualID*, c_ulong, int, int);

enum MAX_PSEUDO_DEPTH =	10;

enum StaticColorMask =	(1 << StaticColor);
enum PseudoColorMask =	(1 << PseudoColor);
enum TrueColorMask =	(1 << TrueColor);
enum DirectColorMask =	(1 << DirectColor);

                          /* _MICMAP_H_ */
