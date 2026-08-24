module externs.X11.Xmd;
@nogc nothrow:
extern(C): __gshared:

private template HasVersion(string versionId) {
	mixin("version("~versionId~") {enum HasVersion = true;} else {enum HasVersion = false;}");
}
import core.stdc.config: c_long, c_ulong;
/***********************************************************

Copyright 1987, 1998  The Open Group

Permission to use, copy, modify, distribute, and sell this software and its
documentation for any purpose is hereby granted without fee, provided that
the above copyright notice appear in all copies and that both that
copyright notice and this permission notice appear in supporting
documentation.

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
OPEN GROUP BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Except as contained in this notice, the name of The Open Group shall not be
used in advertising or otherwise to promote the sale, use or other dealings
in this Software without prior written authorization from The Open Group.


Copyright 1987 by Digital Equipment Corporation, Maynard, Massachusetts.

                        All Rights Reserved

Permission to use, copy, modify, and distribute this software and its
documentation for any purpose and without fee is hereby granted,
provided that the above copyright notice appear in all copies and that
both that copyright notice and this permission notice appear in
supporting documentation, and that the name of Digital not be
used in advertising or publicity pertaining to distribution of the
software without specific, written prior permission.

DIGITAL DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING
ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT SHALL
DIGITAL BE LIABLE FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR
ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS,
WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION,
ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
SOFTWARE.

******************************************************************/
version (XMD_H) {} else {
enum XMD_H = 1;
/*
 *  Xmd.h: MACHINE DEPENDENT DECLARATIONS.
 */

/*
 * Special per-machine configuration flags.
 */
// static if (HasVersion!"__sun" && HasVersion!"__SVR4") {
// public import sys/isa_defs; /* Solaris: defines _LP64 if necessary */
// }

version (__SIZEOF_LONG__) {
static if (__SIZEOF_LONG__ == 8) {
version = LONG64;				/* 32/64-bit architecture */
}
} else static if (HasVersion!"_LP64" || HasVersion!"__LP64__" || 
     HasVersion!"__alpha" || HasVersion!"__alpha__" || 
     HasVersion!"__ia64__" || HasVersion!"ia64" || 
     HasVersion!"__sparc64__" || 
     HasVersion!"__s390x__" || 
     HasVersion!"__amd64__" || HasVersion!"amd64" || 
     HasVersion!"__powerpc64__") {
static if (!HasVersion!"__ILP32__") { /* amd64-x32 is 32bit */
version = LONG64;				/* 32/64-bit architecture */
} /* !__ILP32__ */
}

/*
 * Definition of macro used to set constants for size of network structures;
 * machines with preprocessors that can't handle all of the sz_ symbols
 * can define this macro to be sizeof(x) if and only if their compiler doesn't
 * pad out structures (esp. the xTextElt structure which contains only two
 * one-byte fields).  Network structures should always define sz_symbols.
 *
 * The sz_ prefix is used instead of something more descriptive so that the
 * symbols are no more than 32 characters long (which causes problems for some
 * compilers and preprocessors).
 *
 * The extra indirection is to get macro arguments to expand correctly before
 * the concatenation, rather than afterward.
 */
enum string _SIZEOF(string x) = `sz_##x`;
enum string SIZEOF(string x) = `_SIZEOF(` ~ x ~ `)`;

alias RESTYPE = uint; 
/*
 * Bitfield suffixes for the protocol structure elements, if you
 * need them.  Note that bitfields are not guaranteed to be signed
 * (or even unsigned) according to ANSI C.
 */
version = B32; /* bitfield not needed on architectures with native 32-bit type */
version = B16; /* bitfield not needed on architectures with native 16-bit type */
version (LONG64) {
alias INT64 = c_long;
alias INT32 = int;
} else {
alias INT32 = c_long;
}
alias INT16 = short;

alias INT8 = char;

version (LONG64) {
alias CARD64 = c_ulong;
alias CARD32 = uint;
} else {
alias CARD64 = ulong;
alias CARD32 = c_ulong;
}
alias CARD16 = ushort;
alias CARD8 = ubyte;

alias BITS32 = CARD32;
alias BITS16 = CARD16;

alias BYTE = CARD8;
alias BOOL = CARD8;

/*
 * was definitions for sign-extending bitfields on architectures without
 * native types smaller than 64-bit, now just backwards compatibility
 */
enum string cvtINT8toInt(string val) = `(` ~ val ~ `)`;
enum string cvtINT16toInt(string val) = `(` ~ val ~ `)`;
enum string cvtINT32toInt(string val) = `(` ~ val ~ `)`;
enum string cvtINT8toShort(string val) = `(` ~ val ~ `)`;
enum string cvtINT16toShort(string val) = `(` ~ val ~ `)`;
enum string cvtINT32toShort(string val) = `(` ~ val ~ `)`;
enum string cvtINT8toLong(string val) = `(` ~ val ~ `)`;
enum string cvtINT16toLong(string val) = `(` ~ val ~ `)`;
enum string cvtINT32toLong(string val) = `(` ~ val ~ `)`;

/*
 * this version should leave result of type (t *), but that should only be
 * used when not in MUSTCOPY
 */
enum string NEXTPTR(string p,string t) = `((cast(t*)(` ~ p ~ `)) + 1)`;

} /* XMD_H */
