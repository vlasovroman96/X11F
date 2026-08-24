module externs.X11.extensions.Xv;
@nogc nothrow:
extern(C): __gshared:
/***********************************************************
Copyright 1991 by Digital Equipment Corporation, Maynard, Massachusetts,
and the Massachusetts Institute of Technology, Cambridge, Massachusetts.

                        All Rights Reserved

Permission to use, copy, modify, and distribute this software and its
documentation for any purpose and without fee is hereby granted,
provided that the above copyright notice appear in all copies and that
both that copyright notice and this permission notice appear in
supporting documentation, and that the names of Digital or MIT not be
used in advertising or publicity pertaining to distribution of the
software without specific, written prior permission.

DIGITAL DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING
ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT SHALL
DIGITAL BE LIABLE FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR
ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS,
WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION,
ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
SOFTWARE.

******************************************************************/

 
/*
** File:
**
**   Xv.h --- Xv shared library and server header file
**
** Author:
**
**   David Carver (Digital Workstation Engineering/Project Athena)
**
** Revisions:
**
**   05.15.91 Carver
**     - version 2.0 upgrade
**
**   01.24.91 Carver
**     - version 1.4 upgrade
**
*/

public import externs.X11.X;

enum XvName = "XVideo";
enum XvVersion = 2;
enum XvRevision = 2;

/* Symbols */

alias XvPortID = XID;
alias XvEncodingID = XID;

enum XvNone = 0;

enum XvInput =          0;
enum XvOutput =         1;

enum XvInputMask =      (1<<XvInput);
enum XvOutputMask =     (1<<XvOutput);
enum XvVideoMask =	 0x00000004;
enum XvStillMask =	 0x00000008;
enum XvImageMask =	 0x00000010;

/* These two are not client viewable */
enum XvPixmapMask =	 0x00010000;
enum XvWindowMask =	 0x00020000;


enum XvGettable =	0x01;
enum XvSettable =	0x02;

enum XvRGB =		0;
enum XvYUV =		1;

enum XvPacked =	0;
enum XvPlanar =	1;

enum XvTopToBottom =	0;
enum XvBottomToTop =	1;


/* Events */

enum XvVideoNotify = 0;
enum XvPortNotify = 1;
enum XvNumEvents = 2;

/* Video Notify Reasons */

enum XvStarted = 0;
enum XvStopped = 1;
enum XvBusy = 2;
enum XvPreempted = 3;
enum XvHardError = 4;
enum XvLastReason = 4;

enum XvNumReasons = (XvLastReason + 1);

enum XvStartedMask =     (1<<XvStarted);
enum XvStoppedMask =     (1<<XvStopped);
enum XvBusyMask =        (1<<XvBusy);
enum XvPreemptedMask =   (1<<XvPreempted);
enum XvHardErrorMask =   (1<<XvHardError);

enum XvAnyReasonMask =   ((1<<XvNumReasons) - 1);
enum XvNoReasonMask =    0;

/* Errors */

enum XvBadPort = 0;
enum XvBadEncoding = 1;
enum XvBadControl = 2;
enum XvNumErrors = 3;

/* Status */

enum XvBadExtension = 1;
enum XvAlreadyGrabbed = 2;
enum XvInvalidTime = 3;
enum XvBadReply = 4;
enum XvBadAlloc = 5;

 /* XV_H */

