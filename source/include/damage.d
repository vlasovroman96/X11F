module include.damage;
@nogc nothrow:
extern(C): __gshared:
/*
 * Copyright © 2003 Keith Packard
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
 
//public import externs.X11.Xdefs_d;
import include.regionstr;
import include.screenint;
import include.privates;
public import miext.damage.damage_;
import include.damagestr;

// struct _Damage;
alias DamagePtr = _damage*;

enum DamageReportLevel : ubyte {
    DamageReportRawRegion,
    DamageReportDeltaRegion,
    DamageReportBoundingBox,
    DamageReportNonEmpty,
    DamageReportNone
}
alias DamageReportRawRegion = DamageReportLevel.DamageReportRawRegion;
alias DamageReportDeltaRegion = DamageReportLevel.DamageReportDeltaRegion;
alias DamageReportBoundingBox = DamageReportLevel.DamageReportBoundingBox;
alias DamageReportNonEmpty = DamageReportLevel.DamageReportNonEmpty;
alias DamageReportNone = DamageReportLevel.DamageReportNone;

// struct _Region;
// alias RegionPtr = _Region*;
alias DamageReportFunc = void function(DamagePtr pDamage, RegionPtr pRegion, void* closure);
alias DamageDestroyFunc = void function(DamagePtr pDamage, void* closure);

struct _Drawable;
// alias DrawablePtr = _Drawable*;
alias DamageScreenCreateFunc = void function(DamagePtr);
alias DamageScreenRegisterFunc = void function(DrawablePtr, DamagePtr);
alias DamageScreenUnregisterFunc = void function(DrawablePtr, DamagePtr);
alias DamageScreenDestroyFunc = void function(DamagePtr);

/* @public
 *
 * @brief Driver callbacks for getting notified on several damage calls
 *
 * The pointer to this struct can be obtained via DamageGetScreenFuncs().
 * Drivers can inject themselves here, in order to get notified on
 * DamageCreate(), DamageRegister(), DamageUnregister(), DamageDestroy().
 *
 * The fields may be assigned to NULL, if no action at all is wanted.
 * (by default assigned to default implementations)
 *
 * This should ONLY be touched by video drivers, nobody else.
 *
 * So far the only one using it is the proprietary NVidia driver.
 */
struct _damageScreenFuncs {
    DamageScreenCreateFunc Create;
    DamageScreenRegisterFunc Register;
    DamageScreenUnregisterFunc Unregister;
    DamageScreenDestroyFunc Destroy;
}alias DamageScreenFuncsRec = _damageScreenFuncs;
alias DamageScreenFuncsPtr = _damageScreenFuncs*;

int miDamageCreate(DamagePtr);
int miDamageRegister(DrawablePtr, DamagePtr);
int miDamageUnregister(DrawablePtr, DamagePtr);
int miDamageDestroy(DamagePtr);

// struct _Screen;
// alias ScreenPtr = _Screen*;
// int DamageSetup(ScreenPtr pScreen);

// int DamageCreate(DamageReportFunc damageReport, DamageDestroyFunc damageDestroy, DamageReportLevel damageLevel, Bool isInternal, ScreenPtr pScreen, void* closure);

int DamageDrawInternal(ScreenPtr pScreen, Bool enable);

// int DamageRegister(DrawablePtr pDrawable, DamagePtr pDamage);

// int DamageUnregister(DamagePtr pDamage);

// int DamageDestroy(DamagePtr pDamage);

// int DamageSubtract(DamagePtr pDamage, const(RegionPtr) pRegion);

// int DamageEmpty(DamagePtr pDamage);

// int DamageRegion(DamagePtr pDamage);

// int DamagePendingRegion(DamagePtr pDamage);

/* In case of rendering, call this before the submitting the commands. */
int DamageRegionAppend(DrawablePtr pDrawable, RegionPtr pRegion);

/* Call this directly after the rendering operation has been submitted. */
int DamageRegionProcessPending(DrawablePtr pDrawable);

/* Call this when you create a new Damage and you wish to send an initial damage message (to it). */
// int DamageReportDamage(DamagePtr pDamage, RegionPtr pDamageRegion);

/* Avoid using this call, it only exists for API compatibility. */
// int DamageDamageRegion(DrawablePtr pDrawable, const(RegionPtr) pRegion);

// int DamageSetReportAfterOp(DamagePtr pDamage, Bool reportAfter);

DamageScreenFuncsPtr DamageGetScreenFuncs(ScreenPtr);

                          /* _DAMAGE_H_ */
