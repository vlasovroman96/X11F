module externs.X11.Xos_r;
@nogc nothrow:
extern(C): __gshared:

private template HasVersion(string versionId) {
	mixin("version("~versionId~") {enum HasVersion = true;} else {enum HasVersion = false;}");
}
/*
Copyright 1996, 1998  The Open Group

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
 * Various and sundry Thread-Safe functions used by X11, Motif, and CDE.
 *
 * Use this file in MT-safe code where you would have included
 *	<dirent.h>	for readdir()
 *	<grp.h>		for getgrgid() or getgrnam()
 *	<netdb.h>	for gethostbyname(), gethostbyaddr(), or getservbyname()
 *	<pwd.h>		for getpwnam() or getpwuid()
 *	<string.h>	for strtok()
 *	<time.h>	for asctime(), ctime(), localtime(), or gmtime()
 *	<unistd.h>	for getlogin() or ttyname()
 * or their thread-safe analogs.
 *
 * If you are on a platform that defines XTHREADS but does not have
 * MT-safe system API (e.g. UnixWare) you must define _Xos_processLock
 * and _Xos_processUnlock macros before including this header.
 *
 * For convenience XOS_USE_XLIB_LOCKING or XOS_USE_XT_LOCKING may be defined
 * to obtain either Xlib-only or Xt-based versions of these macros.  These
 * macros won't result in truly thread-safe calls, but they are better than
 * nothing.  If you do not want locking in this situation define
 * XOS_USE_NO_LOCKING.
 *
 * NOTE: On systems lacking appropriate _r functions Gethostbyname(),
 *	Gethostbyaddr(), and Getservbyname() do NOT copy the host or
 *	protocol lists!
 *
 * NOTE: On systems lacking appropriate _r functions Getgrgid() and
 *	Getgrnam() do NOT copy the list of group members!
 *
 * This header is nominally intended to simplify porting X11, Motif, and
 * CDE; it may be useful to other people too.  The structure below is
 * complicated, mostly because P1003.1c (the IEEE POSIX Threads spec)
 * went through lots of drafts, and some vendors shipped systems based
 * on draft API that were changed later.  Unfortunately POSIX did not
 * provide a feature-test macro for distinguishing each of the drafts.
 */

/*
 * This header has several parts.  Search for "Effective prototypes"
 * to locate the beginning of a section.
 */

/* This header can be included multiple times with different defines! */
 
public import externs.X11.Xos;
public import externs.X11.Xfuncs;

version (X_NOT_POSIX) {} else {
version (_POSIX_SOURCE) {
public import core.stdc.limits;
} else {
// version = _POSIX_SOURCE;
public import core.stdc.limits;
//! #   undef _POSIX_SOURCE
}
version (LINE_MAX) {} else {
enum X_LINE_MAX = 2048;
} version (LINE_MAX) {
enum X_LINE_MAX = LINE_MAX;
}
}
 /* _XOS_R_H */

version (Windows) {} else {


version (XOS_USE_XLIB_LOCKING) {
version (XAllocIDs) {} else { /* Xlibint.h does not have multiple include protection */
alias LockInfoPtr = _LockInfoRec*;
extern LockInfoPtr _Xglobal_lock;
}
enum _Xos_isThreadInitialized =	(_Xglobal_lock);

static if (HasVersion!"XTHREADS_WARN" || HasVersion!"XTHREADS_FILE_LINE") {
version (XAllocIDs) {} else { /* Xlibint.h does not have multiple include protection */
public import externs.X11.Xfuncproto;	/* for NeedFunctionPrototypes */
extern void function(NeedFunctionPrototypes LockInfoPtr, char*, int) _XLockMutex_fn;
extern void function(NeedFunctionPrototypes LockInfoPtr, char*, int) _XUnlockMutex_fn;
}
enum _Xos_processLock =	
  (_XLockMutex_fn ? (*_XLockMutex_fn)(_Xglobal_lock,__FILE__,__LINE__) : 0);

enum _Xos_processUnlock =	
  (_XUnlockMutex_fn ? (*_XUnlockMutex_fn)(_Xglobal_lock,__FILE__,__LINE__) : 0);

} else {
version (XAllocIDs) {} else { /* Xlibint.h does not have multiple include protection */
public import externs.X11.Xfuncproto;	/* for NeedFunctionPrototypes */
extern void function(NeedFunctionPrototypes LockInfoPtr) _XLockMutex_fn;
extern void function(NeedFunctionPrototypes LockInfoPtr) _XUnlockMutex_fn;
}
enum _Xos_processLock =	
  (_XLockMutex_fn ? ((*_XLockMutex_fn)(_Xglobal_lock), 0) : 0);

enum _Xos_processUnlock =	
  (_XUnlockMutex_fn ? ((*_XUnlockMutex_fn)(_Xglobal_lock), 0) : 0);

}
} else version (XOS_USE_XT_LOCKING) {
version (_XtThreadsI_h) {} else {
extern void function() _XtProcessLock;
}
version (_XtintrinsicP_h) {} else {
public import externs.X11.Xfuncproto;	/* for NeedFunctionPrototypes */
extern void XtProcessLock();
extern void XtProcessUnlock();
}
enum _Xos_isThreadInitialized =	_XtProcessLock;

enum _Xos_processLock =		XtProcessLock();

enum _Xos_processUnlock =		XtProcessUnlock();

} else version (XOS_USE_NO_LOCKING) {
enum _Xos_isThreadInitialized =	0;

enum _Xos_processLock =		0;

enum _Xos_processUnlock =		0;

}

} /* !defined WIN32 */

/*
 * Solaris defines the POSIX thread-safe feature test macro, but
 * uses the older SVR4 thread-safe functions unless the POSIX ones
 * are specifically requested.  Fix the feature test macro.
 */
static if (HasVersion!"__sun" && HasVersion!"_POSIX_THREAD_SAFE_FUNCTIONS" && 
	(_POSIX_C_SOURCE - 0 < 199506L) && !HasVersion!"_POSIX_PTHREAD_SEMANTICS") {
//! # undef _POSIX_THREAD_SAFE_FUNCTIONS
}

/***** <pwd.h> wrappers *****/

/*
 * Effective prototypes for <pwd.h> wrappers:
 *
 * #define X_INCLUDE_PWD_H
 * #define XOS_USE_..._LOCKING
 * #include <X11/Xos_r.h>
 *
 * typedef ... _Xgetpwparams;
 *
 * struct passwd* _XGetpwnam(const char *name, _Xgetpwparams);
 * struct passwd* _XGetpwuid(uid_t uid, _Xgetpwparams);
 */

static if (HasVersion!"X_INCLUDE_PWD_H" && !HasVersion!"_XOS_INCLUDED_PWD_H") {
public import core.sys.posix.pwd;
static if (HasVersion!"XUSE_MTSAFE_API" || HasVersion!"XUSE_MTSAFE_PWDAPI") {
enum XOS_USE_MTSAFE_PWDAPI = 1;
}
}

