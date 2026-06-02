module externs.linux.vt;
@nogc nothrow:
extern(C): __gshared:
/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 
public import core.sys.posix.sys.ioctl;
public import core.sys.posix.sys.types;

/*
 * These constants are also useful for user-level apps (e.g., VC
 * resizing).
 */
enum MIN_NR_CONSOLES = 1       /* must be at least 1 */;
enum MAX_NR_CONSOLES =	63	/* serial lines start at 64 */;
		/* Note: the ioctl VT_GETSTATE does not work for
		   consoles 16 and higher (since it returns a short) */

/* 0x56 is 'V', to avoid collision with termios and kd */

enum VT_OPENQRY =	0x5600	/* find available vt */;

struct vt_mode {
	ubyte mode;		/* vt mode */
	ubyte waitv;		/* if set, hang on writes if not active */
	short relsig;		/* signal to raise on release req */
	short acqsig;		/* signal to raise on acquisition */
	short frsig;		/* unused (set to 0) */
}
enum VT_GETMODE =	0x5601	/* get mode of active vt */;
enum VT_SETMODE =	0x5602	/* set mode of active vt */;
enum		VT_AUTO =		0x00	/* auto vt switching */;
enum		VT_PROCESS =	0x01	/* process controls switching */;
enum		VT_ACKACQ =	0x02	/* acknowledge switch */;

struct vt_stat {
	ushort v_active;	/* active vt */
	ushort v_signal;	/* signal to send */
	ushort v_state;		/* vt bitmask */
}
enum VT_GETSTATE =	0x5603	/* get global vt state info */;
enum VT_SENDSIG =	0x5604	/* signal to send to bitmask of vts */;

enum VT_RELDISP =	0x5605	/* release display */;

enum VT_ACTIVATE =	0x5606	/* make vt active */;
enum VT_WAITACTIVE =	0x5607	/* wait for vt active */;
enum VT_DISALLOCATE =	0x5608  /* free memory associated to vt */;

struct vt_sizes {
	ushort v_rows;		/* number of rows */
	ushort v_cols;		/* number of columns */
	ushort v_scrollsize;	/* number of lines of scrollback */
}
enum VT_RESIZE =	0x5609	/* set kernel's idea of screensize */;

struct vt_consize {
	ushort v_rows;	/* number of rows */
	ushort v_cols;	/* number of columns */
	ushort v_vlin;	/* number of pixel rows on screen */
	ushort v_clin;	/* number of pixel rows per character */
	ushort v_vcol;	/* number of pixel columns on screen */
	ushort v_ccol;	/* number of pixel columns per character */
}
enum VT_RESIZEX =      0x560A  /* set kernel's idea of screensize + more */;
enum VT_LOCKSWITCH =   0x560B  /* disallow vt switching */;
enum VT_UNLOCKSWITCH = 0x560C  /* allow vt switching */;
enum VT_GETHIFONTMASK = 0x560D  /* return hi font mask */;

struct vt_event {
	uint event;
enum VT_EVENT_SWITCH =		0x0001	/* Console switch */;
enum VT_EVENT_BLANK =		0x0002	/* Screen blank */;
enum VT_EVENT_UNBLANK =	0x0004	/* Screen unblank */;
enum VT_EVENT_RESIZE =		0x0008	/* Resize display */;
enum VT_MAX_EVENT =		0x000F;
	uint oldev;		/* Old console */
	uint newev;		/* New console (if changing) */
	uint[4] pad;		/* Padding for expansion */
}

enum VT_WAITEVENT =	0x560E	/* Wait for an event */;

struct vt_setactivate {
	uint console;
	vt_mode mode;
}

enum VT_SETACTIVATE =	0x560F	/* Activate and set the mode of a console */;

/* get console size and cursor position */
struct vt_consizecsrpos {
	ushort con_rows;		/* number of console rows */
	ushort con_cols;		/* number of console columns */
	ushort csr_row;		/* current cursor's row */
	ushort csr_col;		/* current cursor's column */
}
enum VT_GETCONSIZECSRPOS =	_IOR!vt_consizecsrpos('V', 0x10);

 /* _LINUX_VT_H */
