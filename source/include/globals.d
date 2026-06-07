module include.globals;
@nogc nothrow:
extern(C): __gshared:
 
//public import externs.X11.Xdefs;
// //public import externs.X11.Xfuncproto;

/* Global X server variables that are visible to mi, dix, os, and ddx */

extern const(void )* defaultFontPath;
extern void  monitorResolution;
extern void  defaultColorVisualClass;

                          /* !_XSERV_GLOBAL_H_ */