static if (!HasVersion!"X_INCLUDE_PWD_H" || HasVersion!"_XOS_INCLUDED_PWD_H") {
/* Do nothing */

} else static if (!HasVersion!"XTHREADS" && !HasVersion!"X_FORCE_USE_MTSAFE_API") {
/* Use regular, unsafe API. */
static if (HasVersion!"X_NOT_POSIX" && !HasVersion!"__i386__" && !HasVersion!"SYSV") {
extern passwd* getpwuid(); extern passwd* getpwnam();
}
alias _Xgetpwparams = int;	/* dummy */
enum string _XGetpwuid(string u,string p) = `getpwuid((` ~ u ~ `))`;
enum string _XGetpwnam(string u,string p) = `getpwnam((` ~ u ~ `))`;

} else static if (!HasVersion!"XOS_USE_MTSAFE_PWDAPI" || HasVersion!"XNO_MTSAFE_PWDAPI") {
/* UnixWare 2.0, or other systems with thread support but no _r API. */
version = X_NEEDS_PWPARAMS;
struct _Xgetpwparams {
  passwd pws;
  char[1024] pwbuf = 0;
  passwd* pwp;
  size_t len;
}

/*
 * NetBSD and FreeBSD, at least, are missing several of the unixware passwd
 * fields.
 */

static if (HasVersion!"__NetBSD__" || HasVersion!"__FreeBSD__" || HasVersion!"__OpenBSD__" || 
    HasVersion!"OSX" || HasVersion!"__DragonFly__") {
private __inline__ _Xpw_copyPasswd(_Xgetpwparams p)
{
   memcpy(&(p).pws, (p).pwp, passwd.sizeof);

   (p).pws.pw_name = (p).pwbuf;
   (p).len = strlen((p).pwp.pw_name);
   strcpy((p).pws.pw_name, (p).pwp.pw_name);

   (p).pws.pw_passwd = (p).pws.pw_name + (p).len + 1;
   (p).len = strlen((p).pwp.pw_passwd);
   strcpy((p).pws.pw_passwd,(p).pwp.pw_passwd);

   (p).pws.pw_class = (p).pws.pw_passwd + (p).len + 1;
   (p).len = strlen((p).pwp.pw_class);
   strcpy((p).pws.pw_class, (p).pwp.pw_class);

   (p).pws.pw_gecos = (p).pws.pw_class + (p).len + 1;
   (p).len = strlen((p).pwp.pw_gecos);
   strcpy((p).pws.pw_gecos, (p).pwp.pw_gecos);

   (p).pws.pw_dir = (p).pws.pw_gecos + (p).len + 1;
   (p).len = strlen((p).pwp.pw_dir);
   strcpy((p).pws.pw_dir, (p).pwp.pw_dir);

   (p).pws.pw_shell = (p).pws.pw_dir + (p).len + 1;
   (p).len = strlen((p).pwp.pw_shell);
   strcpy((p).pws.pw_shell, (p).pwp.pw_shell);

   (p).pwp = &(p).pws;
}

} else {
enum string _Xpw_copyPasswd(string p) = `
   (memcpy(&(` ~ p ~ `).pws, (` ~ p ~ `).pwp, passwd.sizeof), 
    ((` ~ p ~ `).pws.pw_name = (` ~ p ~ `).pwbuf), 
    ((` ~ p ~ `).len = strlen((` ~ p ~ `).pwp.pw_name)), 
    strcpy((` ~ p ~ `).pws.pw_name, (` ~ p ~ `).pwp.pw_name), 
    ((` ~ p ~ `).pws.pw_passwd = (` ~ p ~ `).pws.pw_name + (` ~ p ~ `).len + 1), 
    ((` ~ p ~ `).len = strlen((` ~ p ~ `).pwp.pw_passwd)), 
    strcpy((` ~ p ~ `).pws.pw_passwd,(` ~ p ~ `).pwp.pw_passwd), 
    ((` ~ p ~ `).pws.pw_age = (` ~ p ~ `).pws.pw_passwd + (` ~ p ~ `).len + 1), 
    ((` ~ p ~ `).len = strlen((` ~ p ~ `).pwp.pw_age)), 
    strcpy((` ~ p ~ `).pws.pw_age, (` ~ p ~ `).pwp.pw_age), 
    ((` ~ p ~ `).pws.pw_comment = (` ~ p ~ `).pws.pw_age + (` ~ p ~ `).len + 1), 
    ((` ~ p ~ `).len = strlen((` ~ p ~ `).pwp.pw_comment)), 
    strcpy((` ~ p ~ `).pws.pw_comment, (` ~ p ~ `).pwp.pw_comment), 
    ((` ~ p ~ `).pws.pw_gecos = (` ~ p ~ `).pws.pw_comment + (` ~ p ~ `).len + 1), 
    ((` ~ p ~ `).len = strlen((` ~ p ~ `).pwp.pw_gecos)), 
    strcpy((` ~ p ~ `).pws.pw_gecos, (` ~ p ~ `).pwp.pw_gecos), 
    ((` ~ p ~ `).pws.pw_dir = (` ~ p ~ `).pws.pw_comment + (` ~ p ~ `).len + 1), 
    ((` ~ p ~ `).len = strlen((` ~ p ~ `).pwp.pw_dir)), 
    strcpy((` ~ p ~ `).pws.pw_dir, (` ~ p ~ `).pwp.pw_dir), 
    ((` ~ p ~ `).pws.pw_shell = (` ~ p ~ `).pws.pw_dir + (` ~ p ~ `).len + 1), 
    ((` ~ p ~ `).len = strlen((` ~ p ~ `).pwp.pw_shell)), 
    strcpy((` ~ p ~ `).pws.pw_shell, (` ~ p ~ `).pwp.pw_shell), 
    ((` ~ p ~ `).pwp = &(` ~ p ~ `).pws), 
    0 )`;
}
enum string _XGetpwuid(string u,string p) = `
( (_Xos_processLock), 
  (((` ~ p ~ `).pwp = getpwuid((` ~ u ~ `))) ? ` ~ _Xpw_copyPasswd!(p) ~ `, 0 : 0), 
  (_Xos_processUnlock), 
  (` ~ p ~ `).pwp )`;
enum string _XGetpwnam(string u,string p) = `
( (_Xos_processLock), 
  (((` ~ p ~ `).pwp = getpwnam((` ~ u ~ `))) ? ` ~ _Xpw_copyPasswd!(p) ~ `, 0 : 0), 
  (_Xos_processUnlock), 
  (` ~ p ~ `).pwp )`;

} else static if (!HasVersion!"_POSIX_THREAD_SAFE_FUNCTIONS" && !HasVersion!"OSX") {
version = X_NEEDS_PWPARAMS;
struct _Xgetpwparams {
  passwd pws;
  char[X_LINE_MAX] pwbuf = 0;
}
static if (HasVersion!"_POSIX_REENTRANT_FUNCTIONS" || !HasVersion!"SVR4") {
enum string _XGetpwuid(string u,string p) = `
((getpwuid_r((` ~ u ~ `),&(` ~ p ~ `).pws,(` ~ p ~ `).pwbuf,typeof((` ~ p ~ `).pwbuf).sizeof) == -1) ? null : &(` ~ p ~ `).pws)`;
enum string _XGetpwnam(string u,string p) = `
((getpwnam_r((` ~ u ~ `),&(` ~ p ~ `).pws,(` ~ p ~ `).pwbuf,typeof((` ~ p ~ `).pwbuf).sizeof) == -1) ? null : &(` ~ p ~ `).pws)`;
} else { /* SVR4 */
enum string _XGetpwuid(string u,string p) = `
((getpwuid_r((` ~ u ~ `),&(` ~ p ~ `).pws,(` ~ p ~ `).pwbuf,typeof((` ~ p ~ `).pwbuf).sizeof) == null) ? null : &(` ~ p ~ `).pws)`;
enum string _XGetpwnam(string u,string p) = `
((getpwnam_r((` ~ u ~ `),&(` ~ p ~ `).pws,(` ~ p ~ `).pwbuf,typeof((` ~ p ~ `).pwbuf).sizeof) == null) ? null : &(` ~ p ~ `).pws)`;
} /* SVR4 */

} else { /* _POSIX_THREAD_SAFE_FUNCTIONS */
version = X_NEEDS_PWPARAMS;
struct _Xgetpwparams {
  passwd pws;
  char[X_LINE_MAX] pwbuf = 0;
  passwd* pwp;
}
alias _Xgetpwret = int;
enum string _XGetpwuid(string u,string p) = `
((getpwuid_r((` ~ u ~ `),&(` ~ p ~ `).pws,(` ~ p ~ `).pwbuf,typeof((` ~ p ~ `).pwbuf).sizeof,&(` ~ p ~ `).pwp) == 0) ? 
 (` ~ p ~ `).pwp : null)`;
enum string _XGetpwnam(string u,string p) = `
((getpwnam_r((` ~ u ~ `),&(` ~ p ~ `).pws,(` ~ p ~ `).pwbuf,typeof((` ~ p ~ `).pwbuf).sizeof,&(` ~ p ~ `).pwp) == 0) ? 
 (` ~ p ~ `).pwp : null)`;
} /* X_INCLUDE_PWD_H */

