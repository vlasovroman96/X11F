module externs.X11.extensions.syncconst;
@nogc nothrow:
extern(C): __gshared:
/*

Copyright 1991, 1993, 1994, 1998  The Open Group

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

/***********************************************************
Copyright 1991,1993 by Digital Equipment Corporation, Maynard, Massachusetts,
and Olivetti Research Limited, Cambridge, England.

                        All Rights Reserved

Permission to use, copy, modify, and distribute this software and its
documentation for any purpose and without fee is hereby granted,
provided that the above copyright notice appear in all copies and that
both that copyright notice and this permission notice appear in
supporting documentation, and that the names of Digital or Olivetti
not be used in advertising or publicity pertaining to distribution of the
software without specific, written prior permission.

DIGITAL AND OLIVETTI DISCLAIM ALL WARRANTIES WITH REGARD TO THIS
SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND
FITNESS, IN NO EVENT SHALL THEY BE LIABLE FOR ANY SPECIAL, INDIRECT OR
CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF
USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
PERFORMANCE OF THIS SOFTWARE.

******************************************************************/

 
public import externs.X11.X;

enum SYNC_NAME = "SYNC";

enum SYNC_MAJOR_VERSION =	3;
enum SYNC_MINOR_VERSION =	1;


enum XSyncCounterNotify =              0;
enum XSyncAlarmNotify =		1;
enum XSyncAlarmNotifyMask = 		(1L << XSyncAlarmNotify);

enum XSyncNumberEvents =		2L;

enum XSyncBadCounter =			0L;
enum XSyncBadAlarm =			1L;
enum XSyncBadFence =           2L;
enum XSyncNumberErrors =		(XSyncBadFence + 1);

/*
 * Flags for Alarm Attributes
 */
enum XSyncCACounter =			(1L<<0);
enum XSyncCAValueType =		(1L<<1);
enum XSyncCAValue =			(1L<<2);
enum XSyncCATestType =			(1L<<3);
enum XSyncCADelta =			(1L<<4);
enum XSyncCAEvents =			(1L<<5);

/*  The _XSync macros below are for library internal use only.  They exist
 *  so that if we have to make a fix, we can change it in this one place
 *  and have both the macro and function variants inherit the fix.
 */

enum string _XSyncIntToValue(string pv, string i) = `((` ~ pv ~ `).hi=((` ~ i ~ `<0)?~0:0),(` ~ pv ~ `).lo=(` ~ i ~ `))`;
enum string _XSyncIntsToValue(string pv, string l, string h) = `((` ~ pv ~ `).lo = (` ~ l ~ `), (` ~ pv ~ `).hi = (` ~ h ~ `))`;
enum string _XSyncValueGreaterThan(string a, string b) = `
    ((` ~ a ~ `).hi>(` ~ b ~ `).hi || ((` ~ a ~ `).hi==(` ~ b ~ `).hi && (` ~ a ~ `).lo>(` ~ b ~ `).lo))`;
enum string _XSyncValueLessThan(string a, string b) = `
    ((` ~ a ~ `).hi<(` ~ b ~ `).hi || ((` ~ a ~ `).hi==(` ~ b ~ `).hi && (` ~ a ~ `).lo<(` ~ b ~ `).lo))`;
enum string _XSyncValueGreaterOrEqual(string a, string b) = `
    ((` ~ a ~ `).hi>(` ~ b ~ `).hi || ((` ~ a ~ `).hi==(` ~ b ~ `).hi && (` ~ a ~ `).lo>=(` ~ b ~ `).lo))`;
enum string _XSyncValueLessOrEqual(string a, string b) = `
    ((` ~ a ~ `).hi<(` ~ b ~ `).hi || ((` ~ a ~ `).hi==(` ~ b ~ `).hi && (` ~ a ~ `).lo<=(` ~ b ~ `).lo))`;
enum string _XSyncValueEqual(string a, string b) = `((` ~ a ~ `).lo==(` ~ b ~ `).lo && (` ~ a ~ `).hi==(` ~ b ~ `).hi)`;
enum string _XSyncValueIsNegative(string v) = `(((` ~ v ~ `).hi & 0x80000000) ? 1 : 0)`;
enum string _XSyncValueIsZero(string a) = `((` ~ a ~ `).lo==0 && (` ~ a ~ `).hi==0)`;
enum string _XSyncValueIsPositive(string v) = `(((` ~ v ~ `).hi & 0x80000000) ? 0 : 1)`;
enum string _XSyncValueLow32(string v) = `((` ~ v ~ `).lo)`;
enum string _XSyncValueHigh32(string v) = `((` ~ v ~ `).hi)`;
enum string _XSyncValueAdd(string presult,string a,string b,string poverflow) = `{
	int t = (` ~ a ~ `).lo;
	Bool signa = XSyncValueIsNegative(` ~ a ~ `);
	Bool signb = XSyncValueIsNegative(` ~ b ~ `);
	((` ~ presult ~ `).lo = (` ~ a ~ `).lo + (` ~ b ~ `).lo);
	((` ~ presult ~ `).hi = (` ~ a ~ `).hi + (` ~ b ~ `).hi);
	if (t>(` ~ presult ~ `).lo) (` ~ presult ~ `).hi++;
	*` ~ poverflow ~ ` = ((signa == signb) && !(signa == XSyncValueIsNegative(*` ~ presult ~ `)));
     }`;
