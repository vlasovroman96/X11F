module hw.xfree86.os_support.bus.xf86Sbus_priv;
@nogc nothrow:
extern(C): __gshared:

private template HasVersion(string versionId) {
	mixin("version("~versionId~") {enum HasVersion = true;} else {enum HasVersion = false;}");
}
/*
 * Platform specific SBUS and OpenPROM access declarations.
 *
 * Copyright (C) 2000 Jakub Jelinek (jakub@redhat.com)
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
 * JAKUB JELINEK BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
 * IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
 
version (linux) {
// public import asm/types;
// public import linux/fb;
// public import asm/fbio;
// public import asm/openpromio;
} else version (SVR4) {
// public import sys/fbio;
// public import sys/openpromio;
} else static if (HasVersion!"__OpenBSD__" && HasVersion!"__sparc64__") {
/* XXX */
} else version (CSRG_BASED) {
version (__FreeBSD__) {
public import core.sys.posix.sys.types;
// public import sys/fbio;
// public import dev/ofw/openpromio;
} else {
// public import machine/fbio;
}
} else {
// public import sun/fbio;
}

enum FBTYPE_SUNGP3 = -1;

enum FBTYPE_MDICOLOR = -1;

enum FBTYPE_SUNLEO = -1;

enum FBTYPE_TCXCOLOR = -1;

enum FBTYPE_CREATOR = -1;


                          /* _XF86_SBUS_H */