static if (HasVersion!"X_INCLUDE_PWD_H" && !HasVersion!"_XOS_INCLUDED_PWD_H") {
version = _XOS_INCLUDED_PWD_H;
}


/***** <netdb.h> wrappers *****/

/*
 * Effective prototypes for <netdb.h> wrappers:
 *
 * NOTE: On systems lacking the appropriate _r functions Gethostbyname(),
 *	Gethostbyaddr(), and Getservbyname() do NOT copy the host or
 *	protocol lists!
 *
 * #define X_INCLUDE_NETDB_H
 * #define XOS_USE_..._LOCKING
 * #include <X11/Xos_r.h>
 *
 * typedef ... _Xgethostbynameparams;
 * typedef ... _Xgetservbynameparams;
 *
 * struct hostent* _XGethostbyname(const char* name,_Xgethostbynameparams);
 * struct hostent* _XGethostbyaddr(const char* addr, int len, int type,
 *				   _Xgethostbynameparams);
 * struct servent* _XGetservbyname(const char* name, const char* proto,
 *				 _Xgetservbynameparams);
 */

static if (HasVersion!"X_INCLUDE_NETDB_H" && !HasVersion!"_XOS_INCLUDED_NETDB_H" 
    && !HasVersion!"Windows") {
public import core.sys.posix.netdb;
static if (HasVersion!"XUSE_MTSAFE_API" || HasVersion!"XUSE_MTSAFE_NETDBAPI") {
enum XOS_USE_MTSAFE_NETDBAPI = 1;
}
}

