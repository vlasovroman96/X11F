module Xext.dri2.dri2_priv;
@nogc nothrow:
extern(C): __gshared:
/* SPDX-License-Identifier: MIT OR X11
 *
 * Copyright © 2024 Enrico Weigelt, metux IT consult <info@metux.net>
 */
 
public import Xext.dri2.dri2;
import externs.X11.Xmd;
import externs.X11.Xdefs;


extern CARD8 dri2_major;        /* version of DRI2 supported by DDX */
extern CARD8 dri2_minor;

 /* _XSERVER_DRI2_PRIV_H_ */
