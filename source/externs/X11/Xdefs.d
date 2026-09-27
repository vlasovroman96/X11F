module x11.Xdefs;
@nogc nothrow:
extern(C): __gshared:
import core.stdc.config: c_long, c_ulong;
/*
 * Copyright 2016, Roman Vlasov
 * Copyright (c) 1999  The XFree86 Project Inc.
 *
 * See COPYING for the full license texts.
*/

/**
 ** Types definitions shared between server and clients
 **/

 
version (_XSERVER64) {
public import x11.Xmd;
import std.path;
}

import externs.X11.fonts.fontstruct;

 
version (_XSERVER64) {} else {
alias Atom = c_ulong;
} version (_XSERVER64) {
alias Atom = CARD32;
}


version (Bool) {} else {
 
alias Bool = int;

}

 
alias pointer = void*;






 
version (_XSERVER64) {} else {
alias XID = c_ulong;
} version (_XSERVER64) {
alias XID = CARD32;
}


 
version (_XSERVER64) {} else {
alias Mask = c_ulong;
} version (_XSERVER64) {
alias Mask = CARD32;
}

 
alias FontPtr = _Font*; /* also in fonts/include/font.h */


 
alias Font = XID;


version (_XTYPEDEF_FSID) {} else {
version (_XSERVER64) {} else {
alias FSID = c_ulong;
} version (_XSERVER64) {
alias FSID = CARD32;
}
}

alias AccContext = FSID;

extern struct timeval;

/* OS independent time value
   XXX Should probably go in Xos.h */
alias OSTimePtr = timeval**;


alias BlockHandlerProcPtr = void function(void*, OSTimePtr, void*);


