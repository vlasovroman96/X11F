module externs.gnu;


extern(C) @nogc nothrow
int asprintf(char** strp, const(char)* fmt, ...);