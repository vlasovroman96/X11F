module externs.X11.Xfuncproto;
@nogc nothrow:
extern(C): __gshared:

private template HasVersion(string versionId) {
	mixin("version("~versionId~") {enum HasVersion = true;} else {enum HasVersion = false;}");
}
// /*
//  *
// Copyright 1989, 1991, 1998  The Open Group

// Permission to use, copy, modify, distribute, and sell this software and its
// documentation for any purpose is hereby granted without fee, provided that
// the above copyright notice appear in all copies and that both that
// copyright notice and this permission notice appear in supporting
// documentation.

// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
// OPEN GROUP BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
// AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

// Except as contained in this notice, the name of The Open Group shall not be
// used in advertising or otherwise to promote the sale, use or other dealings
// in this Software without prior written authorization from The Open Group.
//  *
//  */

// /* Definitions to make function prototypes manageable */

 
// enum NeedFunctionPrototypes = 1;
//  /* NeedFunctionPrototypes */

// enum NeedVarargsPrototypes = 1;
//  /* NeedVarargsPrototypes */

// static if (NeedFunctionPrototypes) {

// enum NeedNestedPrototypes = 1;
//  /* NeedNestedPrototypes */

// enum _Xconst = const;
//  /* _Xconst */

// /* Function prototype configuration (see configure for more info) */
// static if (!HasVersion!"NARROWPROTO" && 
//     (HasVersion!"linux" || HasVersion!"__FreeBSD__" || HasVersion!"__NetBSD__" || HasVersion!"__OpenBSD__")) {
// version = NARROWPROTO;
// }
// enum FUNCPROTO = 15;


version (NeedWidePrototypes) {} else {
version (NARROWPROTO) {
enum NeedWidePrototypes = 0;
} else {
enum NeedWidePrototypes = 1		/* default to make interropt. easier */;
}
} /* NeedWidePrototypes */

// } /* NeedFunctionPrototypes */

// version (_XFUNCPROTOBEGIN) {} else {
// static if (HasVersion!"none" || HasVersion!"c_plusplus") { /* for C++ V2.0 */
// enum _XFUNCPROTOBEGIN = extern "C" {	/* do not leave open across includes */;
// enum _XFUNCPROTOEND = };
// } else {
// version = _XFUNCPROTOBEGIN;
// version = _XFUNCPROTOEND;
// }
// } /* _XFUNCPROTOBEGIN */

// /* http://clang.llvm.org/docs/LanguageExtensions.html#has-attribute */
// version (__has_attribute) {} else {
// enum string __has_attribute(string x) = `0  /* Compatibility with older compilers. */`;
// }
// version (__has_feature) {} else {
// enum string __has_feature(string x) = `0    /* Compatibility with older compilers. */`;
// }
// version (__has_extension) {} else {
// enum string __has_extension(string x) = `0  /* Compatibility with older compilers. */`;
// }
// version (__has_c_attribute) {} else {
// enum string __has_c_attribute(string x) = `0  /* Compatibility with pre-C23 compilers. */`;
// }

// /* Added in X11R6.9, so available in any version of modular xproto */
// static if (mixin(__has_attribute!(`__sentinel__`)) || (HasVersion!"__GNUC__" && (__GNUC__ >= 4))) {
// enum string _X_SENTINEL(string x) = `__attribute__ ((__sentinel__(` ~ x ~ `)))`;
// } else {
// //# define _X_SENTINEL(x)
// } /* GNUC >= 4 */

// /* Added in X11R6.9, so available in any version of modular xproto */
// static if ((mixin(__has_attribute!(`visibility`)) || (HasVersion!"__GNUC__" && (__GNUC__ >= 4))) 
//     && !HasVersion!"Cygwin" && !HasVersion!"Windows") {
// enum _X_EXPORT =      __attribute__((visibility("default")));
// enum _X_HIDDEN =      __attribute__((visibility("hidden")));
// enum _X_INTERNAL =    __attribute__((visibility("internal")));
// } else static if (HasVersion!"__SUNPRO_C" && (__SUNPRO_C >= 0x550)) {
// enum _X_EXPORT =      __global;
// enum _X_HIDDEN =      __hidden;
// enum _X_INTERNAL =    __hidden;
// } else { /* not gcc >= 4 and not Sun Studio >= 8 */
// version = _X_EXPORT;
// version = _X_HIDDEN;
// version = _X_INTERNAL;
// } /* GNUC >= 4 */

// /* Branch prediction hints for individual conditionals */
// /* requires xproto >= 7.0.9 */
// static if (HasVersion!"__GNUC__" && ((__GNUC__ * 100 + __GNUC_MINOR__) >= 303)) {
// enum string _X_LIKELY(string x) = `__builtin_expect(!!(` ~ x ~ `), 1)`;
// enum string _X_UNLIKELY(string x) = `__builtin_expect(!!(` ~ x ~ `), 0)`;
// } else { /* not gcc >= 3.3 */
// enum string _X_LIKELY(string x) = `(` ~ x ~ `)`;
// enum string _X_UNLIKELY(string x) = `(` ~ x ~ `)`;
// }

// /* Bulk branch prediction hints via marking error path functions as "cold" */
// /* requires xproto >= 7.0.25 */
// static if (mixin(__has_attribute!(`__cold__`)) || 
//     (HasVersion!"__GNUC__" && ((__GNUC__ * 100 + __GNUC_MINOR__) >= 403))) { /* 4.3+ */
// enum _X_COLD = __attribute__((__cold__));
// } else {
// version = _X_COLD; /* nothing */
// }

