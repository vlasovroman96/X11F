module externs.X11.Xfuncs;
@nogc nothrow:
extern(C): __gshared:

private template HasVersion(string versionId) {
	mixin("version("~versionId~") {enum HasVersion = true;} else {enum HasVersion = false;}");
}
/*
 *
Copyright 1990, 1998  The Open Group

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
 */

 
public import externs.X11.Xosdefs;

/* the old Xfuncs.h, for pre-R6 */
static if (!(HasVersion!"XFree86LOADER" && HasVersion!"IN_MODULE")) {

version (X_USEBFUNCS) {
void bcopy();
void bzero();
int bcmp();
} else {
static if (HasVersion!"SYSV" && !HasVersion!"__SCO__" && !HasVersion!"__sun" && !HasVersion!"__UNIXWARE__" && !HasVersion!"_AIX") {
public import memory;
void bcopy();
enum string bzero(string b,string len) = `memset(` ~ b ~ `, 0, ` ~ len ~ `)`;
enum string bcmp(string b1,string b2,string len) = `memcmp(` ~ b1 ~ `, ` ~ b2 ~ `, ` ~ len ~ `)`;
} else {
public import core.stdc.string;
static if (HasVersion!"__SCO__" || HasVersion!"__sun" || HasVersion!"__UNIXWARE__" || HasVersion!"Cygwin" || HasVersion!"_AIX" || HasVersion!"OSX") {
public import strings;
}
// version = _XFUNCS_H_INCLUDED_STRING_H;
}
} /* X_USEBFUNCS */

/* the new Xfuncs.h */

/* the ANSI C way */
version (_XFUNCS_H_INCLUDED_STRING_H) {} else {
public import core.stdc.string;
}
//! #  undef bzero
enum string bzero(string b,string len) = `memset(` ~ b ~ `,0,` ~ len ~ `)`;

static if (HasVersion!"Windows" && HasVersion!"Windows") {
enum string bcopy(string b1,string b2,string len) = `memmove(` ~ b2 ~ `, ` ~ b1 ~ `, cast(size_t)(` ~ len ~ `))`;
}

} /* !(defined(XFree86LOADER) && defined(IN_MODULE)) */

 /* _XFUNCS_H_ */
