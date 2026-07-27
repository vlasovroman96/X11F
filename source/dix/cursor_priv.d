module dix.cursor_priv;
@nogc nothrow:
extern(C): __gshared:
/* SPDX-License-Identifier: MIT OR X11
 *
 * Copyright © 2024 Enrico Weigelt, metux IT consult <info@metux.net>
 */
 
// //public import externs.X11.fonts.font;
//public import externs.X11.X;
//public import externs.X11.Xdefs;
//public import externs.X11.Xmd;

public import dix.screenint_priv;
public import include.cursor;
public import include.cursorstr;

public import include.dix;
public import include.input;
public import include.window;

@property size_t CURSOR_BITS_SIZE() 
{
    return CursorBits.sizeof + cast(size_t)dixPrivatesSize(PRIVATE_CURSOR_BITS);
}
@property size_t CURSOR_REC_SIZE() => CursorRec.sizeof + cast(size_t)dixPrivatesSize(PRIVATE_CURSOR);

// extern CursorPtr rootCursor;

/* reference counting */
CursorPtr RefCursor(CursorPtr cursor);
CursorPtr UnrefCursor(CursorPtr cursor);
int CursorRefCount(ConstCursorPtr cursor);

int AllocARGBCursor(ubyte* psrcbits, ubyte* pmaskbits, CARD32* argb, CursorMetricPtr cm, ushort foreRed, ushort foreGreen, ushort foreBlue, ushort backRed, ushort backGreen, ushort backBlue, CursorPtr* ppCurs, ClientPtr client, XID cid);

int AllocGlyphCursor(Font source, ushort sourceChar, Font mask, ushort maskChar, ushort foreRed, ushort foreGreen, ushort foreBlue, ushort backRed, ushort backGreen, ushort backBlue, CursorPtr* ppCurs, ClientPtr client, XID cid);

CursorPtr CreateRootCursor();

int ServerBitsFromGlyph(FontPtr pfont, uint ch, CursorMetricPtr cm, ubyte** ppbits);

Bool CursorMetricsFromGlyph(FontPtr pfont, uint ch, CursorMetricPtr cm);

void CheckCursorConfinement(WindowPtr pWin);

// void NewCurrentScreen(DeviceIntPtr pDev, ScreenPtr newScreen, int x, int y);

// Bool PointerConfinedToScreen(DeviceIntPtr pDev);

// void GetSpritePosition(DeviceIntPtr pDev, int* px, int* py);

 /* _XSERVER_DIX_CURSOR_PRIV_H */
