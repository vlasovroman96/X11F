module externs.X11.Xosdefs;
@nogc nothrow:
extern(C): __gshared:

private template HasVersion(string versionId) {
	mixin("version("~versionId~") {enum HasVersion = true;} else {enum HasVersion = false;}");
}
/*
 * O/S-dependent (mis)feature macro definitions
 *
Copyright 1991, 1998  The Open Group

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
 */

 
/*
 * X_NOT_POSIX means does not have POSIX header files.  Lack of this
 * symbol does NOT mean that the POSIX environment is the default.
 * You may still have to define _POSIX_SOURCE to get it.
 */


version (_SCO_DS) {
 

}

version (__i386__) {
version (SYSV) {
static if (!HasVersion!"__SCO__" && 
	!HasVersion!"__UNIXWARE__" && !HasVersion!"__sun") {
static if (!HasVersion!"_POSIX_SOURCE") {
version = X_NOT_POSIX;
}
}
}
}

version (__sun) {
/* Imake configs define SVR4 on Solaris, but cc & gcc only define __SVR4
 * This check allows non-Imake configured programs to build correctly.
 */
static if (HasVersion!"__SVR4" && !HasVersion!"SVR4") {
enum SVR4 = 1;
}
version (SVR4) {
/* define this to whatever it needs to be */
enum X_POSIX_C_SOURCE = 199300L;
}
}

version (Windows) {
version (_POSIX_) {} else {
version = X_NOT_POSIX;
}
}


version (OSX) {
version = NULL_NOT_ZERO;

/* Defining any of these will sanitize the namespace to JUST want is defined by
 * that particular standard.  If that happens, we don't get some expected
 * prototypes, typedefs, etc (like fd_mask).  We can define _DARWIN_C_SOURCE to
 * loosen our belts a tad.
 */
static if (HasVersion!"_XOPEN_SOURCE" || HasVersion!"_POSIX_SOURCE" || HasVersion!"_POSIX_C_SOURCE") {
 

}

}

version (__GNU__) {
enum PATH_MAX = 4096;

enum MAXPATHLEN = 4096;

}

static if (HasVersion!"__SCO__" || HasVersion!"__UNIXWARE__") {
enum PATH_MAX =	1024;

enum MAXPATHLEN =	1024;

}

static if (HasVersion!"__OpenBSD__" || HasVersion!"__NetBSD__" || HasVersion!"__FreeBSD__" 
	|| HasVersion!"OSX" || HasVersion!"__DragonFly__") {
 

}

 /* _XOSDEFS_H_ */

