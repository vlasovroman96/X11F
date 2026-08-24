module externs.X11.Xauth;
@nogc nothrow:
extern(C): __gshared:

private template HasVersion(string versionId) {
	mixin("version("~versionId~") {enum HasVersion = true;} else {enum HasVersion = false;}");
}
import core.stdc.config: c_long, c_ulong;
/*

Copyright 1988, 1998  The Open Group

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

// #pragma attribute(push, nogc, nothrow)
 
// /* struct xauth is full of implicit padding to properly align the pointers
//    after the length fields.   We can't clean that up without breaking ABI,
//    so tell clang not to bother complaining about it. */
// version (__clang__) {
// #pragma clang diagnostic push
// #pragma clang diagnostic ignored "-Wpadded"
// }


struct Xauth {
    ushort family;
    ushort address_length;
    char* address;
    ushort number_length;
    char* number;
    ushort name_length;
    char* name;
    ushort data_length;
    char* data;
}

// version (__clang__) {
// #pragma clang diagnostic pop
// }

version (_XAUTH_STRUCT_ONLY) {} else {

public import   externs.X11.Xfuncproto;
// public import   externs.X11.Xfuncs;

public import   core.stdc.stdio;

enum FamilyLocal = (256)	/* not part of X standard (i.e. X.h) */;
enum FamilyWild =  (65535);
enum FamilyNetname =    (254)   /* not part of X standard */;
enum FamilyKrb5Principal = (253) /* Kerberos 5 principal name */;
enum FamilyLocalHost = (252)	/* for local non-net authentication */;


// _XFUNCPROTOBEGIN

// version (__has_attribute) {} else {
// enum string __has_attribute(string x) = `0  /* Compatibility with older compilers */`;
// }

// static if mixin((__has_attribute!(`access`)) {)
// enum string XAU_ACCESS_ATTRIBUTE(string X) = `__attribute__((access ` ~ X ~ `))`;
// } else {
// //# define XAU_ACCESS_ATTRIBUTE(X)
// }

// static if mixin((__has_attribute!(`malloc`)) {)
// static if (HasVersion!"__clang__" || (HasVersion!"__GNUC__" && __GNUC__ < 11)) {
// /* Clang or gcc do not support the optional deallocator argument */
// enum string XAU_MALLOC_ATTRIBUTE(string X) = `__attribute__((malloc))`;
// } else {
// enum string XAU_MALLOC_ATTRIBUTE(string X) = `__attribute__((malloc ` ~ X ~ `))`;
// }
// } else {
// //# define XAU_MALLOC_ATTRIBUTE(X)
// }

char* XauFileName();

void XauDisposeAuth(Xauth*);

// XAU_MALLOC_ATTRIBUTE((XauDisposeAuth, 1))
Xauth* XauReadAuth(FILE*);

// XAU_ACCESS_ATTRIBUTE((read_only, 1)) /* file_name */
int XauLockAuth(const char*, int, int, c_long);

// XAU_ACCESS_ATTRIBUTE((read_only, 1)) /* file_name */
int XauUnlockAuth(const char*);

// XAU_ACCESS_ATTRIBUTE((read_only, 2)) /* auth */
int XauWriteAuth(FILE*, Xauth*);

// XAU_ACCESS_ATTRIBUTE((read_only, 3, 2)) /* address */
// XAU_ACCESS_ATTRIBUTE((read_only, 5, 4)) /* number */
// XAU_ACCESS_ATTRIBUTE((read_only, 7, 6)) /* name */
static if (NeedWidePrototypes)
{
    extern(C) Xauth* XauGetAuthByAddr(
        uint family,
        uint address_length,
        const(char)* address,
        uint number_length,
        const(char)* number,
        uint name_length,
        const(char)* name
    );
}
else
{
    extern(C) Xauth* XauGetAuthByAddr(
        ushort family,
        ushort address_length,
        const(char)* address,
        ushort number_length,
        ushort number_length_dummy, // нет, так нельзя
        const(char)* number,
        ushort name_length,
        const(char)* name
    );
}

// XAU_ACCESS_ATTRIBUTE((read_only, 3, 2)) /* address */
// XAU_ACCESS_ATTRIBUTE((read_only, 5, 4)) /* number */
// XAU_ACCESS_ATTRIBUTE((read_only, 7, 6)) /* type_names */
// XAU_ACCESS_ATTRIBUTE((read_only, 8, 6)) /* type_lengths */
static if (NeedWidePrototypes)
    alias ProtoSize = uint;
else
    alias ProtoSize = ushort;

extern(C) Xauth* XauGetBestAuthByAddr(
    ProtoSize family,
    ProtoSize address_length,
    const(char)* address,
    ProtoSize number_length,
    const(char)* number,
    int types_length,
    char** type_names,
    const(int)* type_lengths
);

// _XFUNCPROTOEND

/* Return values from XauLockAuth */

enum LOCK_SUCCESS =	0	/* lock succeeded */;
enum LOCK_ERROR =	1	/* lock unexpectedly failed, check errno */;
enum LOCK_TIMEOUT =	2	/* lock failed, timeouts expired */;

} /* _XAUTH_STRUCT_ONLY */

 /* _Xauth_h */

// #pragma attribute(pop)
