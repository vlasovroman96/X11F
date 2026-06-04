module externs.x11.X;

import core.stdc.string : memcpy, memset, memcmp;

extern(C):

void bcopy(const(void)* src, void* dest, size_t n) {
    memcpy(dest, src, n);
}

void bzero(void* s, size_t n) {
    memset(s, 0, n);
}

int bcmp(const(void)* s1, const(void)* s2, size_t n) {
    return memcmp(s1, s2, n);
}