static if (!HasVersion!"X_INCLUDE_NETDB_H" || HasVersion!"_XOS_INCLUDED_NETDB_H") {
/* Do nothing. */

} else static if (!HasVersion!"XTHREADS" && !HasVersion!"X_FORCE_USE_MTSAFE_API") {
/* Use regular, unsafe API. */
alias _Xgethostbynameparams = int; /* dummy */
alias _Xgetservbynameparams = int; /* dummy */
enum string _XGethostbyname(string h,string hp) = `gethostbyname((` ~ h ~ `))`;
enum string _XGethostbyaddr(string a,string al,string t,string hp) = `gethostbyaddr((` ~ a ~ `),(` ~ al ~ `),(` ~ t ~ `))`;
enum string _XGetservbyname(string s,string p,string sp) = `getservbyname((` ~ s ~ `),(` ~ p ~ `))`;

} else static if (!HasVersion!"XOS_USE_MTSAFE_NETDBAPI" || HasVersion!"XNO_MTSAFE_NETDBAPI") {
/* WARNING:  The h_addr_list and s_aliases values are *not* copied! */

static if (HasVersion!"__NetBSD__" || HasVersion!"__FreeBSD__" || HasVersion!"__DragonFly__") {
public import sys.param;
}

struct _Xgethostbynameparams {
  hostent hent;
  char[MAXHOSTNAMELEN] h_name = 0;
  hostent* hptr;
}
struct _Xgetservbynameparams {
  servent sent;
  char[255] s_name = 0;
  char[255] s_proto = 0;
  servent* sptr;
}

version = XTHREADS_NEEDS_BYNAMEPARAMS;

enum string _Xg_copyHostent(string hp) = `
   (memcpy(&(` ~ hp ~ `).hent, (` ~ hp ~ `).hptr, hostent.sizeof), 
    strcpy((` ~ hp ~ `).h_name, (` ~ hp ~ `).hptr.h_name), 
    ((` ~ hp ~ `).hent.h_name = (` ~ hp ~ `).h_name), 
    ((` ~ hp ~ `).hptr = &(` ~ hp ~ `).hent), 
     0 )`;
enum string _Xg_copyServent(string sp) = `
   (memcpy(&(` ~ sp ~ `).sent, (` ~ sp ~ `).sptr, servent.sizeof), 
    strcpy((` ~ sp ~ `).s_name, (` ~ sp ~ `).sptr.s_name), 
    ((` ~ sp ~ `).sent.s_name = (` ~ sp ~ `).s_name), 
    strcpy((` ~ sp ~ `).s_proto, (` ~ sp ~ `).sptr.s_proto), 
    ((` ~ sp ~ `).sent.s_proto = (` ~ sp ~ `).s_proto), 
    ((` ~ sp ~ `).sptr = &(` ~ sp ~ `).sent), 
    0 )`;
enum string _XGethostbyname(string h,string hp) = `
   ((_Xos_processLock), 
    (((` ~ hp ~ `).hptr = gethostbyname((` ~ h ~ `))) ? ` ~ _Xg_copyHostent!(hp) ~ ` : 0), 
    (_Xos_processUnlock), 
    (` ~ hp ~ `).hptr )`;
enum string _XGethostbyaddr(string a,string al,string t,string hp) = `
   ((_Xos_processLock), 
    (((` ~ hp ~ `).hptr = gethostbyaddr((` ~ a ~ `),(` ~ al ~ `),(` ~ t ~ `))) ? ` ~ _Xg_copyHostent!(hp) ~ ` : 0), 
    (_Xos_processUnlock), 
    (` ~ hp ~ `).hptr )`;
enum string _XGetservbyname(string s,string p,string sp) = `
   ((_Xos_processLock), 
    (((` ~ sp ~ `).sptr = getservbyname((` ~ s ~ `),(` ~ p ~ `))) ? ` ~ _Xg_copyServent!(sp) ~ ` : 0), 
    (_Xos_processUnlock), 
    (` ~ sp ~ `).sptr )`;

} else version (XUSE_NETDB_R_API) {
/*
 * POSIX does not specify _r equivalents for <netdb.h> API, but some
 * vendors provide them anyway.  Use them only when explicitly asked.
 */
version (_POSIX_REENTRANT_FUNCTIONS) {
version (_POSIX_THREAD_SAFE_FUNCTIONS) {} else {
}
}
version (_POSIX_THREAD_SAFE_FUNCTIONS) {
enum X_POSIX_THREAD_SAFE_FUNCTIONS = 1;
}

version = XTHREADS_NEEDS_BYNAMEPARAMS;

version (X_POSIX_THREAD_SAFE_FUNCTIONS) {} else {
struct _Xgethostbynameparams {
    hostent hent;
    char[X_LINE_MAX] hbuf = 0;
    int herr;
}
struct _Xgetservbynameparams {
    servent sent;
    char[X_LINE_MAX] sbuf = 0;
}
enum string _XGethostbyname(string h,string hp) = `
  gethostbyname_r((` ~ h ~ `),&(` ~ hp ~ `).hent,(` ~ hp ~ `).hbuf,typeof((` ~ hp ~ `).hbuf).sizeof,&(` ~ hp ~ `).herr)`;
enum string _XGethostbyaddr(string a,string al,string t,string hp) = `
  gethostbyaddr_r((` ~ a ~ `),(` ~ al ~ `),(` ~ t ~ `),&(` ~ hp ~ `).hent,(` ~ hp ~ `).hbuf,typeof((` ~ hp ~ `).hbuf).sizeof,&(` ~ hp ~ `).herr)`;
enum string _XGetservbyname(string s,string p,string sp) = `
  getservbyname_r((` ~ s ~ `),(` ~ p ~ `),&(` ~ sp ~ `).sent,(` ~ sp ~ `).sbuf,typeof((` ~ sp ~ `).sbuf).sizeof)`;
} version (X_POSIX_THREAD_SAFE_FUNCTIONS) {
struct _Xgethostbynameparams {
  hostent hent;
  hostent_data hdata;
}
struct _Xgetservbynameparams {
  servent sent;
  servent_data sdata;
}
enum string _XGethostbyname(string h,string hp) = `
  (bzero(cast(char*)&(` ~ hp ~ `).hdata,typeof((` ~ hp ~ `).hdata).sizeof),	
   ((gethostbyname_r((` ~ h ~ `),&(` ~ hp ~ `).hent,&(` ~ hp ~ `).hdata) == -1) ? null : &(` ~ hp ~ `).hent))`;
enum string _XGethostbyaddr(string a,string al,string t,string hp) = `
  (bzero(cast(char*)&(` ~ hp ~ `).hdata,typeof((` ~ hp ~ `).hdata).sizeof),	
   ((gethostbyaddr_r((` ~ a ~ `),(` ~ al ~ `),(` ~ t ~ `),&(` ~ hp ~ `).hent,&(` ~ hp ~ `).hdata) == -1) ? null : &(` ~ hp ~ `).hent))`;
enum string _XGetservbyname(string s,string p,string sp) = `
  (bzero(cast(char*)&(` ~ sp ~ `).sdata,typeof((` ~ sp ~ `).sdata).sizeof),	
   ((getservbyname_r((` ~ s ~ `),(` ~ p ~ `),&(` ~ sp ~ `).sent,&(` ~ sp ~ `).sdata) == -1) ? null : &(` ~ sp ~ `).sent) )`;
}
version (X_POSIX_THREAD_SAFE_FUNCTIONS) {
//! #  undef X_POSIX_THREAD_SAFE_FUNCTIONS
}

} else {
/* The regular API is assumed to be MT-safe under POSIX. */
alias _Xgethostbynameparams = int; /* dummy */
alias _Xgetservbynameparams = int; /* dummy */
enum string _XGethostbyname(string h,string hp) = `gethostbyname((` ~ h ~ `))`;
enum string _XGethostbyaddr(string a,string al,string t,string hp) = `gethostbyaddr((` ~ a ~ `),(` ~ al ~ `),(` ~ t ~ `))`;
enum string _XGetservbyname(string s,string p,string sp) = `getservbyname((` ~ s ~ `),(` ~ p ~ `))`;
} /* X_INCLUDE_NETDB_H */

static if (HasVersion!"X_INCLUDE_NETDB_H" && !HasVersion!"_XOS_INCLUDED_NETDB_H") {
version = _XOS_INCLUDED_NETDB_H;
}


/***** <dirent.h> wrappers *****/

/*
 * Effective prototypes for <dirent.h> wrappers:
 *
 * #define X_INCLUDE_DIRENT_H
 * #define XOS_USE_..._LOCKING
 * #include <X11/Xos_r.h>
 *
 * typedef ... _Xreaddirparams;
 *
 * struct dirent *_XReaddir(DIR *dir_pointer, _Xreaddirparams);
 */

static if (HasVersion!"X_INCLUDE_DIRENT_H" && !HasVersion!"_XOS_INCLUDED_DIRENT_H") {
public import core.sys.posix.sys.types;
static if (!HasVersion!"X_NOT_POSIX" || HasVersion!"SYSV") {
public import core.sys.posix.dirent;
} else {
public import sys.dir;
enum dirent = direct;

}
static if (HasVersion!"XUSE_MTSAFE_API" || HasVersion!"XUSE_MTSAFE_DIRENTAPI") {
enum XOS_USE_MTSAFE_DIRENTAPI = 1;
}
}