// /* Added in X11R6.9, so available in any version of modular xproto */
// static if (mixin(__has_attribute!(`deprecated_`)) 
//     || (HasVersion!"__GNUC__" && ((__GNUC__ * 100 + __GNUC_MINOR__) >= 301)) 
//     || (HasVersion!"__SUNPRO_C" && (__SUNPRO_C >= 0x5130))) {
// enum _X_DEPRECATED =  __attribute__((deprecated));
// } else { /* not gcc >= 3.1 */
// version = _X_DEPRECATED;
// }

// /* requires xproto >= 7.0.30 */
// static if (mixin(__has_extension!(`attribute_deprecated_with_message`)) || 
//                 (HasVersion!"__GNUC__" && ((__GNUC__ >= 5) || ((__GNUC__ == 4) && (__GNUC_MINOR__ >= 5))))) {
// enum string _X_DEPRECATED_MSG(string _msg) = `__attribute__((deprecated_(` ~ _msg ~ `)))`;
// } else {
// enum string _X_DEPRECATED_MSG(string _msg) = `_X_DEPRECATED`;
// }

// /* requires xproto >= 7.0.17 */
// static if (mixin(__has_attribute!(`noreturn`)) 
//     || (HasVersion!"__GNUC__" && ((__GNUC__ * 100 + __GNUC_MINOR__) >= 205)) 
//     || (HasVersion!"__SUNPRO_C" && (__SUNPRO_C >= 0x590))) {
// enum _X_NORETURN = __attribute((noreturn));
// } else {
// version = _X_NORETURN;
// } /* GNUC  */

// /* Added in X11R6.9, so available in any version of modular xproto */
// static if (mixin(__has_attribute!(`__format__`)) 
//     || HasVersion!"__GNUC__" && ((__GNUC__ * 100 + __GNUC_MINOR__) >= 203)) {
// enum string _X_ATTRIBUTE_PRINTF(string x,string y) = `__attribute__((__format__(__printf__,` ~ x ~ `,` ~ y ~ `)))`;
// } else { /* not gcc >= 2.3 */
// //# define _X_ATTRIBUTE_PRINTF(x,y)
// }

// /* requires xproto >= 7.0.22 */
// static if (mixin(__has_attribute!(`__unused__`)) 
//     || HasVersion!"__GNUC__" &&  ((__GNUC__ * 100 + __GNUC_MINOR__) >= 205)) {
// enum _X_UNUSED =  __attribute__((__unused__));
// } else {
// version = _X_UNUSED;  /* */
// }

// /* C99 keyword "inline" or equivalent extensions in pre-C99 compilers */
// /* requires xproto >= 7.0.9
//    (introduced in 7.0.8 but didn't support all compilers until 7.0.9) */
// static if (HasVersion!"inline" /* assume autoconf set it correctly */ || 
//    (HasVersion!"__STDC_VERSION__" && (__STDC_VERSION__ - 0 >= 199901L)) /* C99 */ || 
//    (HasVersion!"__SUNPRO_C" && (__SUNPRO_C >= 0x550))) {
// enum _X_INLINE = inline;
// } else static if (HasVersion!"__GNUC__" && !HasVersion!"__STRICT_ANSI__") { /* gcc w/C89+extensions */
// enum _X_INLINE = __inline__;
// } else {
// version = _X_INLINE;
// }

// /* C99 keyword "restrict" or equivalent extensions in pre-C99 compilers */
// /* requires xproto >= 7.0.21 */
// version (_X_RESTRICT_KYWD) {} else {
// static if (HasVersion!"restrict" /* assume autoconf set it correctly */ || 
//     (HasVersion!"__STDC_VERSION__" && (__STDC_VERSION__ - 0 >= 199901L) /* C99 */ 
//      && !HasVersion!"none")) { /* Workaround g++ issue on Solaris */
// enum _X_RESTRICT_KYWD =  restrict;
// } else static if (HasVersion!"__GNUC__" && !HasVersion!"__STRICT_ANSI__") { /* gcc w/C89+extensions */
// enum _X_RESTRICT_KYWD = __restrict__;
// } else {
// version = _X_RESTRICT_KYWD;
// }
// }

// /* requires xproto >= 7.0.30 */
// static if mixin((__has_attribute!(`no_sanitize_thread`)) {)
// enum _X_NOTSAN = __attribute__((no_sanitize_thread));
// } else {
// version = _X_NOTSAN;
// }

// /* Mark a char array/pointer as not containing a NUL-terminated string */
// /* requires xproto >= 7.0.33 */
// static if mixin((__has_attribute!(`nonstring`)) {)
// enum _X_NONSTRING = __attribute__((nonstring));
// } else {
// version = _X_NONSTRING;
// }

// /* Mark a fallthrough in a switch statement as intentional
//    Handles C23 compilers, as well as gcc >= 7 and clang >= 12
//    For older compilers/linters, pair with a fallthrough comment. */
// /* requires xproto >= 7.0.34 */
// static if mixin((__has_c_attribute!(`fallthrough`)) {)
// enum _X_FALLTHROUGH = [[fallthrough]];
// } else static if  mixin((__has_attribute!(`fallthrough`)) {)
// enum _X_FALLTHROUGH = __attribute__((fallthrough));
// } else {
// enum _X_FALLTHROUGH = (void)0;
// }

 /* _XFUNCPROTO_H_ */
