module Xext.xshmfence;

/*
 * Copyright (c) 2026, Roman Vlasov
 * Copyright © 2013 Keith Packard
 *
 * See COPYING for the full license texts.
 */

@nogc nothrow:
extern(C):

struct xshmfence;

int xshmfence_trigger(xshmfence* f);
int xshmfence_await(xshmfence* f);
int xshmfence_query(xshmfence* f);
void xshmfence_reset(xshmfence* f);
int xshmfence_alloc_shm();
xshmfence* xshmfence_map_shm(int fd);
void xshmfence_unmap_shm(xshmfence* f);