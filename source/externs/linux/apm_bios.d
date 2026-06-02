module externs.linux.apm_bios;
@nogc nothrow:
extern(C): __gshared:
/* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
/*
 * Include file for the interface to an APM BIOS
 * Copyright 1994-2001 Stephen Rothwell (sfr@canb.auug.org.au)
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2, or (at your option) any
 * later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 */
 
public import core.sys.posix.sys.types;

alias apm_event_t = ushort;
alias apm_eventinfo_t = ushort;

struct apm_bios_info {
	ushort version_;
	ushort cseg;
	uint offset;
	ushort cseg_16;
	ushort dseg;
	ushort flags;
	ushort cseg_len;
	ushort cseg_16_len;
	ushort dseg_len;
}


/*
 * Power states
 */
enum APM_STATE_READY =		0x0000;
enum APM_STATE_STANDBY =	0x0001;
enum APM_STATE_SUSPEND =	0x0002;
enum APM_STATE_OFF =		0x0003;
enum APM_STATE_BUSY =		0x0004;
enum APM_STATE_REJECT =	0x0005;
enum APM_STATE_OEM_SYS =	0x0020;
enum APM_STATE_OEM_DEV =	0x0040;

enum APM_STATE_DISABLE =	0x0000;
enum APM_STATE_ENABLE =	0x0001;

enum APM_STATE_DISENGAGE =	0x0000;
enum APM_STATE_ENGAGE =	0x0001;

/*
 * Events (results of Get PM Event)
 */
enum APM_SYS_STANDBY =		0x0001;
enum APM_SYS_SUSPEND =		0x0002;
enum APM_NORMAL_RESUME =	0x0003;
enum APM_CRITICAL_RESUME =	0x0004;
enum APM_LOW_BATTERY =		0x0005;
enum APM_POWER_STATUS_CHANGE =	0x0006;
enum APM_UPDATE_TIME =		0x0007;
enum APM_CRITICAL_SUSPEND =	0x0008;
enum APM_USER_STANDBY =	0x0009;
enum APM_USER_SUSPEND =	0x000a;
enum APM_STANDBY_RESUME =	0x000b;
enum APM_CAPABILITY_CHANGE =	0x000c;
enum APM_USER_HIBERNATION =	0x000d;
enum APM_HIBERNATION_RESUME =	0x000e;

/*
 * Error codes
 */
enum APM_SUCCESS =		0x00;
enum APM_DISABLED =		0x01;
enum APM_CONNECTED =		0x02;
enum APM_NOT_CONNECTED =	0x03;
enum APM_16_CONNECTED =	0x05;
enum APM_16_UNSUPPORTED =	0x06;
enum APM_32_CONNECTED =	0x07;
enum APM_32_UNSUPPORTED =	0x08;
enum APM_BAD_DEVICE =		0x09;
enum APM_BAD_PARAM =		0x0a;
enum APM_NOT_ENGAGED =		0x0b;
enum APM_BAD_FUNCTION =	0x0c;
enum APM_RESUME_DISABLED =	0x0d;
enum APM_NO_ERROR =		0x53;
enum APM_BAD_STATE =		0x60;
enum APM_NO_EVENTS =		0x80;
enum APM_NOT_PRESENT =		0x86;

/*
 * APM Device IDs
 */
enum APM_DEVICE_BIOS =		0x0000;
enum APM_DEVICE_ALL =		0x0001;
enum APM_DEVICE_DISPLAY =	0x0100;
enum APM_DEVICE_STORAGE =	0x0200;
enum APM_DEVICE_PARALLEL =	0x0300;
enum APM_DEVICE_SERIAL =	0x0400;
enum APM_DEVICE_NETWORK =	0x0500;
enum APM_DEVICE_PCMCIA =	0x0600;
enum APM_DEVICE_BATTERY =	0x8000;
enum APM_DEVICE_OEM =		0xe000;
enum APM_DEVICE_OLD_ALL =	0xffff;
enum APM_DEVICE_CLASS =	0x00ff;
enum APM_DEVICE_MASK =		0xff00;


/*
 * Battery status
 */
enum APM_MAX_BATTERIES =	2;

/*
 * APM defined capability bit flags
 */
enum APM_CAP_GLOBAL_STANDBY =		0x0001;
enum APM_CAP_GLOBAL_SUSPEND =		0x0002;
enum APM_CAP_RESUME_STANDBY_TIMER =	0x0004 /* Timer resume from standby */;
enum APM_CAP_RESUME_SUSPEND_TIMER =	0x0008 /* Timer resume from suspend */;
enum APM_CAP_RESUME_STANDBY_RING =	0x0010 /* Resume on Ring fr standby */;
enum APM_CAP_RESUME_SUSPEND_RING =	0x0020 /* Resume on Ring fr suspend */;
enum APM_CAP_RESUME_STANDBY_PCMCIA =	0x0040 /* Resume on PCMCIA Ring	*/;
enum APM_CAP_RESUME_SUSPEND_PCMCIA =	0x0080 /* Resume on PCMCIA Ring	*/;

/*
 * ioctl operations
 */
public import core.sys.posix.sys.ioctl;

enum APM_IOC_STANDBY =		_IO('A', 1);
enum APM_IOC_SUSPEND =		_IO('A', 2);

 /* _LINUX_APM_H */
