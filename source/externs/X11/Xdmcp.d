module externs.X11.Xdmcp;
@nogc nothrow:
extern(C): __gshared:
/*
 * Copyright 1989 Network Computing Devices, Inc., Mountain View, California.
 *
 * Permission to use, copy, modify, and distribute this software and its
 * documentation for any purpose and without fee is hereby granted, provided
 * that the above copyright notice appear in all copies and that both that
 * copyright notice and this permission notice appear in supporting
 * documentation, and that the name of N.C.D. not be used in advertising or
 * publicity pertaining to distribution of the software without specific,
 * written prior permission.  N.C.D. makes no representations about the
 * suitability of this software for any purpose.  It is provided "as is"
 * without express or implied warranty.
 *
 */


import build.xlibre_server;
public import externs.X11.Xmd;
import core.sys.posix.netinet.in_;
public import externs.X11.Xfuncproto;
import std.compiler;

    version = V_IPv6;
// static if(IPv6) {
// }

// _XFUNCPROTOBEGIN

enum XDM_PROTOCOL_VERSION =	1;
enum XDM_UDP_PORT =		177;

/* IANA has assigned FF0X:0:0:0:0:0:0:12B as the permanently assigned
 * multicast addresses for XDMCP, where X in the prefix may be replaced
 * by any valid scope identifier, such as 1 for Node-Local, 2 for Link-Local,
 * 5 for Site-Local, and so on.  We set the default here to the Link-Local
 * version to most closely match the old IPv4 subnet broadcast behavior.
 * Both xdm and X -query allow specifying a different address if a different
 * scope is defined.
 */
enum XDM_DEFAULT_MCAST_ADDR6 =	"ff02:0:0:0:0:0:0:12b";

enum XDM_MAX_MSGLEN =		8192;
enum XDM_MIN_RTX =		2;
enum XDM_MAX_RTX =		32;
enum XDM_RTX_LIMIT =		7;
enum XDM_KA_RTX_LIMIT =	4;
enum XDM_DEF_DORMANCY =	(3 * 60)	/* 3 minutes */;
enum XDM_MAX_DORMANCY =	(24 * 60 * 60)	/* 24 hours */;

enum xdmOpCode {
    BROADCAST_QUERY = 1, QUERY, INDIRECT_QUERY, FORWARD_QUERY,
    WILLING, UNWILLING, REQUEST, ACCEPT, DECLINE, MANAGE, REFUSE,
    FAILED, KEEPALIVE, ALIVE
}
alias BROADCAST_QUERY = xdmOpCode.BROADCAST_QUERY;
alias QUERY = xdmOpCode.QUERY;
alias INDIRECT_QUERY = xdmOpCode.INDIRECT_QUERY;
alias FORWARD_QUERY = xdmOpCode.FORWARD_QUERY;
alias WILLING = xdmOpCode.WILLING;
alias UNWILLING = xdmOpCode.UNWILLING;
alias REQUEST = xdmOpCode.REQUEST;
alias ACCEPT = xdmOpCode.ACCEPT;
alias DECLINE = xdmOpCode.DECLINE;
alias MANAGE = xdmOpCode.MANAGE;
alias REFUSE = xdmOpCode.REFUSE;
alias FAILED = xdmOpCode.FAILED;
alias KEEPALIVE = xdmOpCode.KEEPALIVE;
alias ALIVE = xdmOpCode.ALIVE;

