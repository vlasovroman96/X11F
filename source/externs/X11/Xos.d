module x11.Xos;

/*
 * Copyright 2026, Roman Vlasov
 * Copyright 1987, 1998  The Open Group
 *
 * See COPYING for the full license texts.
 */

public import core.sys.posix.sys.types;
public import core.stdc.string;
public import core.stdc.stdint;

alias index = strchr;
alias rindex = strrchr;

version(Posix) 
{
    public import core.sys.posix.sys.time;
    public import core.sys.posix.unistd;
    public import core.sys.posix.fcntl;
}
else version(Windows) {
    // static assert(0, "Is not implemented");
    public import core.sys.windows.winsock2 : timeval;
    // public import x11.Xw32defs;
}
alias OSTimePtr = timeval**;
alias BlockHandlerProcPtr = void function(void*, OSTimePtr, void*);

//Need we move it to Xosdefs? 
version(Hurd) {
    enum OPEN_PATH = 256;
}

auto X_GETTIMEOFDAY(timeval* val) {
    return gettimeofday(val, null);
}