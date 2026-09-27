module x11.Xdefs;
@nogc nothrow:
extern(C): __gshared:
/*
 * Copyright 2016, Roman Vlasov
 * Copyright (c) 1999  The XFree86 Project Inc.
 *
 * See COPYING for the full license texts.
*/

/**
 ** Types definitions shared between server and clients
 **/

 
version (_XSERVER64) 
{
   import x11.Xmd;

   alias Atom = CARD32;
   alias XID = CARD32;
   alias Mask = CARD32;
   alias FSID = CARD32;
}
else {
   import core.stdc.config: c_long, c_ulong;

   alias Atom = c_ulong;
   alias XID = c_ulong;
   alias Mask = c_ulong;
   alias FSID = c_ulong;
}

import externs.X11.fonts.fontstruct;

alias Bool = int;
 
alias pointer = void*;
 
alias FontPtr = _Font*; /* also in fonts/include/font.h */
 
alias Font = XID;

alias AccContext = FSID;

extern struct timeval;

/* OS independent time value
   XXX Should probably go in Xos.h */
alias OSTimePtr = timeval**;


alias BlockHandlerProcPtr = void function(void*, OSTimePtr, void*);