static if (!HasVersion!"X_INCLUDE_DIRENT_H" || HasVersion!"_XOS_INCLUDED_DIRENT_H") {
/* Do nothing. */

} else static if (!HasVersion!"XTHREADS" && !HasVersion!"X_FORCE_USE_MTSAFE_API") {
/* Use regular, unsafe API. */
alias _Xreaddirparams = int;	/* dummy */
enum string _XReaddir(string d,string p) = `readdir(` ~ d ~ `)`;

} else static if (!HasVersion!"XOS_USE_MTSAFE_DIRENTAPI" || HasVersion!"XNO_MTSAFE_DIRENTAPI") {
/* Systems with thread support but no _r API. */
struct _Xreaddirparams {
  dirent* result;
  dirent dir_entry;
version (_POSIX_PATH_MAX) {
  char[_POSIX_PATH_MAX] buf = 0;
} else version (NAME_MAX) {
  char[NAME_MAX] buf = 0;
} else {
  char[255] buf = 0;
}
}

enum string _XReaddir(string d,string p) = `
 ( (_Xos_processLock),						 
   (((` ~ p ~ `).result = readdir((` ~ d ~ `))) ?				 
    (memcpy(&((` ~ p ~ `).dir_entry), (` ~ p ~ `).result, (` ~ p ~ `).result.d_reclen), 
     ((` ~ p ~ `).result = &(` ~ p ~ `).dir_entry), 0) :			 
    0),								 
   (_Xos_processUnlock),					 
   (` ~ p ~ `).result )`;

} else {
struct _Xreaddirparams {
  dirent* result;
  dirent dir_entry;
version (_POSIX_PATH_MAX) {
  char[_POSIX_PATH_MAX] buf = 0;
} else version (NAME_MAX) {
  char[NAME_MAX] buf = 0;
} else {
  char[255] buf = 0;
}
}

static if (HasVersion!"_POSIX_THREAD_SAFE_FUNCTIONS" || HasVersion!"OSX") {
/* POSIX final API, returns (int)0 on success. */
enum string _XReaddir(string d,string p) = `
    (readdir_r((` ~ d ~ `), &((` ~ p ~ `).dir_entry), &((` ~ p ~ `).result)) ? null : (` ~ p ~ `).result)`;
} else version (_POSIX_REENTRANT_FUNCTIONS) {
/* POSIX draft API, returns (int)0 on success. */
enum string _XReaddir(string d,string p) = `
    (readdir_r((` ~ d ~ `),&((` ~ p ~ `).dir_entry)) ? null : &((` ~ p ~ `).dir_entry))`;
} else version (SVR4) {
/* Pre-POSIX API, returns non-NULL on success. */
enum string _XReaddir(string d,string p) = `(readdir_r((` ~ d ~ `), &(` ~ p ~ `).dir_entry))`;
} else {
/* We have no idea what is going on.  Fake it all using process locks. */
enum string _XReaddir(string d,string p) = `
    ( (_Xos_processLock),						
      (((` ~ p ~ `).result = readdir((` ~ d ~ `))) ?					
       (memcpy(&((` ~ p ~ `).dir_entry), (` ~ p ~ `).result, (` ~ p ~ `).result.d_reclen),	
	((` ~ p ~ `).result = &(` ~ p ~ `).dir_entry), 0) :				
       0),								
      (_Xos_processUnlock),						
      (` ~ p ~ `).result )`;
}
} /* X_INCLUDE_DIRENT_H */

static if (HasVersion!"X_INCLUDE_DIRENT_H" && !HasVersion!"_XOS_INCLUDED_DIRENT_H") {
version = _XOS_INCLUDED_DIRENT_H;
}


/***** <unistd.h> wrappers *****/

/*
 * Effective prototypes for <unistd.h> wrappers:
 *
 * #define X_INCLUDE_UNISTD_H
 * #define XOS_USE_..._LOCKING
 * #include <X11/Xos_r.h>
 *
 * typedef ... _Xgetloginparams;
 * typedef ... _Xttynameparams;
 *
 * char *_XGetlogin(_Xgetloginparams);
 * char *_XTtyname(int, _Xttynameparams);
 */

static if (HasVersion!"X_INCLUDE_UNISTD_H" && !HasVersion!"_XOS_INCLUDED_UNISTD_H") {
/* <unistd.h> already included by <X11/Xos.h> */
static if (HasVersion!"XUSE_MTSAFE_API" || HasVersion!"XUSE_MTSAFE_UNISTDAPI") {
enum XOS_USE_MTSAFE_UNISTDAPI = 1;
}
}

static if (!HasVersion!"X_INCLUDE_UNISTD_H" || HasVersion!"_XOS_INCLUDED_UNISTD_H") {
/* Do nothing. */

} else static if (!HasVersion!"XTHREADS" && !HasVersion!"X_FORCE_USE_MTSAFE_API") {
/* Use regular, unsafe API. */
alias _Xgetloginparams = int;	/* dummy */
alias _Xttynameparams = int;	/* dummy */
enum string _XGetlogin(string p) = `getlogin()`;
enum string _XTtyname(string f) = `ttyname((` ~ f ~ `))`;

} else static if (!HasVersion!"XOS_USE_MTSAFE_UNISTDAPI" || HasVersion!"XNO_MTSAFE_UNISTDAPI") {
/* Systems with thread support but no _r API. */
struct _Xgetloginparams {
  char* result;
version (MAXLOGNAME) {
  char[MAXLOGNAME] buf = 0;
} else version (LOGIN_NAME_MAX) {
  char[LOGIN_NAME_MAX] buf = 0;
} else {
  char[64] buf = 0;
}
}
struct _Xttynameparams {
  char* result;
version (TTY_NAME_MAX) {
  char[TTY_NAME_MAX] buf = 0;
} else version (_POSIX_TTY_NAME_MAX) {
  char[_POSIX_TTY_NAME_MAX] buf = 0;
} else version (_POSIX_PATH_MAX) {
  char[_POSIX_PATH_MAX] buf = 0;
} else {
  char[256] buf = 0;
}
}

enum string _XGetlogin(string p) = `
 ( (_Xos_processLock), 
   (((` ~ p ~ `).result = getlogin()) ? 
    (strncpy((` ~ p ~ `).buf, (` ~ p ~ `).result, typeof((` ~ p ~ `).buf).sizeof), 
     ((` ~ p ~ `).buf[(((` ~ p ~ `).buf)-1).sizeof] = '0'), 
     ((` ~ p ~ `).result = (` ~ p ~ `).buf), 0) : 0), 
   (_Xos_processUnlock), 
   (` ~ p ~ `).result )`;
enum string _XTtyname(string f,string p) = `
 ( (_Xos_processLock), 
   (((` ~ p ~ `).result = ttyname(` ~ f ~ `)) ? 
    (strncpy((` ~ p ~ `).buf, (` ~ p ~ `).result, typeof((` ~ p ~ `).buf).sizeof), 
     ((` ~ p ~ `).buf[(((` ~ p ~ `).buf)-1).sizeof] = '0'), 
     ((` ~ p ~ `).result = (` ~ p ~ `).buf), 0) : 0), 
   (_Xos_processUnlock), 
   (` ~ p ~ `).result )`;

} else static if (HasVersion!"_POSIX_THREAD_SAFE_FUNCTIONS" || HasVersion!"_POSIX_REENTRANT_FUNCTIONS") {
/* POSIX API.
 *
 * extern int getlogin_r(char *, size_t);
 * extern int ttyname_r(int, char *, size_t);
 */
struct _Xgetloginparams {
version (MAXLOGNAME) {
  char[MAXLOGNAME] buf = 0;
} else version (LOGIN_NAME_MAX) {
  char[LOGIN_NAME_MAX] buf = 0;
} else {
  char[64] buf = 0;
}
}
struct _Xttynameparams {
version (TTY_NAME_MAX) {
  char[TTY_NAME_MAX] buf = 0;
} else version (_POSIX_TTY_NAME_MAX) {
  char[_POSIX_TTY_NAME_MAX] buf = 0;
} else version (_POSIX_PATH_MAX) {
  char[_POSIX_PATH_MAX] buf = 0;
} else {
  char[256] buf = 0;
}
}

enum string _XGetlogin(string p) = `(getlogin_r((` ~ p ~ `).buf, typeof((` ~ p ~ `).buf).sizeof) ? null : (` ~ p ~ `).buf)`;
enum string _XTtyname(string f,string p) = `
	(ttyname_r((` ~ f ~ `), (` ~ p ~ `).buf, typeof((` ~ p ~ `).buf).sizeof) ? null : (` ~ p ~ `).buf)`;

} else {
/* Pre-POSIX API.
 *
 * extern char *getlogin_r(char *, size_t);
 * extern char *ttyname_r(int, char *, size_t);
 */
struct _Xgetloginparams {
version (MAXLOGNAME) {
  char[MAXLOGNAME] buf = 0;
} else version (LOGIN_NAME_MAX) {
  char[LOGIN_NAME_MAX] buf = 0;
} else {
  char[64] buf = 0;
}
}
struct _Xttynameparams {
version (TTY_NAME_MAX) {
  char[TTY_NAME_MAX] buf = 0;
} else version (_POSIX_TTY_NAME_MAX) {
  char[_POSIX_TTY_NAME_MAX] buf = 0;
} else version (_POSIX_PATH_MAX) {
  char[_POSIX_PATH_MAX] buf = 0;
} else {
  char[256] buf = 0;
}
}

enum string _XGetlogin(string p) = `getlogin_r((` ~ p ~ `).buf, typeof((` ~ p ~ `).buf).sizeof)`;
enum string _XTtyname(string f,string p) = `ttyname_r((` ~ f ~ `), (` ~ p ~ `).buf, typeof((` ~ p ~ `).buf).sizeof)`;
} /* X_INCLUDE_UNISTD_H */

