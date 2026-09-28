module externs.X11.Xauth;

 /*
 * Copyright 2026, Roman Vlasov
 * Copyright 1988, 1998  The Open Group
 *
 * See COPYING for the full license texts.
 */

@nogc nothrow:
extern(C):

import   core.stdc.stdio;
import core.stdc.config: c_long, c_ulong;


struct Xauth {
    ushort family;
    ushort address_length;
    char* address;
    ushort number_length;
    char* number;
    ushort name_length;
    char* name;
    ushort data_length;
    char* data;
}

enum FamilyLocal = (256)	/* not part of X standard (i.e. X.h) */;
enum FamilyWild =  (65535);
enum FamilyNetname =    (254)   /* not part of X standard */;
enum FamilyKrb5Principal = (253) /* Kerberos 5 principal name */;
enum FamilyLocalHost = (252)	/* for local non-net authentication */;

enum LOCK_SUCCESS =	0	/* lock succeeded */;
enum LOCK_ERROR =	1	/* lock unexpectedly failed, check errno */;
enum LOCK_TIMEOUT =	2	/* lock failed, timeouts expired */;

char* XauFileName();

void XauDisposeAuth(Xauth*);

Xauth* XauReadAuth(FILE*);

int XauLockAuth(const char*, int, int, c_long);

int XauUnlockAuth(const char*);

int XauWriteAuth(FILE*, Xauth*);

Xauth* XauGetAuthByAddr(
    uint family,
    uint address_length,
    const(char)* address,
    uint number_length,
    const(char)* number,
    uint name_length,
    const(char)* name
);

Xauth* XauGetBestAuthByAddr(
    uint family,
    uint address_length,
    const(char)* address,
    uint number_length,
    const(char)* number,
    int types_length,
    char** type_names,
    const(int)* type_lengths
);
