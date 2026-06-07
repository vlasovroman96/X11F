module xorgHelper;
@nogc nothrow:
extern(C): __gshared:
import build.xorg_config;

//import externs.x11.X;

import include.xorgVersion;

import include.os;
import include.servermd;
import include.pixmapstr;
import include.windowstr;
import include.propertyst;
import include.gcstruct;
import hw.xfree86.loader.loaderProcs;
import include.xf86;
import include.xf86Priv;

CARD32 xorgGetVersion()
{
    return XORG_VERSION_CURRENT;
}
