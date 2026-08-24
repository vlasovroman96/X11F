module externs.X11.Xos;
@nogc nothrow:
extern(C): __gshared:

private template HasVersion(string versionId) {
	mixin("version("~versionId~") {enum HasVersion = true;} else {enum HasVersion = false;}");
}
import core.stdc.config: c_long, c_ulong;
/*
 *
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
 *
 * The X Window System is a Trademark of The Open Group.
 *
 */

/* This is a collection of things to try and minimize system dependencies
 * in a "significant" number of source files.
 */

 
public import externs.X11.Xosdefs;

/*
 * Get major data types (esp. caddr_t)
 */

public import core.sys.posix.sys.types;

static if (HasVersion!"__SCO__" || HasVersion!"__UNIXWARE__") {
public import core.stdc.stdint;
}


/*
 * Just about everyone needs the strings routines.  We provide both forms here,
 * index/rindex and strchr/strrchr, so any systems that don't provide them all
 * need to have #defines here.
 *
 * These macros are defined this way, rather than, e.g.:
 *    #defined index(s,c) strchr(s,c)
 * because someone might be using them as function pointers, and such
 * a change would break compatibility for anyone who's relying on them
 * being the way they currently are. So we're stuck with them this way,
 * which can be really inconvenient. :-(
 */

public import core.stdc.string;
static if (HasVersion!"__SCO__" || HasVersion!"__UNIXWARE__" || HasVersion!"__sun" || HasVersion!"Cygwin" || HasVersion!"_AIX" || HasVersion!"OSX" || HasVersion!"__FreeBSD__" || HasVersion!"__OpenBSD__") {
public import strings;
} else {
version (index) {} else {
enum string index(string s,string c) = `(strchr((` ~ s ~ `),(` ~ c ~ `)))`;
}
version (rindex) {} else {
enum string rindex(string s,string c) = `(strrchr((` ~ s ~ `),(` ~ c ~ `)))`;
}
}

/*
 * Get open(2) constants
 */
version (X_NOT_POSIX) {
public import core.sys.posix.fcntl;
static if (HasVersion!"USL" || HasVersion!"__i386__" && (HasVersion!"SYSV" || HasVersion!"SVR4")) {
public import core.sys.posix.unistd;
}
version (Windows) {
public import externs.X11.Xw32defs;
} else {
public import sys.file;
}
} else { /* X_NOT_POSIX */
public import core.sys.posix.fcntl;
public import core.sys.posix.unistd;
} /* X_NOT_POSIX else */

/*
 * Get struct timeval and struct tm
 */

static if (HasVersion!"_POSIX_SOURCE" && HasVersion!"SVR4") {
/* need to omit _POSIX_SOURCE in order to get what we want in SVR4 */
//! #  undef _POSIX_SOURCE
public import core.sys.posix.sys.time;
version = _POSIX_SOURCE;
} else version (Windows) {
public import core.stdc.time;
static if (!HasVersion!"_WINSOCKAPI_" && !HasVersion!"_WILLWINSOCK_" && !HasVersion!"_TIMEVAL_DEFINED" && !HasVersion!"_STRUCT_TIMEVAL") {
struct timeval {
    c_long tv_sec;         /* seconds */
    c_long tv_usec;        /* and microseconds */
};
version = _TIMEVAL_DEFINED;
}
public import sys.timeb;
enum string gettimeofday(string t) = `
{ 
    _timeb _gtodtmp = void; 
    _ftime (&_gtodtmp); 
    (` ~ t ~ `).tv_sec = _gtodtmp.time; 
    (` ~ t ~ `).tv_usec = _gtodtmp.millitm * 1000; 
}`;
} else {
public import core.sys.posix.sys.time;
public import core.stdc.time;
} /* defined(_POSIX_SOURCE) && defined(SVR4) */

/* define X_GETTIMEOFDAY macro, a portable gettimeofday() */
static if (HasVersion!"_XOPEN_XPG4" || HasVersion!"_XOPEN_UNIX") { /* _XOPEN_UNIX is XPG4.2 */
enum string X_GETTIMEOFDAY(string t) = `` ~ gettimeofday!(t, `cast(timezone*)0`) ~ ``;
} else {
static if (HasVersion!"SVR4" || HasVersion!"__SVR4" || HasVersion!"Windows") {
enum string X_GETTIMEOFDAY(string t) = `gettimeofday(` ~ t ~ `)`;
} else {
enum string X_GETTIMEOFDAY(string t) = `` ~ gettimeofday!(t, `cast(timezone*)0`) ~ ``;
}
} /* XPG4 else */


version (__GNU__) {
enum PATH_MAX = 4096;
enum MAXPATHLEN = 4096;
enum OPEN_MAX = 256 /* We define a reasonable limit.  */;
}

/* use POSIX name for signal */
static if (HasVersion!"X_NOT_POSIX" && HasVersion!"SYSV" && !HasVersion!"SIGCHLD") {
enum SIGCHLD = SIGCLD;
}

public import externs.X11.Xarch;

 /* _XOS_H_ */
