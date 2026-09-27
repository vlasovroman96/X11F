module x11.Xosdefs;

private template HasVersion(string versionId) {
	mixin("version("~versionId~") {enum HasVersion = true;} else {enum HasVersion = false;}");
}
/*
 * Copyright 2016, Roman Vlasov
 * Copyright 1991, 1998  The Open Group
 *
 * See COPYING for the full license texts.
 */

/**
 * Ideally, OS-dependent and environment-dependent version configuration
 * will be split in the future.
 * It does not break the build now, so let it be as is.
 * However, IDKWIGO
 */
version (SCO) {
	enum SCO = true;
}
else {
	enum SCO = false;
}

version (X86) 
{
	version (SysV4) {
		static if (
			!HasVersion!"SCO" && 
			!HasVersion!"UnixWare" && 
			!HasVersion!"Solaris" && 
			!HasVersion!"POSIX_SOURCE") {
				enum X_NOT_POSIX = true;
		}
	}
}

version (Solaris) {
	/* define this to whatever it needs to be */
	enum X_POSIX_C_SOURCE = 199300L;

}

version (Windows) 
{
	version(Cygwin) 
		enum X_NOT_POSIX = false;
	else
		enum X_NOT_POSIX = true;
}

version (OSX) 
{
	enum NULL_NOT_ZERO = true;
}

version (Hurd) {
	//Who is it? Okey, let it live
	static if (HasVersion!"SCO" || HasVersion!"UnixWare") {
		enum PATH_MAX =	1024;
		enum MAXPATHLEN =	1024;
	}
	else {
		enum PATH_MAX = 4096;
		enum MAXPATHLEN = 4096;
	}
}

version (OpenBSD)
    enum CSRG_BASED = true;
version (NetBSD)
    enum CSRG_BASED = true;
version (FreeBSD)
    enum CSRG_BASED = true;
version (OSX)
    enum CSRG_BASED = true;
version (DragonFlyBSD)
    enum CSRG_BASED = true;
else
	enum CSRG_BASED = false;