module x11.Xmd;
@nogc nothrow:
extern(C): __gshared:

/*
 * Copyright 2016, Roman Vlasov
 * Copyright 1987, 1998 The Open Group
 * Copyright 1987 Digital Equipment Corporation
 *
 * See COPYING for the full license texts.
 */

/*
 * The D language explicitly defines primitive type sizes.
 * No architecture-specific type detection is needed.
 */
alias RESTYPE = uint; 

alias INT64 = long;
alias INT32 = int;
alias INT16 = short;
alias INT8 = byte;

alias CARD64 = ulong;
alias CARD32 = uint;
alias CARD16 = ushort;
alias CARD8 = ubyte;

alias BITS32 = CARD32;
alias BITS16 = CARD16;

alias BYTE = CARD8;
alias BOOL = CARD8;


/*
 * this version should leave result of type (t *), but that should only be
 * used when not in MUSTCOPY
 */
enum string NEXTPTR(string p,string t) = `((cast(t*)(` ~ p ~ `)) + 1)`;
