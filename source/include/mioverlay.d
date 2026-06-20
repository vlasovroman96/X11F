module include.mioverlay;
@nogc nothrow:
extern(C): __gshared:
 
//public import externs.X11.Xdefs;
// //public import externs.X11.Xfuncproto;
import include.screenint;
import include.xlibre_ptrtypes;


alias miOverlayTransFunc = void function(ScreenPtr, int, BoxPtr);
alias miOverlayInOverlayFunc = Bool function(WindowPtr);

extern void  miInitOverlay(ScreenPtr pScreen, miOverlayInOverlayFunc inOverlay, miOverlayTransFunc trans);

extern void  miOverlayGetPrivateClips(WindowPtr pWin, RegionPtr* borderClip, RegionPtr* clipList);

extern void  miOverlayCollectUnderlayRegions(WindowPtr, RegionPtr*);
extern void  miOverlayComputeCompositeClip(GCPtr, WindowPtr);
extern void  miOverlayCopyUnderlay(ScreenPtr);
extern void  miOverlaySetRootClip(ScreenPtr, Bool);

                          /* __MIOVERLAY_H */
