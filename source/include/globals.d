module include.globals;
@nogc nothrow:
extern(C): __gshared:
 
//public import externs.X11.Xdefs;
// //public import externs.X11.Xfuncproto;

/* Global X server variables that are visible to mi, dix, os, and ddx */

extern const(char)* defaultFontPath;
extern int monitorResolution;
extern int defaultColorVisualClass;

                          /* !_XSERV_GLOBAL_H_ */
