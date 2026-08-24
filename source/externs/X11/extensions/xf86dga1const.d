module externs.X11.extensions.xf86dga1const;
@nogc nothrow:
extern(C): __gshared:
/*

Copyright (c) 1995  Jon Tombs
Copyright (c) 1995  XFree86 Inc

*/

/************************************************************************

   THIS IS THE OLD DGA API AND IS OBSOLETE.  PLEASE DO NOT USE IT ANYMORE

************************************************************************/

 
enum X_XF86DGAQueryVersion =		0;
enum X_XF86DGAGetVideoLL =		1;
enum X_XF86DGADirectVideo =		2;
enum X_XF86DGAGetViewPortSize =	3;
enum X_XF86DGASetViewPort =		4;
enum X_XF86DGAGetVidPage =		5;
enum X_XF86DGASetVidPage =		6;
enum X_XF86DGAInstallColormap =	7;
enum X_XF86DGAQueryDirectVideo =	8;
enum X_XF86DGAViewPortChanged =	9;

enum XF86DGADirectPresent =		0x0001;
enum XF86DGADirectGraphics =		0x0002;
enum XF86DGADirectMouse =		0x0004;
enum XF86DGADirectKeyb =		0x0008;
enum XF86DGAHasColormap =		0x0100;
enum XF86DGADirectColormap =		0x0200;


 /* _XF86DGA1CONST_H_ */
