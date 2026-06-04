module x86emu;
@nogc nothrow:
extern(C): __gshared:
import build.xorg_config;

import hw.xfree86.x86emu.c_debug;
import hw.xfree86.x86emu.decode;
import hw.xfree86.x86emu.fpu;
import hw.xfree86.x86emu.ops;
import hw.xfree86.x86emu.ops2;
import hw.xfree86.x86emu.prim_ops;
import hw.xfree86.x86emu.sys;
