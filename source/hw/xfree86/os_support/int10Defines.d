module hw.xfree86.os_support.int10Defines;
@nogc nothrow:
extern(C): __gshared:
/*
 * Copyright (c) 2000-2001 by The XFree86 Project, Inc.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
 * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
 * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
 * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 *
 * Except as contained in this notice, the name of the copyright holder(s)
 * and author(s) shall not be used in advertising or otherwise to promote
 * the sale, use or other dealings in this Software without prior written
 * authorization from the copyright holder(s) and author(s).
 */

// version (_INT10DEFINES_H_) {} else {
// enum _INT10DEFINES_H_ = 1;

// version (_VM86_LINUX) {

public import externs.c_asm.vm86;
import externs.X11.Xdefs;
import externs.X11.Xmd;


// enum string CPU_R(string type,string name,string num) = `
// 	((cast(`~type~`*)&((cast(vm86_struct*)REG.cpuRegs).regs.` ~ name ~ `))[` ~ num ~ `])`;
// enum string CPU_RD(string name,string num) = `` ~ CPU_R!(`CARD32`,name,num) ~ ``;
// enum string CPU_RW(string name,string num) = `` ~ CPU_R!(`CARD16`,name,num) ~ ``;
// enum string CPU_RB(string name,string num) = `` ~ CPU_R!(`CARD8`,name,num) ~ ``;

// auto X86_EAX = mixin(CPU_RD!("eax","0"));
// auto X86_EBX = mixin(CPU_RD!("ebx","0"));
// auto X86_ECX = mixin(CPU_RD!("ecx","0"));
// auto X86_EDX = mixin(CPU_RD!("edx","0"));
// auto X86_ESI = mixin(CPU_RD!("esi","0"));
// auto X86_EDI = mixin(CPU_RD!("edi","0"));
// auto X86_EBP = mixin(CPU_RD!("ebp","0"));
// auto X86_EIP = mixin(CPU_RD!("eip","0"));
// auto X86_ESP = mixin(CPU_RD!("esp","0"));
// auto X86_EFLAGS = mixin(CPU_RD!("eflags","0"));

// auto X86_FLAGS = mixin(CPU_RW!("eflags","0"));
// auto X86_AX = mixin(CPU_RW!("eax","0"));
// auto X86_BX = mixin(CPU_RW!("ebx","0"));
// auto X86_CX = mixin(CPU_RW!("ecx","0"));
// auto X86_DX = mixin(CPU_RW!("edx","0"));
// auto X86_SI = mixin(CPU_RW!("esi","0"));
// auto X86_DI = mixin(CPU_RW!("edi","0"));
// auto X86_BP = mixin(CPU_RW!("ebp","0"));
// auto X86_IP = mixin(CPU_RW!("eip","0"));
// auto X86_SP = mixin(CPU_RW!("esp","0"));
// auto X86_CS = mixin(CPU_RW!("cs","0"));
// auto X86_DS = mixin(CPU_RW!("ds","0"));
// auto X86_ES = mixin(CPU_RW!("es","0"));
// auto X86_SS = mixin(CPU_RW!("ss","0"));
// auto X86_FS = mixin(CPU_RW!("fs","0"));
// auto X86_GS = mixin(CPU_RW!("gs","0"));

// auto X86_AL = mixin(CPU_RB!("eax","0"));
// auto X86_BL = mixin(CPU_RB!("ebx","0"));
// auto X86_CL = mixin(CPU_RB!("ecx","0"));
// auto X86_DL = mixin(CPU_RB!("edx","0"));

// auto X86_AH = mixin(CPU_RB!("eax","1"));
// auto X86_BH = mixin(CPU_RB!("ebx","1"));
// auto X86_CH = mixin(CPU_RB!("ecx","1"));
// auto X86_DH = mixin(CPU_RB!("edx","1"));

// } else version (_X86EMU) {

// public import xf86x86emu;

// }

// }
