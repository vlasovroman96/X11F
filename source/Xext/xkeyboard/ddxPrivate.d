module xkb.ddxPrivate;
@nogc nothrow:
extern(C): __gshared:

import build.dix_config;

//import externs.X11.X;

import xkb.xkbsrv_priv;

import include.windowstr;
import include.xkbstr;


int XkbDDXPrivate(DeviceIntPtr dev, KeyCode key, XkbAction* act)
{
    return 0;
}
