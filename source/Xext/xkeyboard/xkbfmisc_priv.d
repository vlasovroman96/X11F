module xkb.xkbfmisc_priv;
@nogc nothrow:
extern(C): __gshared:
/* SPDX-License-Identifier: MIT OR X11
 *
 * Copyright © 2024 Enrico Weigelt, metux IT consult <info@metux.net>
 */
 
/* needed for X11/keysymdef.h to define all symdefs */
version = XK_MISCELLANY;

public import core.stdc.stdio;
//public import externs.X11.X;
//public import externs.X11.Xdefs_d;
public import externs.X11.keysymdef;
import include.xkbstr;
import include.xkbstr;


public import include.xkbsrv;

/*
 * return mask bits for _XkbKSCheckCase()
 */
enum _XkbKSLower =     (1<<0);
enum _XkbKSUpper =     (1<<1);

/*
 * check whether given KeySym is a upper or lower case key
 *
 * @param sym the KeySym to check
 * @return mask of _XkbKS* flags
 */
uint _XkbKSCheckCase(KeySym sym);

/*
 * check whether given KeySym is an lower case key
 *
 * @param k the KeySym to check
 * @return TRUE if k is a lower case key
 */
pragma(inline, true) Bool XkbKSIsLower(KeySym k) { return _XkbKSCheckCase(k)&_XkbKSLower; }

/*
 * check whether given KeySym is an upper case key
 *
 * @param k the KeySym to check
 * @return TRUE if k is a upper case key
 */
pragma(inline, true) Bool XkbKSIsUpper(KeySym k) { return _XkbKSCheckCase(k)&_XkbKSUpper; }

/*
 * check whether given KeySym is an keypad key
 *
 * @param k the KeySym to check
 * @return TRUE if k is a keypad key
 */
pragma(inline, true) Bool XkbKSIsKeypad(KeySym k) { return (((k)>=XK_KP_Space)&&((k)<=XK_KP_Equal)); }

/*
 * find a keycode by its name
 *
 * @param xkb pointer to xkb descriptor
 * @param name the key name
 * @param use_aliases TRUE if aliases should be resolved
 * @return keycode ID
 */
int XkbFindKeycodeByName(XkbDescPtr xkb, char* name, Bool use_aliases);

/*
 * write keymap for given component names
 *
 * @param file the FILE to write to
 * @param names pointer to list of keymap component names to write out
 * @param xkb pointer to xkb descriptor
 * @param want bitmask of wanted elements
 * @param need bitmask of needed elements
 * @return TRUE if succeeded
*/
Bool XkbWriteXKBKeymapForNames(FILE* file, XkbComponentNamesPtr names, XkbDescPtr xkb, uint want, uint need);

 /* _XSERVER_XKB_XKBFMISC_PRIV_H */
