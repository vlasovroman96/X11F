module x11.Xarch;
@nogc nothrow:
extern(C): __gshared:

private template HasVersion(string versionId) {
	mixin("version("~versionId~") {enum HasVersion = true;} else {enum HasVersion = false;}");
}
 
/*
 * Copyright 2016, Roman Vlasov
 * Copyright 1997, Metro Link Incorporated
 *
 * See COPYING for the full license texts.
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