enum string _XSyncValueSubtract(string presult,string a,string b,string poverflow) = `{
	int t = (` ~ a ~ `).lo;
	Bool signa = XSyncValueIsNegative(` ~ a ~ `);
	Bool signb = XSyncValueIsNegative(` ~ b ~ `);
	((` ~ presult ~ `).lo = (` ~ a ~ `).lo - (` ~ b ~ `).lo);
	((` ~ presult ~ `).hi = (` ~ a ~ `).hi - (` ~ b ~ `).hi);
	if (t<(` ~ presult ~ `).lo) (` ~ presult ~ `).hi--;
	*` ~ poverflow ~ ` = ((signa == signb) && !(signa == XSyncValueIsNegative(*` ~ presult ~ `)));
     }`;
enum string _XSyncMaxValue(string pv) = `((` ~ pv ~ `).hi = 0x7fffffff, (` ~ pv ~ `).lo = 0xffffffff)`;
enum string _XSyncMinValue(string pv) = `((` ~ pv ~ `).hi = 0x80000000, (` ~ pv ~ `).lo = 0)`;

/*
 *  These are the publicly usable macros.  If you want the function version
 *  of one of these, just #undef the macro to uncover the function.
 *  (This is the same convention that the ANSI C library uses.)
 */

enum string XSyncIntToValue(string pv, string i) = _XSyncIntToValue!(pv, i) ~ ``;
enum string XSyncIntsToValue(string pv, string l, string h) = _XSyncIntsToValue!(pv, l, h) ~ ``;
enum string XSyncValueGreaterThan(string a, string b) = _XSyncValueGreaterThan!(a, b) ~ ``;
enum string XSyncValueLessThan(string a, string b) = _XSyncValueLessThan!(a, b) ~ ``;
enum string XSyncValueGreaterOrEqual(string a, string b) = _XSyncValueGreaterOrEqual!(a, b) ~ ``;
enum string XSyncValueLessOrEqual(string a, string b) = _XSyncValueLessOrEqual!(a, b) ~ ``;
enum string XSyncValueEqual(string a, string b) = _XSyncValueEqual!(a, b) ~ ``;
enum string XSyncValueIsNegative(string v) = `_XSyncValueIsNegative(` ~ v ~ `)`;
enum string XSyncValueIsZero(string a) = `_XSyncValueIsZero(` ~ a ~ `)`;
enum string XSyncValueIsPositive(string v) = `_XSyncValueIsPositive(` ~ v ~ `)`;
enum string XSyncValueLow32(string v) = `_XSyncValueLow32(` ~ v ~ `)`;
enum string XSyncValueHigh32(string v) = `_XSyncValueHigh32(` ~ v ~ `)`;
enum string XSyncValueAdd(string presult,string a,string b,string poverflow) = _XSyncValueAdd!(presult,a,b,poverflow) ~ ``;
enum string XSyncValueSubtract(string presult,string a,string b,string poverflow) = _XSyncValueSubtract!(presult,a,b,poverflow) ~ ``;
enum string XSyncMaxValue(string pv) = `_XSyncMaxValue(` ~ pv ~ `)`;
enum string XSyncMinValue(string pv) = `_XSyncMinValue(` ~ pv ~ `)`;

/*
 * Constants for the value_type argument of various requests
 */
enum XSyncValueType {
    XSyncAbsolute,
    XSyncRelative
}
alias XSyncAbsolute = XSyncValueType.XSyncAbsolute;
alias XSyncRelative = XSyncValueType.XSyncRelative;


/*
 * Alarm Test types
 */
enum XSyncTestType {
    XSyncPositiveTransition,
    XSyncNegativeTransition,
    XSyncPositiveComparison,
    XSyncNegativeComparison
}
alias XSyncPositiveTransition = XSyncTestType.XSyncPositiveTransition;
alias XSyncNegativeTransition = XSyncTestType.XSyncNegativeTransition;
alias XSyncPositiveComparison = XSyncTestType.XSyncPositiveComparison;
alias XSyncNegativeComparison = XSyncTestType.XSyncNegativeComparison;


/*
 * Alarm state constants
 */
enum XSyncAlarmState {
    XSyncAlarmActive,
    XSyncAlarmInactive,
    XSyncAlarmDestroyed
}
alias XSyncAlarmActive = XSyncAlarmState.XSyncAlarmActive;
alias XSyncAlarmInactive = XSyncAlarmState.XSyncAlarmInactive;
alias XSyncAlarmDestroyed = XSyncAlarmState.XSyncAlarmDestroyed;



alias XSyncCounter = XID;
alias XSyncAlarm = XID;
alias XSyncFence = XID;
struct XSyncValue {
    int hi;
    uint lo;
}
 /* _SYNCCONST_H_ */
