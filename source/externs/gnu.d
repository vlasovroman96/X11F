module externs.gnu;


extern(C) @nogc nothrow
int asprintf(char** strp, const(char)* fmt, ...);
extern(C) @nogc nothrow {
	int strncasecmp(const char *s1, const char *s2, size_t n);
	int strcasecmp(const(char)* s1, const(char)* s2);
	char *strcasestr(const char *haystack, const char *needle);
	
ulong majorDev(ulong dev)
{
    return (dev >> 8) & 0xfff;
}


ulong minorDev(ulong dev)
{
    return (dev & 0xff) | ((dev >> 12) & 0xfffff00);
}
}
