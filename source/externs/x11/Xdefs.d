module deimos.X11.Xdefs;

import deimos.X11.Xmd;
import deimos.X11.X;

version(_XSERVER64) {
    import deimos.X11.Xmd;
}

// version(_XSERVER64) {
//     alias Atom = ulong;
// }
// else
//     alias Atom = CARD32;

alias Bool = int ;

alias pointer = void *;

struct _Client;
alias ClientPtr = _Client*;

// version(_XSERVER64) {
//     alias XID = ulong;
// }
// else
//     alias XID = CARD32;

// version(_XSERVER64) {
//     alias Mask = ulong;
// }
// else
//     alias Mask = CARD32;

struct _Font;
alias FontPtr = _Font *; /* also in fonts/include/font.h */

alias Font = XID;

version(_XSERVER64) {
    alias FSID = ulong;
}
else
    alias FSID = CARD32;

alias AccContext = FSID ;

/* OS independent time value
   XXX Should probably go in Xos.h */
struct timeval;
alias OSTimePtr = timeval**;

alias BlockHandlerProcPtr = void function(void * /* blockData */,
				     OSTimePtr /* pTimeout */,
				     void * /* pReadmask */);