// version(IPv6 && AF_INET6)
version(V_IPv6)
{

enum xdmcp_states {
    XDM_QUERY, XDM_BROADCAST, XDM_INDIRECT, XDM_COLLECT_QUERY,
    XDM_COLLECT_BROADCAST_QUERY, XDM_COLLECT_INDIRECT_QUERY,
    XDM_START_CONNECTION, XDM_AWAIT_REQUEST_RESPONSE,
    XDM_AWAIT_MANAGE_RESPONSE, XDM_MANAGE, XDM_RUN_SESSION, XDM_OFF,
    XDM_AWAIT_USER_INPUT, XDM_KEEPALIVE, XDM_AWAIT_ALIVE_RESPONSE,
    XDM_MULTICAST, XDM_COLLECT_MULTICAST_QUERY,
    XDM_KEEP_ME_LAST
}
}
else {
enum xdmcp_states {
    XDM_QUERY, XDM_BROADCAST, XDM_INDIRECT, XDM_COLLECT_QUERY,
    XDM_COLLECT_BROADCAST_QUERY, XDM_COLLECT_INDIRECT_QUERY,
    XDM_START_CONNECTION, XDM_AWAIT_REQUEST_RESPONSE,
    XDM_AWAIT_MANAGE_RESPONSE, XDM_MANAGE, XDM_RUN_SESSION, XDM_OFF,
    XDM_AWAIT_USER_INPUT, XDM_KEEPALIVE, XDM_AWAIT_ALIVE_RESPONSE,
    XDM_KEEP_ME_LAST
}
}
alias XDM_QUERY = xdmcp_states.XDM_QUERY;
alias XDM_BROADCAST = xdmcp_states.XDM_BROADCAST;
alias XDM_INDIRECT = xdmcp_states.XDM_INDIRECT;
alias XDM_COLLECT_QUERY = xdmcp_states.XDM_COLLECT_QUERY;
alias XDM_COLLECT_BROADCAST_QUERY = xdmcp_states.XDM_COLLECT_BROADCAST_QUERY;
alias XDM_COLLECT_INDIRECT_QUERY = xdmcp_states.XDM_COLLECT_INDIRECT_QUERY;
alias XDM_START_CONNECTION = xdmcp_states.XDM_START_CONNECTION;
alias XDM_AWAIT_REQUEST_RESPONSE = xdmcp_states.XDM_AWAIT_REQUEST_RESPONSE;
alias XDM_AWAIT_MANAGE_RESPONSE = xdmcp_states.XDM_AWAIT_MANAGE_RESPONSE;
alias XDM_MANAGE = xdmcp_states.XDM_MANAGE;
alias XDM_RUN_SESSION = xdmcp_states.XDM_RUN_SESSION;
alias XDM_OFF = xdmcp_states.XDM_OFF;
alias XDM_AWAIT_USER_INPUT = xdmcp_states.XDM_AWAIT_USER_INPUT;
alias XDM_KEEPALIVE = xdmcp_states.XDM_KEEPALIVE;
alias XDM_AWAIT_ALIVE_RESPONSE = xdmcp_states.XDM_AWAIT_ALIVE_RESPONSE;
alias XDM_MULTICAST = xdmcp_states.XDM_MULTICAST;
alias XDM_COLLECT_MULTICAST_QUERY = xdmcp_states.XDM_COLLECT_MULTICAST_QUERY;
alias XDM_KEEP_ME_LAST = xdmcp_states.XDM_KEEP_ME_LAST;


// version (NOTDEF) {
/* table of hosts */

enum XDM_MAX_STR_LEN = 21;
enum XDM_MAX_HOSTS = 20;
struct xdm_host_table {
  sockaddr_in sockaddr;
  char[XDM_MAX_STR_LEN] name = 0;
  char[XDM_MAX_STR_LEN] status = 0;
}
// } /* NOTDEF */

alias CARD8Ptr = CARD8*;
alias CARD16Ptr = CARD16*;
alias CARD32Ptr = CARD32*;

struct _ARRAY8 {
    CARD16 length;
    CARD8Ptr data;
}alias ARRAY8 = _ARRAY8;
alias ARRAY8Ptr = _ARRAY8*;

struct _ARRAY16 {
    CARD8 length;
    CARD16Ptr data;
}alias ARRAY16 = _ARRAY16;
alias ARRAY16Ptr = _ARRAY16*;

struct _ARRAY32 {
    CARD8 length;
    CARD32Ptr data;
}alias ARRAY32 = _ARRAY32;
alias ARRAY32Ptr = _ARRAY32*;

struct _ARRAYofARRAY8 {
    CARD8 length;
    ARRAY8Ptr data;
}alias ARRAYofARRAY8 = _ARRAYofARRAY8;
alias ARRAYofARRAY8Ptr = _ARRAYofARRAY8*;

struct _XdmcpHeader {
    CARD16 version_, opcode, length;
}alias XdmcpHeader = _XdmcpHeader;
alias XdmcpHeaderPtr = _XdmcpHeader*;

struct _XdmcpBuffer {
    BYTE* data;
    int size;		/* size of buffer pointed by to data */
    int pointer;		/* current index into data */
    int count;		/* bytes read from network into data */
}alias XdmcpBuffer = _XdmcpBuffer;
alias XdmcpBufferPtr = _XdmcpBuffer*;

struct _XdmAuthKey {
    BYTE[8] data;
}alias XdmAuthKeyRec = _XdmAuthKey;
alias XdmAuthKeyPtr = _XdmAuthKey*;


/* implementation-independent network address structure.
   Equiv to sockaddr* for sockets. */

alias XdmcpNetaddr = char*;

