module externs.X11.extensions.xf86vm;
@nogc nothrow:
extern(C): __gshared:
/*

Copyright 1995  Kaleb S. KEITHLEY

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL Kaleb S. KEITHLEY BE LIABLE FOR ANY CLAIM, DAMAGES
OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

Except as contained in this notice, the name of Kaleb S. KEITHLEY
shall not be used in advertising or otherwise to promote the sale, use
or other dealings in this Software without prior written authorization
from Kaleb S. KEITHLEY

*/

/* THIS IS NOT AN X CONSORTIUM STANDARD OR AN X PROJECT TEAM SPECIFICATION */

 
public import externs.X11.Xmd;


enum CLKFLAG_PROGRAMABLE =		1;

version (XF86VIDMODE_EVENTS) {
enum XF86VidModeNotify =		0;
enum XF86VidModeNumberEvents =		(XF86VidModeNotify + 1);

enum XF86VidModeNotifyMask =		0x00000001;

enum XF86VidModeNonEvent =		0;
enum XF86VidModeModeChange =		1;
} else {
enum XF86VidModeNumberEvents =		0;
}

enum XF86VidModeBadClock =		0;
enum XF86VidModeBadHTimings =		1;
enum XF86VidModeBadVTimings =		2;
enum XF86VidModeModeUnsuitable =	3;
enum XF86VidModeExtensionDisabled =	4;
enum XF86VidModeClientNotLocal =	5;
enum XF86VidModeZoomLocked =		6;
enum XF86VidModeNumberErrors =		(XF86VidModeZoomLocked + 1);

enum XF86VM_READ_PERMISSION =	1;
enum XF86VM_WRITE_PERMISSION =	2;


