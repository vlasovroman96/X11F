module externs.X11.Xarch;
@nogc nothrow:
extern(C): __gshared:

private template HasVersion(string versionId) {
	mixin("version("~versionId~") {enum HasVersion = true;} else {enum HasVersion = false;}");
}
 
/*
 * Copyright 1997 Metro Link Incorporated
 *
 *                           All Rights Reserved
 *
 * Permission to use, copy, modify, distribute, and sell this software and its
 * documentation for any purpose is hereby granted without fee, provided that
 * the above copyright notice appear in all copies and that both that
 * copyright notice and this permission notice appear in supporting
 * documentation, and that the names of the above listed copyright holder(s)
 * not be used in advertising or publicity pertaining to distribution of
 * the software without specific, written prior permission.  The above listed
 * copyright holder(s) make(s) no representations about the suitability of
 * this software for any purpose.  It is provided "as is" without express or
 * implied warranty.
 *
 * THE ABOVE LISTED COPYRIGHT HOLDER(S) DISCLAIM(S) ALL WARRANTIES WITH REGARD
 * TO THIS SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS, IN NO EVENT SHALL THE ABOVE LISTED COPYRIGHT HOLDER(S) BE
 * LIABLE FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY
 * DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER
 * IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING
 * OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */


/*
 * Determine the machine's byte order.
 */

/* See if it is set in the imake config first */
version (X_BYTE_ORDER) {

enum X_BIG_ENDIAN = 4321;
enum X_LITTLE_ENDIAN = 1234;

} else {

static if (HasVersion!"SVR4" || HasVersion!"__SVR4") {
public import core.sys.posix.sys.types;
public import sys.byteorder;
} else version (CSRG_BASED) {
static if (HasVersion!"__NetBSD__" || HasVersion!"__OpenBSD__") {
public import core.sys.posix.sys.types;
}
public import machine.endian;
} else version (linux) {
version (__STRICT_ANSI__) {
//! #    undef __STRICT_ANSI__
// public import endian;
version = __STRICT_ANSI__;
} else {
// public import endian;
}
/* 'endian.h' might have been included before 'Xarch.h' */
static if (!HasVersion!"LITTLE_ENDIAN" && HasVersion!"__LITTLE_ENDIAN") {
enum LITTLE_ENDIAN = __LITTLE_ENDIAN;
}
static if (!HasVersion!"BIG_ENDIAN" && HasVersion!"__BIG_ENDIAN") {
enum BIG_ENDIAN = __BIG_ENDIAN;
}
static if (!HasVersion!"PDP_ENDIAN" && HasVersion!"__PDP_ENDIAN") {
enum PDP_ENDIAN = __PDP_ENDIAN;
}
static if (!HasVersion!"BYTE_ORDER" && HasVersion!"__BYTE_ORDER") {
enum BYTE_ORDER = __BYTE_ORDER;
}
}

// version = BYTE_ORDER;
version (BYTE_ORDER) {} else {
	enum LITTLE_ENDIAN = 1234;
	enum BIG_ENDIAN =    4321;

	static if (HasVersion!"__sun" && HasVersion!"__SVR4") {
		public import sys.isa_defs;
		version (_LITTLE_ENDIAN) {
			enum BYTE_ORDER = LITTLE_ENDIAN;
		}
		version (_BIG_ENDIAN) {
			enum BYTE_ORDER = BIG_ENDIAN;
		}
	} /* sun */
	// version = BYTE_ORDER;
} /* BYTE_ORDER */

// enum X_BYTE_ORDER = BYTE_ORDER;
enum X_BIG_ENDIAN = BIG_ENDIAN;
enum X_LITTLE_ENDIAN = LITTLE_ENDIAN;

} /* not in imake config */

 /* _XARCH_H_ */