static if (HasVersion!"X_INCLUDE_UNISTD_H" && !HasVersion!"_XOS_INCLUDED_UNISTD_H") {
version = _XOS_INCLUDED_UNISTD_H;
}


/***** <string.h> wrappers *****/

/*
 * Effective prototypes for <string.h> wrappers:
 *
 * #define X_INCLUDE_STRING_H
 * #define XOS_USE_..._LOCKING
 * #include <X11/Xos_r.h>
 *
 * typedef ... _Xstrtokparams;
 *
 * char *_XStrtok(char *, const char*, _Xstrtokparams);
 */

static if (HasVersion!"X_INCLUDE_STRING_H" && !HasVersion!"_XOS_INCLUDED_STRING_H") {
/* <string.h> has already been included by <X11/Xos.h> */
static if (HasVersion!"XUSE_MTSAFE_API" || HasVersion!"XUSE_MTSAFE_STRINGAPI") {
enum XOS_USE_MTSAFE_STRINGAPI = 1;
}
}

static if (!HasVersion!"X_INCLUDE_STRING_H" || HasVersion!"_XOS_INCLUDED_STRING_H") {
/* Do nothing. */

} else static if (!HasVersion!"XTHREADS" && !HasVersion!"X_FORCE_USE_MTSAFE_API") {
/* Use regular, unsafe API. */
alias _Xstrtokparams = int;	/* dummy */
enum string _XStrtok(string s1,string s2,string p) = `
 ( ` ~ p ~ ` = 0, cast(void)` ~ p ~ `, strtok((` ~ s1 ~ `),(` ~ s2 ~ `)) )`;

} else static if (!HasVersion!"XOS_USE_MTSAFE_STRINGAPI" || HasVersion!"XNO_MTSAFE_STRINGAPI") {
/* Systems with thread support but no _r API. */
alias _Xstrtokparams = char*;
enum string _XStrtok(string s1,string s2,string p) = `
 ( (_Xos_processLock), 
   ((` ~ p ~ `) = strtok((` ~ s1 ~ `),(` ~ s2 ~ `))), 
   (_Xos_processUnlock), 
   (` ~ p ~ `) )`;

} else {
/* POSIX or pre-POSIX API. */
alias _Xstrtokparams = char*;
enum string _XStrtok(string s1,string s2,string p) = `strtok_r((` ~ s1 ~ `),(` ~ s2 ~ `),&(` ~ p ~ `))`;
} /* X_INCLUDE_STRING_H */


/***** <time.h> wrappers *****/

/*
 * Effective prototypes for <time.h> wrappers:
 *
 * #define X_INCLUDE_TIME_H
 * #define XOS_USE_..._LOCKING
 * #include <X11/Xos_r.h>
 *
 * typedef ... _Xatimeparams;
 * typedef ... _Xctimeparams;
 * typedef ... _Xgtimeparams;
 * typedef ... _Xltimeparams;
 *
 * char *_XAsctime(const struct tm *, _Xatimeparams);
 * char *_XCtime(const time_t *, _Xctimeparams);
 * struct tm *_XGmtime(const time_t *, _Xgtimeparams);
 * struct tm *_XLocaltime(const time_t *, _Xltimeparams);
 */

static if (HasVersion!"X_INCLUDE_TIME_H" && !HasVersion!"_XOS_INCLUDED_TIME_H") {
public import core.stdc.time;
static if (HasVersion!"XUSE_MTSAFE_API" || HasVersion!"XUSE_MTSAFE_TIMEAPI") {
enum XOS_USE_MTSAFE_TIMEAPI = 1;
}
}

