module include.xf86Cursor;
@nogc nothrow:
extern(C): __gshared:

 
public import include.xf86str;
public import mi.mipointer;

struct _xf86CursorInfoRec {
    ScrnInfoPtr pScrn;
    int Flags;
    int MaxWidth;
    int MaxHeight;
    void function(ScrnInfoPtr pScrn, int bg, int fg)@nogc nothrow SetCursorColors;
    void function(ScrnInfoPtr pScrn, int x, int y)@nogc nothrow SetCursorPosition;
    void function(ScrnInfoPtr pScrn, ubyte* bits)@nogc nothrow LoadCursorImage;
    Bool function(ScrnInfoPtr pScrn, ubyte* bits)@nogc nothrow LoadCursorImageCheck;
    void function(ScrnInfoPtr pScrn)@nogc nothrow HideCursor;
    void function(ScrnInfoPtr pScrn)@nogc nothrow ShowCursor;
    Bool function(ScrnInfoPtr pScrn)@nogc nothrow ShowCursorCheck;
    ubyte* function(_xf86CursorInfoRec*, CursorPtr)@nogc nothrow RealizeCursor;
    Bool function(ScreenPtr, CursorPtr)@nogc nothrow UseHWCursor;

    Bool function(ScreenPtr, CursorPtr)@nogc nothrow UseHWCursorARGB;
    void function(ScrnInfoPtr, CursorPtr)@nogc nothrow LoadCursorARGB;
    Bool function(ScrnInfoPtr, CursorPtr)@nogc nothrow LoadCursorARGBCheck;

}alias xf86CursorInfoRec = _xf86CursorInfoRec;
alias xf86CursorInfoPtr = _xf86CursorInfoRec*;

pragma(inline, true) Bool xf86DriverHasLoadCursorImage(xf86CursorInfoPtr infoPtr)
{
    return infoPtr.LoadCursorImageCheck || infoPtr.LoadCursorImage;
}

pragma(inline, true)bool xf86DriverLoadCursorImage(xf86CursorInfoPtr infoPtr, ubyte* bits)
{
    if(infoPtr.LoadCursorImageCheck)
        return cast(bool)infoPtr.LoadCursorImageCheck(infoPtr.pScrn, bits);
    infoPtr.LoadCursorImage(infoPtr.pScrn, bits);
    return TRUE;
}

pragma(inline, true)bool xf86DriverHasShowCursor(xf86CursorInfoPtr infoPtr)
{
    return infoPtr.ShowCursorCheck || infoPtr.ShowCursor;
}

pragma(inline, true)bool xf86DriverShowCursor(xf86CursorInfoPtr infoPtr)
{
    if(infoPtr.ShowCursorCheck)
        return cast(bool)infoPtr.ShowCursorCheck(infoPtr.pScrn);
    infoPtr.ShowCursor(infoPtr.pScrn);
    return TRUE;
}

pragma(inline, true)bool xf86DriverHasLoadCursorARGB(xf86CursorInfoPtr infoPtr)
{
    return infoPtr.LoadCursorARGBCheck || infoPtr.LoadCursorARGB;
}

pragma(inline, true)bool xf86DriverLoadCursorARGB(xf86CursorInfoPtr infoPtr, CursorPtr pCursor)
{
    if(infoPtr.LoadCursorARGBCheck)
        return cast(bool)infoPtr.LoadCursorARGBCheck(infoPtr.pScrn, pCursor);
    infoPtr.LoadCursorARGB(infoPtr.pScrn, pCursor);
    return TRUE;
}

// void  xf86InitCursor(ScreenPtr pScreen, xf86CursorInfoPtr infoPtr);
// xf86CursorInfoPtr xf86CreateCursorInfoRec();
// void  xf86DestroyCursorInfoRec(xf86CursorInfoPtr);
void  xf86CursorResetCursor(ScreenPtr pScreen);
void  xf86ForceHWCursor(ScreenPtr pScreen, Bool on);
// void  xf86CurrentCursor(ScreenPtr pScreen);

enum HARDWARE_CURSOR_INVERT_MASK = 			0x00000001;
enum HARDWARE_CURSOR_AND_SOURCE_WITH_MASK =		0x00000002;
enum HARDWARE_CURSOR_SWAP_SOURCE_AND_MASK =		0x00000004;
enum HARDWARE_CURSOR_SOURCE_MASK_NOT_INTERLEAVED =	0x00000008;
enum HARDWARE_CURSOR_SOURCE_MASK_INTERLEAVE_1 =	0x00000010;
enum HARDWARE_CURSOR_SOURCE_MASK_INTERLEAVE_8 =	0x00000020;
enum HARDWARE_CURSOR_SOURCE_MASK_INTERLEAVE_16 =	0x00000040;
enum HARDWARE_CURSOR_SOURCE_MASK_INTERLEAVE_32 =	0x00000080;
enum HARDWARE_CURSOR_SOURCE_MASK_INTERLEAVE_64 =	0x00000100;
enum HARDWARE_CURSOR_TRUECOLOR_AT_8BPP =		0x00000200;
enum HARDWARE_CURSOR_BIT_ORDER_MSBFIRST =		0x00000400;
enum HARDWARE_CURSOR_NIBBLE_SWAPPED =			0x00000800;
enum HARDWARE_CURSOR_SHOW_TRANSPARENT =		0x00001000;
enum HARDWARE_CURSOR_UPDATE_UNHIDDEN =			0x00002000;
enum HARDWARE_CURSOR_ARGB =				0x00004000;

                          /* _XF86CURSOR_H */
