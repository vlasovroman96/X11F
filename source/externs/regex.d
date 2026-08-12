module externs.regex;

import core.sys.posix.sys.types;
import std.stdio;
import std.string : stringToCString = representation; // Для передачи char* в C
// import core.stdc.stdlib

extern(C) {
// import core.stdc.stddef : size_t;
// import core.sys.posix.sys.types : ssize_t;

alias regoff_t = ssize_t;

    struct regex_t {
        size_t re_nsub;
        void* re_g; 
    }
    
    struct regmatch_t {
        regoff_t rm_so;
        regoff_t rm_eo;
    }

    enum REG_EXTENDED = 1;
    enum REG_NOMATCH = 1;
    enum REG_ICASE    = 0x02;
    enum REG_NEWLINE  = 0x04;
    enum REG_NOSUB    = 0x08;

    int regcomp(regex_t* preg, const(char)* regex, int cflags) @nogc nothrow;
    int regexec(const(regex_t)* preg, const(char)* string, size_t nmatch, regmatch_t* pmatch, int eflags) @nogc nothrow;
    void regfree(regex_t* preg) @nogc nothrow;
    size_t regerror(int errcode,
                regex_t *preg,
                char *errbuf,
                size_t errbuf_size) @nogc nothrow;
}
