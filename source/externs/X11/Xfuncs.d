module x11.Xfuncs;

/*
 * Copyright 2026, Roman Vlasov
 * Copyright 1990, 1998  The Open Group
 *
 * See COPYING for the full license texts.
 */

import core.stdc.string;

alias bcopy = memmove;
auto bzero(void* s, size_t len) => memset(s, 0, len);
auto bcmp(void* b1, void* b2, size_t len) => memcmp(b1, b2, len);