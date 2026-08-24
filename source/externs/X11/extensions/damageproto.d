module externs.X11.extensions.damageproto;
@nogc nothrow:
extern(C): __gshared:
/*
 * Copyright © 2003 Keith Packard
 * Copyright © 2007 Eric Anholt
 *
 * Permission to use, copy, modify, distribute, and sell this software and its
 * documentation for any purpose is hereby granted without fee, provided that
 * the above copyright notice appear in all copies and that both that
 * copyright notice and this permission notice appear in supporting
 * documentation, and that the name of Keith Packard not be used in
 * advertising or publicity pertaining to distribution of the software without
 * specific, written prior permission.  Keith Packard makes no
 * representations about the suitability of this software for any purpose.  It
 * is provided "as is" without express or implied warranty.
 *
 * KEITH PACKARD DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
 * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
 * EVENT SHALL KEITH PACKARD BE LIABLE FOR ANY SPECIAL, INDIRECT OR
 * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
 * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
 * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
 * PERFORMANCE OF THIS SOFTWARE.
 */

 
public import externs.X11.Xmd;
public import externs.X11.extensions.xfixesproto;
public import externs.X11.extensions.damagewire;
public import externs.X11.Xprotostr;

alias Window = CARD32;
alias Drawable = CARD32;
alias Font = CARD32;
alias Pixmap = CARD32;
alias Cursor = CARD32;
alias Colormap = CARD32;
alias GContext = CARD32;
alias Atom = CARD32;
alias VisualID = CARD32;
alias Time = CARD32;
alias KeyCode = CARD8;
alias KeySym = CARD32;
alias Picture = CARD32;
alias Region = CARD32;
alias Damage = CARD32;

/************** Version 0 ******************/

struct xDamageReq {
    CARD8 reqType;
    CARD8 damageReqType;
    CARD16 length;
}

/*
 * requests and replies
 */

struct xDamageQueryVersionReq {
    CARD8 reqType;
    CARD8 damageReqType;
    CARD16 length;
    CARD32 majorVersion;
    CARD32 minorVersion;
}

enum sz_xDamageQueryVersionReq =   12;

struct xDamageQueryVersionReply {
    BYTE type;   /* X_Reply */
    BYTE pad1;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 majorVersion;
    CARD32 minorVersion;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
}

enum sz_xDamageQueryVersionReply =	32;

struct xDamageCreateReq {
    CARD8 reqType;
    CARD8 damageReqType;
    CARD16 length;
    Damage damage;
    Drawable drawable;
    CARD8 level;
    CARD8 pad1;
    CARD16 pad2;
}

enum sz_xDamageCreateReq =		16;

struct xDamageDestroyReq {
    CARD8 reqType;
    CARD8 damageReqType;
    CARD16 length;
    Damage damage;
}

enum sz_xDamageDestroyReq =		8;

struct xDamageSubtractReq {
    CARD8 reqType;
    CARD8 damageReqType;
    CARD16 length;
    Damage damage;
    Region repair;
    Region parts;
}

enum sz_xDamageSubtractReq =		16;

struct xDamageAddReq {
    CARD8 reqType;
    CARD8 damageReqType;
    CARD16 length;
    Drawable drawable;
    Region region;
}

enum sz_xDamageAddReq =		12;

/* Events */

enum DamageNotifyMore =    0x80;

struct xDamageNotifyEvent {
    CARD8 type;
    CARD8 level;
    CARD16 sequenceNumber;
    Drawable drawable;
    Damage damage;
    Time timestamp;
    xRectangle area;
    xRectangle geometry;
}

 /* _DAMAGEPROTO_H_ */