version (__has_attribute) {} else {
enum string __has_attribute(string x) = `0  /* Compatibility with older compilers */`;
}

// static if mixin((__has_attribute!(`access`)) {)
// enum string XDM_ACCESS_ATTRIBUTE(string X) = `__attribute__((access ` ~ X ~ `))`;
// } else {
// //# define XDM_ACCESS_ATTRIBUTE(X)
// }

extern int XdmcpWriteARRAY16(XdmcpBufferPtr buffer, const(ARRAY16Ptr) array);
extern int XdmcpWriteARRAY32(XdmcpBufferPtr buffer, const(ARRAY32Ptr) array);
extern int XdmcpWriteARRAY8(XdmcpBufferPtr buffer, const(ARRAY8Ptr) array);
extern int XdmcpWriteARRAYofARRAY8(XdmcpBufferPtr buffer, const(ARRAYofARRAY8Ptr) array);
extern int XdmcpWriteCARD16(XdmcpBufferPtr buffer, uint value);
extern int XdmcpWriteCARD32(XdmcpBufferPtr buffer, uint value);
extern int XdmcpWriteCARD8(XdmcpBufferPtr buffer, uint value);
extern int XdmcpWriteHeader(XdmcpBufferPtr buffer, const(XdmcpHeaderPtr) header);

extern int XdmcpFlush(int fd, XdmcpBufferPtr buffer, XdmcpNetaddr to, int tolen);

extern int XdmcpReadARRAY16(XdmcpBufferPtr buffer, ARRAY16Ptr array);
extern int XdmcpReadARRAY32(XdmcpBufferPtr buffer, ARRAY32Ptr array);
extern int XdmcpReadARRAY8(XdmcpBufferPtr buffer, ARRAY8Ptr array);
extern int XdmcpReadARRAYofARRAY8(XdmcpBufferPtr buffer, ARRAYofARRAY8Ptr array);
extern int XdmcpReadCARD16(XdmcpBufferPtr buffer, CARD16Ptr valuep);
extern int XdmcpReadCARD32(XdmcpBufferPtr buffer, CARD32Ptr valuep);
extern int XdmcpReadCARD8(XdmcpBufferPtr buffer, CARD8Ptr valuep);
extern int XdmcpReadHeader(XdmcpBufferPtr buffer, XdmcpHeaderPtr header);

extern int XdmcpFill(int fd, XdmcpBufferPtr buffer, XdmcpNetaddr from, int* fromlen);

extern int XdmcpReadRemaining(const(XdmcpBufferPtr) buffer);

extern void XdmcpDisposeARRAY8(ARRAY8Ptr array);
extern void XdmcpDisposeARRAY16(ARRAY16Ptr array);
extern void XdmcpDisposeARRAY32(ARRAY32Ptr array);
extern void XdmcpDisposeARRAYofARRAY8(ARRAYofARRAY8Ptr array);

extern int XdmcpCopyARRAY8(const(ARRAY8Ptr) src, ARRAY8Ptr dst);
extern int XdmcpARRAY8Equal(const(ARRAY8Ptr) array1, const(ARRAY8Ptr) array2);

extern void XdmcpGenerateKey(XdmAuthKeyPtr key);
extern void XdmcpIncrementKey(XdmAuthKeyPtr key);
extern void XdmcpDecrementKey(XdmAuthKeyPtr key);
version (HASXDMAUTH) {
extern void XdmcpWrap(ubyte* input, ubyte* wrapper, ubyte* output, int bytes);
extern void XdmcpUnwrap(ubyte* input, ubyte* wrapper, ubyte* output, int bytes);
}

version (TRUE) {} else {
enum TRUE =	1;
enum FALSE =	0;
}

extern int XdmcpCompareKeys(const(XdmAuthKeyPtr) a, const(XdmAuthKeyPtr) b);

extern int XdmcpAllocARRAY16(ARRAY16Ptr array, int length);
extern int XdmcpAllocARRAY32(ARRAY32Ptr array, int length);
extern int XdmcpAllocARRAY8(ARRAY8Ptr array, int length);
extern int XdmcpAllocARRAYofARRAY8(ARRAYofARRAY8Ptr array, int length);

extern int XdmcpReallocARRAY16(ARRAY16Ptr array, int length);
extern int XdmcpReallocARRAY32(ARRAY32Ptr array, int length);
extern int XdmcpReallocARRAY8(ARRAY8Ptr array, int length);
extern int XdmcpReallocARRAYofARRAY8(ARRAYofARRAY8Ptr array, int length);


 /* _XDMCP_H_ */
