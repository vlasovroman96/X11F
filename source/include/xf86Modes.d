module include.xf86Modes;
@nogc nothrow:
extern(C): __gshared:
/*
 * Copyright © 2006 Intel Corporation
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice (including the next
 * paragraph) shall be included in all copies or substantial portions of the
 * Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 *
 * Authors:
 *    Eric Anholt <eric@anholt.net>
 *
 */

 
public import core.stdc.stddef;
public import core.stdc.string;
public import core.stdc.stdio;

public import include.xf86;
public import include.xorgVersion;
public import include.edid;
public import include.xf86Parser;

extern void  xf86ModeHSync(const(DisplayModeRec)* mode);
extern void  xf86ModeVRefresh(const(DisplayModeRec)* mode);
extern uint xf86ModeBandwidth(DisplayModePtr mode, int depth);

extern void  xf86ModeWidth(const(DisplayModeRec)* mode, Rotation rotation);

extern void  xf86ModeHeight(const(DisplayModeRec)* mode, Rotation rotation);

extern void  xf86DuplicateMode(const(DisplayModeRec)* pMode);
extern void  xf86DuplicateModes(ScrnInfoPtr pScrn, DisplayModePtr modeList);
extern void  xf86SetModeDefaultName(DisplayModePtr mode);
extern void  xf86SetModeCrtc(DisplayModePtr p, int adjustFlags);
extern void  xf86ModesEqual(const(DisplayModeRec)* pMode1, const(DisplayModeRec)* pMode2);
extern void  xf86PrintModeline(int scrnIndex, DisplayModePtr mode);
extern void  xf86ModesAdd(DisplayModePtr modes, DisplayModePtr new_);

extern void  xf86DDCGetModes(int scrnIndex, xf86MonPtr DDC);
extern void  xf86CVTMode(int HDisplay, int VDisplay, float VRefresh, Bool Reduced, Bool Interlaced);
extern void  xf86GTFMode(int h_pixels, int v_lines, float freq, int interlaced, int margins);

extern void  xf86ModeIsReduced(const(DisplayModeRec)* mode);

extern void  xf86ValidateModesFlags(ScrnInfoPtr pScrn, DisplayModePtr modeList, int flags);

extern void  xf86ValidateModesClocks(ScrnInfoPtr pScrn, DisplayModePtr modeList, int* min, int* max, int n_ranges);

extern void  xf86ValidateModesSize(ScrnInfoPtr pScrn, DisplayModePtr modeList, int maxX, int maxY, int maxPitch);

extern void  xf86ValidateModesSync(ScrnInfoPtr pScrn, DisplayModePtr modeList, MonPtr mon);

extern void  xf86ValidateModesBandwidth(ScrnInfoPtr pScrn, DisplayModePtr modeList, uint bandwidth, int depth);

extern void  xf86ValidateModesReducedBlanking(ScrnInfoPtr pScrn, DisplayModePtr modeList);

extern void  xf86PruneInvalidModes(ScrnInfoPtr pScrn, DisplayModePtr* modeList, Bool verbose);

extern void  xf86PruneDuplicateModes(DisplayModePtr modes);

extern void  xf86ValidateModesUserConfig(ScrnInfoPtr pScrn, DisplayModePtr modeList);

extern void  xf86GetMonitorModes(ScrnInfoPtr pScrn, XF86ConfMonitorPtr conf_monitor);

extern DisplayModePtr xf86GetDefaultModes();

extern void  xf86SaveModeContents(DisplayModePtr intern, const(DisplayModeRec)* mode);

extern void  xf86DDCApplyQuirks(int scrnIndex, xf86MonPtr DDC);

                          /* _XF86MODES_H_ */
