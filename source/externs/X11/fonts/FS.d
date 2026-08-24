module externs.X11.fonts.FS;
@nogc nothrow:
extern(C): __gshared:
/*
 * Copyright 1990, 1991 Network Computing Devices;
 * Portions Copyright 1987 by Digital Equipment Corporation
 *
 * Permission to use, copy, modify, distribute, and sell this software and
 * its documentation for any purpose is hereby granted without fee, provided
 * that the above copyright notice appear in all copies and that both that
 * copyright notice and this permission notice appear in supporting
 * documentation, and that the names of Network Computing Devices or Digital
 * not be used in advertising or publicity pertaining to distribution
 * of the software without specific, written prior permission.
 * Network Computing Devices and Digital make no representations
 * about the suitability of this software for any purpose.  It is provided
 * "as is" without express or implied warranty.
 *
 * NETWORK COMPUTING DEVICES AND DIGITAL DISCLAIM ALL WARRANTIES WITH
 * REGARD TO THIS SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS, IN NO EVENT SHALL NETWORK COMPUTING DEVICES
 * OR DIGITAL BE LIABLE FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL
 * DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR
 * PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS
 * ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF
 * THIS SOFTWARE.
 */

/*

Portions Copyright 1987, 1994, 1998  The Open Group

Permission to use, copy, modify, distribute, and sell this software and its
documentation for any purpose is hereby granted without fee, provided that
the above copyright notice appear in all copies and that both that
copyright notice and this permission notice appear in supporting
documentation.

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
OPEN GROUP BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Except as contained in this notice, the name of The Open Group shall not be
used in advertising or otherwise to promote the sale, use or other dealings
in this Software without prior written authorization from The Open Group.

*/

 
public import externs.X11.Xdefs;
public import externs.X11.fonts.fsmasks;

enum	FS_PROTOCOL =		2;
enum	FS_PROTOCOL_MINOR =	0;

version (X_PROTOCOL) {} else {
/* protocol families */
enum FamilyInternet =          0;
enum FamilyDECnet =            1;
enum FamilyChaos =             2;
enum FamilyInternet6 =         6;


alias FSDrawDirection = uint;
}

enum	None =		0L;


enum	LeftToRightDrawDirection =	0;
enum	RightToLeftDrawDirection =	1;

/* font info flags */
enum	FontInfoAllCharsExist =		(1L << 0);
enum	FontInfoInkInside =		(1L << 1);
enum	FontInfoHorizontalOverlap =	(1L << 2);

/* auth status flags */
enum	AuthSuccess =	0;
enum	AuthContinue =	1;
enum	AuthBusy =	2;
enum	AuthDenied =	3;

/* property types */
enum	PropTypeString =		0;
enum	PropTypeUnsigned =	1;
enum	PropTypeSigned =		2;

version (LSBFirst) {} else {
/* byte order */
enum LSBFirst =                0;
enum MSBFirst =                1;
}

/* event masks */
enum	CatalogueChangeNotifyMask =	(1L << 0);
enum	FontChangeNotifyMask =		(1L << 1);

/* errors */
enum	FSSuccess =		-1;
enum	FSBadRequest =		0;
enum	FSBadFormat =		1;
enum	FSBadFont =		2;
enum	FSBadRange =		3;
enum	FSBadEventMask =		4;
enum	FSBadAccessContext =	5;
enum	FSBadIDChoice =		6;
enum	FSBadName =		7;
enum	FSBadResolution =		8;
enum	FSBadAlloc =		9;
enum	FSBadLength =		10;
enum	FSBadImplementation =	11;

enum	FirstExtensionError =	128;
enum	LastExtensionError =	255;

/* events */
enum	KeepAlive =		0;
enum	CatalogueChangeNotify =	1;
enum	FontChangeNotify =	2;
enum FSLASTEvent =		3;

				/* _FS_H_ */