static if (!HasVersion!"X_INCLUDE_TIME_H" || HasVersion!"_XOS_INCLUDED_TIME_H") {
/* Do nothing. */

} else static if (!HasVersion!"XTHREADS" && !HasVersion!"X_FORCE_USE_MTSAFE_API") {
/* Use regular, unsafe API. */
alias _Xatimeparams = int;	/* dummy */
enum string _XAsctime(string t,string p) = `asctime((` ~ t ~ `))`;
alias _Xctimeparams = int;	/* dummy */
enum string _XCtime(string t,string p) = `ctime((` ~ t ~ `))`;
alias _Xgtimeparams = int;	/* dummy */
enum string _XGmtime(string t,string p) = `gmtime((` ~ t ~ `))`;
alias _Xltimeparams = int;	/* dummy */
enum string _XLocaltime(string t,string p) = `localtime((` ~ t ~ `))`;

} else static if (!HasVersion!"XOS_USE_MTSAFE_TIMEAPI" || HasVersion!"XNO_MTSAFE_TIMEAPI") {
/* Systems with thread support but no _r API. */
struct __Xctimeparams {
version (TIMELEN) {
  char[TIMELEN] buf = 0;
} else {
  char[26] buf = 0;
}
  char* result;
}alias _Xctimeparams = __Xctimeparams;
alias _Xatimeparams = _Xctimeparams;
struct __Xgtimeparams {
  tm buf;
  tm* result;
}alias _Xgtimeparams = __Xgtimeparams;
alias _Xltimeparams = _Xgtimeparams;
enum string _XAsctime(string t,string p) = `
 ( (_Xos_processLock), 
   (((` ~ p ~ `).result = asctime((` ~ t ~ `))) ? 
    (strncpy((` ~ p ~ `).buf, (` ~ p ~ `).result, typeof((` ~ p ~ `).buf).sizeof), (` ~ p ~ `).result = &(` ~ p ~ `).buf) : 
    0), 
   (_Xos_processUnlock), 
   (` ~ p ~ `).result )`;
enum string _XCtime(string t,string p) = `
 ( (_Xos_processLock), 
   (((` ~ p ~ `).result = ctime((` ~ t ~ `))) ? 
    (strncpy((` ~ p ~ `).buf, (` ~ p ~ `).result, typeof((` ~ p ~ `).buf).sizeof), (` ~ p ~ `).result = &(` ~ p ~ `).buf) : 
    0), 
   (_Xos_processUnlock), 
   (` ~ p ~ `).result )`;
enum string _XGmtime(string t,string p) = `
 ( (_Xos_processLock), 
   (((` ~ p ~ `).result = gmtime(` ~ t ~ `)) ? 
    (memcpy(&(` ~ p ~ `).buf, (` ~ p ~ `).result, typeof((` ~ p ~ `).buf).sizeof), (` ~ p ~ `).result = &(` ~ p ~ `).buf) : 
    0), 
   (_Xos_processUnlock), 
   (` ~ p ~ `).result )`;
enum string _XLocaltime(string t,string p) = `
 ( (_Xos_processLock), 
   (((` ~ p ~ `).result = localtime(` ~ t ~ `)) ? 
    (memcpy(&(` ~ p ~ `).buf, (` ~ p ~ `).result, typeof((` ~ p ~ `).buf).sizeof), (` ~ p ~ `).result = &(` ~ p ~ `).buf) : 
    0), 
   (_Xos_processUnlock), 
   (` ~ p ~ `).result )`;

} else static if (!HasVersion!"_POSIX_THREAD_SAFE_FUNCTIONS" &&  HasVersion!"hpV4") {
/* Returns (int)0 on success.
 *
 * extern int asctime_r(const struct tm *timeptr, char *buffer, int buflen);
 * extern int ctime_r(const time_t *timer, char *buffer, int buflen);
 * extern int gmtime_r(const time_t *timer, struct tm *result);
 * extern int localtime_r(const time_t *timer, struct tm *result);
 */
version (TIMELEN) {
alias _Xatimeparams = char[TIMELEN];
alias _Xctimeparams = char[TIMELEN];
} else {
alias _Xatimeparams = char[26];
alias _Xctimeparams = char[26];
}
alias _Xgtimeparams = tm;
alias _Xltimeparams = tm;
enum string _XAsctime(string t,string p) = `(asctime_r((` ~ t ~ `),(` ~ p ~ `),typeof((` ~ p ~ `)).sizeof) ? null : (` ~ p ~ `))`;
enum string _XCtime(string t,string p) = `(ctime_r((` ~ t ~ `),(` ~ p ~ `),typeof((` ~ p ~ `)).sizeof) ? null : (` ~ p ~ `))`;
enum string _XGmtime(string t,string p) = `(gmtime_r((` ~ t ~ `),&(` ~ p ~ `)) ? null : &(` ~ p ~ `))`;
enum string _XLocaltime(string t,string p) = `(localtime_r((` ~ t ~ `),&(` ~ p ~ `)) ? null : &(` ~ p ~ `))`;

} else static if (!HasVersion!"_POSIX_THREAD_SAFE_FUNCTIONS" && HasVersion!"__sun") {
/* Returns NULL on failure.  Solaris 2.5
 *
 * extern char *asctime_r(const struct tm *tm,char *buf, int buflen);
 * extern char *ctime_r(const time_t *clock, char *buf, int buflen);
 * extern struct tm *gmtime_r(const time_t *clock, struct tm *res);
 * extern struct tm *localtime_r(const time_t *clock, struct tm *res);
 */
version (TIMELEN) {
alias _Xatimeparams = char[TIMELEN];
alias _Xctimeparams = char[TIMELEN];
} else {
alias _Xatimeparams = char[26];
alias _Xctimeparams = char[26];
}
alias _Xgtimeparams = tm;
alias _Xltimeparams = tm;
enum string _XAsctime(string t,string p) = `asctime_r((` ~ t ~ `),(` ~ p ~ `),typeof((` ~ p ~ `)).sizeof)`;
enum string _XCtime(string t,string p) = `ctime_r((` ~ t ~ `),(` ~ p ~ `),typeof((` ~ p ~ `)).sizeof)`;
enum string _XGmtime(string t,string p) = `gmtime_r((` ~ t ~ `),&(` ~ p ~ `))`;
enum string _XLocaltime(string t,string p) = `localtime_r((` ~ t ~ `),&(` ~ p ~ `))`;

} else { /* defined(_POSIX_THREAD_SAFE_FUNCTIONS) */
/* POSIX final API.
 * extern char *asctime_r(const struct tm *timeptr, char *buffer);
 * extern char *ctime_r(const time_t *timer, char *buffer);
 * extern struct tm *gmtime_r(const time_t *timer, struct tm *result);
 * extern struct tm *localtime_r(const time_t *timer, struct tm *result);
 */
version (TIMELEN) {
alias _Xatimeparams = char[TIMELEN];
alias _Xctimeparams = char[TIMELEN];
} else {
alias _Xatimeparams = char[26];
alias _Xctimeparams = char[26];
}
alias _Xgtimeparams = tm;
alias _Xltimeparams = tm;
enum string _XAsctime(string t,string p) = `asctime_r((` ~ t ~ `),(` ~ p ~ `))`;
enum string _XCtime(string t,string p) = `ctime_r((` ~ t ~ `),(` ~ p ~ `))`;
enum string _XGmtime(string t,string p) = `gmtime_r((` ~ t ~ `),&(` ~ p ~ `))`;
enum string _XLocaltime(string t,string p) = `localtime_r((` ~ t ~ `),&(` ~ p ~ `))`;
} /* X_INCLUDE_TIME_H */

static if (HasVersion!"X_INCLUDE_TIME_H" && !HasVersion!"_XOS_INCLUDED_TIME_H") {
version = _XOS_INCLUDED_TIME_H;
}


/***** <grp.h> wrappers *****/

/*
 * Effective prototypes for <grp.h> wrappers:
 *
 * NOTE: On systems lacking appropriate _r functions Getgrgid() and
 *	Getgrnam() do NOT copy the list of group members!
 *
 * Remember that fgetgrent(), setgrent(), getgrent(), and endgrent()
 * are not included in POSIX.
 *
 * #define X_INCLUDE_GRP_H
 * #define XOS_USE_..._LOCKING
 * #include <X11/Xos_r.h>
 *
 * typedef ... _Xgetgrparams;
 *
 * struct group *_XGetgrgid(gid_t, _Xgetgrparams);
 * struct group *_XGetgrnam(const char *, _Xgetgrparams);
 */

