module ddxPrivate.c;
@nogc nothrow:
extern(C): __gshared:

import dix-config;

import X11/X;

import xkbsrv_priv;

import windowstr;

int XkbDDXPrivate(DeviceIntPtr dev, KeyCode key, XkbAction* act)
{
    return 0;
}
