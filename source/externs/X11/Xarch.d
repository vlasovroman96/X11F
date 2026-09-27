module x11.Xarch;

import build.dix_config;
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
enum X_LITTLE_ENDIAN = 1234;
enum X_BIG_ENDIAN = 4321;

version (LittleEndian) {
	enum X_BYTE_ORDER = X_LITTLE_ENDIAN;
}
else {
	enum X_BYTE_ORDER = X_BIG_ENDIAN;
}