static if (HasVersion!"X_INCLUDE_GRP_H" && !HasVersion!"_XOS_INCLUDED_GRP_H") {
public import core.sys.posix.grp;
static if (HasVersion!"XUSE_MTSAFE_API" || HasVersion!"XUSE_MTSAFE_GRPAPI") {
enum XOS_USE_MTSAFE_GRPAPI = 1;
}
}

static if (!HasVersion!"X_INCLUDE_GRP_H" || HasVersion!"_XOS_INCLUDED_GRP_H") {
/* Do nothing. */

} else static if (!HasVersion!"XTHREADS" && !HasVersion!"X_FORCE_USE_MTSAFE_API") {
/* Use regular, unsafe API. */
alias _Xgetgrparams = int;	/* dummy */
enum string _XGetgrgid(string g,string p) = `getgrgid((` ~ g ~ `))`;
enum string _XGetgrnam(string n,string p) = `getgrnam((` ~ n ~ `))`;

} else static if (!HasVersion!"XOS_USE_MTSAFE_GRPAPI" || HasVersion!"XNO_MTSAFE_GRPAPI") {
/* Systems with thread support but no _r API.  UnixWare 2.0. */
struct _Xgetgrparams {
  group grp;
  char[X_LINE_MAX] buf = 0;	/* Should be sysconf(_SC_GETGR_R_SIZE_MAX)? */
  group* pgrp;
  size_t len;
}
version (SVR4) {
/* Copy the gr_passwd field too. */
enum string _Xgrp_copyGroup(string p) = `
 ( memcpy(&(` ~ p ~ `).grp, (` ~ p ~ `).pgrp, group.sizeof), 
   ((` ~ p ~ `).grp.gr_name = (` ~ p ~ `).buf), 
   ((` ~ p ~ `).len = strlen((` ~ p ~ `).pgrp.gr_name)), 
   strcpy((` ~ p ~ `).grp.gr_name, (` ~ p ~ `).pgrp.gr_name), 
   ((` ~ p ~ `).grp.gr_passwd = (` ~ p ~ `).grp.gr_name + (` ~ p ~ `).len + 1), 
   ((` ~ p ~ `).pgrp = &(` ~ p ~ `).grp), 
   0 )`;
} else {
enum string _Xgrp_copyGroup(string p) = `
 ( memcpy(&(` ~ p ~ `).grp, (` ~ p ~ `).pgrp, group.sizeof), 
   ((` ~ p ~ `).grp.gr_name = (` ~ p ~ `).buf), 
   strcpy((` ~ p ~ `).grp.gr_name, (` ~ p ~ `).pgrp.gr_name), 
   ((` ~ p ~ `).pgrp = &(` ~ p ~ `).grp), 
   0 )`;
}
enum string _XGetgrgid(string g,string p) = `
 ( (_Xos_processLock), 
   (((` ~ p ~ `).pgrp = getgrgid((` ~ g ~ `))) ? ` ~ _Xgrp_copyGroup!(p) ~ ` : 0), 
   (_Xos_processUnlock), 
   (` ~ p ~ `).pgrp )`;
enum string _XGetgrnam(string n,string p) = `
 ( (_Xos_processLock), 
   (((` ~ p ~ `).pgrp = getgrnam((` ~ n ~ `))) ? ` ~ _Xgrp_copyGroup!(p) ~ ` : 0), 
   (_Xos_processUnlock), 
   (` ~ p ~ `).pgrp )`;

} else static if (!HasVersion!"_POSIX_THREAD_SAFE_FUNCTIONS" && HasVersion!"__sun") {
/* Non-POSIX API.  Solaris.
 *
 * extern struct group *getgrgid_r(gid_t, struct group *, char *, int);
 * extern struct group *getgrnam_r(const char *, struct group *, char *, int);
 */
struct _Xgetgrparams {
  group grp;
  char[X_LINE_MAX] buf = 0;	/* Should be sysconf(_SC_GETGR_R_SIZE_MAX)? */
}
enum string _XGetgrgid(string g,string p) = `getgrgid_r((` ~ g ~ `), &(` ~ p ~ `).grp, (` ~ p ~ `).buf, typeof((` ~ p ~ `).buf).sizeof)`;
enum string _XGetgrnam(string n,string p) = `getgrnam_r((` ~ n ~ `), &(` ~ p ~ `).grp, (` ~ p ~ `).buf, typeof((` ~ p ~ `).buf).sizeof)`;

} else static if (!HasVersion!"_POSIX_THREAD_SAFE_FUNCTIONS") {
/* Non-POSIX API.
 * extern int getgrgid_r(gid_t, struct group *, char *, int);
 * extern int getgrnam_r(const char *, struct group *, char *, int);
 */
struct _Xgetgrparams {
  group grp;
  char[X_LINE_MAX] buf = 0;	/* Should be sysconf(_SC_GETGR_R_SIZE_MAX)? */
}
enum string _XGetgrgid(string g,string p) = `
 ((getgrgid_r((` ~ g ~ `), &(` ~ p ~ `).grp, (` ~ p ~ `).buf, typeof((` ~ p ~ `).buf).sizeof) ? null : &(` ~ p ~ `).grp))`;
enum string _XGetgrnam(string n,string p) = `
 ((getgrnam_r((` ~ n ~ `), &(` ~ p ~ `).grp, (` ~ p ~ `).buf, typeof((` ~ p ~ `).buf).sizeof) ? null : &(` ~ p ~ `).grp))`;

} else {
/* POSIX final API.
 *
 * int getgrgid_r(gid_t, struct group *, char *, size_t, struct group **);
 * int getgrnam_r(const char *, struct group *, char *, size_t, struct group **);
 */
struct _Xgetgrparams {
  group grp;
  char[X_LINE_MAX] buf = 0;	/* Should be sysconf(_SC_GETGR_R_SIZE_MAX)? */
  group* result;
}

enum string _XGetgrgid(string g,string p) = `
 ((getgrgid_r((` ~ g ~ `), &(` ~ p ~ `).grp, (` ~ p ~ `).buf, typeof((` ~ p ~ `).buf).sizeof, &(` ~ p ~ `).result) ? 
   null : (` ~ p ~ `).result))`;
enum string _XGetgrnam(string n,string p) = `
 ((getgrnam_r((` ~ n ~ `), &(` ~ p ~ `).grp, (` ~ p ~ `).buf, typeof((` ~ p ~ `).buf).sizeof, &(` ~ p ~ `).result) ? 
   null : (` ~ p ~ `).result))`;
}

static if (HasVersion!"X_INCLUDE_GRP_H" && !HasVersion!"_XOS_INCLUDED_GRP_H") {
version = _XOS_INCLUDED_GRP_H;
}


