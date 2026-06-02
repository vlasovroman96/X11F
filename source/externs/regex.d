module externs.regex;

import core.sys.posix.sys.types;
import std.stdio;
import std.string : stringToCString = representation; // Для передачи char* в C

extern(C) {
    // Структуры из оригинального <regex.h>
    struct regex_t {
        size_t re_nsub;
        void* re_g; // Внутренности реализации скрыты
    }
    
    struct regmatch_t {
        int rm_so; // Смещение начала совпадения
        int rm_eo; // Смещение конца совпадения
    }

    // Флаги компиляции и выполнения
    enum REG_EXTENDED = 1;
    enum REG_NOMATCH = 1;

    // Си-функции
    int regcomp(regex_t* preg, const(char)* regex, int cflags);
    int regexec(const(regex_t)* preg, const(char)* string, size_t nmatch, regmatch_t* pmatch, int eflags);
    void regfree(regex_t* preg);
}
