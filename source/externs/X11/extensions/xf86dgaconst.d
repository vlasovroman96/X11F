module externs.X11.extensions.xf86dgaconst;
@nogc nothrow:
extern(C): __gshared:
import core.stdc.config: c_long, c_ulong;
/*
   Copyright (c) 1999  XFree86 Inc
*/

 
public import externs.X11.extensions.xf86dga1const;
import externs.X11.X;

enum X_XDGAQueryVersion =		0;

/* 1 through 9 are in xf86dga1.h */

/* 10 and 11 are reserved to avoid conflicts with rogue DGA extensions */

enum X_XDGAQueryModes =		12;
enum X_XDGASetMode =			13;
enum X_XDGASetViewport =		14;
enum X_XDGAInstallColormap =		15;
enum X_XDGASelectInput =		16;
enum X_XDGAFillRectangle =		17;
enum X_XDGACopyArea =			18;
enum X_XDGACopyTransparentArea =	19;
enum X_XDGAGetViewportStatus =		20;
enum X_XDGASync =			21;
enum X_XDGAOpenFramebuffer =		22;
enum X_XDGACloseFramebuffer =		23;
enum X_XDGASetClientVersion =		24;
enum X_XDGAChangePixmapMode =		25;
enum X_XDGACreateColormap =		26;


enum XDGAConcurrentAccess =	0x00000001;
enum XDGASolidFillRect =	0x00000002;
enum XDGABlitRect =		0x00000004;
enum XDGABlitTransRect =	0x00000008;
enum XDGAPixmap =    		0x00000010;

enum XDGAInterlaced =          0x00010000;
enum XDGADoublescan =          0x00020000;

enum XDGAFlipImmediate =	0x00000001;
enum XDGAFlipRetrace =		0x00000002;

enum XDGANeedRoot =		0x00000001;

enum XF86DGANumberEvents =		7;

enum XDGAPixmapModeLarge =		0;
enum XDGAPixmapModeSmall =		1;

enum XF86DGAClientNotLocal =		0;
enum XF86DGANoDirectVideoMode =	1;
enum XF86DGAScreenNotActive =		2;
enum XF86DGADirectNotActivated =	3;
enum XF86DGAOperationNotSupported =	4;
enum XF86DGANumberErrors =		(XF86DGAOperationNotSupported + 1);


struct XDGAMode {
   int num;		/* A unique identifier for the mode (num > 0) */
   char* name;		/* name of mode given in the XF86Config */
   float verticalRefresh = 0;
   int flags;		/* DGA_CONCURRENT_ACCESS, etc... */
   int imageWidth;	/* linear accessible portion (pixels) */
   int imageHeight;
   int pixmapWidth;	/* Xlib accessible portion (pixels) */
   int pixmapHeight;	/* both fields ignored if no concurrent access */
   int bytesPerScanline;
   int byteOrder;	/* MSBFirst, LSBFirst */
   int depth;
   int bitsPerPixel;
   c_ulong redMask;
   c_ulong greenMask;
   c_ulong blueMask;
   short visualClass;
   int viewportWidth;
   int viewportHeight;
   int xViewportStep;	/* viewport position granularity */
   int yViewportStep;
   int maxViewportX;	/* max viewport origin */
   int maxViewportY;
   int viewportFlags;	/* types of page flipping possible */
   int reserved1;
   int reserved2;
}


struct XDGADevice {
   XDGAMode mode;
   ubyte* data;
   Pixmap pixmap;
}


 /* _XF86DGACONST_H_ */
