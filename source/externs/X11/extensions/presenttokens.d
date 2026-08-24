module externs.X11.extensions.presenttokens;
@nogc nothrow:
extern(C): __gshared:
/*
 * Copyright © 2013 Keith Packard
 *
 * Permission to use, copy, modify, distribute, and sell this software and its
 * documentation for any purpose is hereby granted without fee, provided that
 * the above copyright notice appear in all copies and that both that copyright
 * notice and this permission notice appear in supporting documentation, and
 * that the name of the copyright holders not be used in advertising or
 * publicity pertaining to distribution of the software without specific,
 * written prior permission.  The copyright holders make no representations
 * about the suitability of this software for any purpose.  It is provided "as
 * is" without express or implied warranty.
 *
 * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
 * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
 * EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY SPECIAL, INDIRECT OR
 * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
 * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
 * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE
 * OF THIS SOFTWARE.
 */

 
enum PRESENT_NAME =			"Present";
enum PRESENT_MAJOR =			1;
enum PRESENT_MINOR =			4;

enum PresentNumberErrors =		0;
enum PresentNumberEvents =		0;

/* Requests */
enum X_PresentQueryVersion =		0;
enum X_PresentPixmap =			1;
enum X_PresentNotifyMSC =		2;
enum X_PresentSelectInput =		3;
enum X_PresentQueryCapabilities =      4;
enum X_PresentPixmapSynced =		5;

enum PresentNumberRequests =		6;

/* Present operation options */
enum PresentOptionNone =               0;
enum PresentOptionAsync =              (1 << 0);
enum PresentOptionCopy =               (1 << 1);
enum PresentOptionUST =                (1 << 2);
enum PresentOptionSuboptimal =         (1 << 3);
enum PresentOptionAsyncMayTear =       (1 << 4);

enum PresentAllOptions =       (PresentOptionAsync | 
                                 PresentOptionCopy | 
                                 PresentOptionUST | 
                                 PresentOptionSuboptimal | 
                                 PresentOptionAsyncMayTear);

enum PresentAllAsyncOptions = (PresentOptionAsync | PresentOptionAsyncMayTear);

/* Present capabilities */

enum PresentCapabilityNone =           0;
enum PresentCapabilityAsync =          1;
enum PresentCapabilityFence =          2;
enum PresentCapabilityUST =            4;
enum PresentCapabilityAsyncMayTear =   8;
enum PresentCapabilitySyncobj =        16;

enum PresentAllCapabilities =  (PresentCapabilityAsync | 
                                 PresentCapabilityFence | 
                                 PresentCapabilityUST | 
                                 PresentCapabilityAsyncMayTear | 
                                 PresentCapabilitySyncobj);

enum PresentAllAsyncCapabilities = (PresentCapabilityAsync | PresentCapabilityAsyncMayTear);

/* Events */
enum PresentConfigureNotify =	0;
enum PresentCompleteNotify =	1;
enum PresentIdleNotify =       2;
version(PRESENT_FUTURE_VERSION) {
enum PresentRedirectNotify =	3;
}

/* Event Masks */
enum PresentConfigureNotifyMask =      1;
enum PresentCompleteNotifyMask =       2;
enum PresentIdleNotifyMask =           4;
version(PRESENT_FUTURE_VERSION) {
enum PresentRedirectNotifyMask =       8;
}

version(PRESENT_FUTURE_VERSION) {
enum PRESENT_REDIRECT_NOTIFY_MASK =    PresentRedirectNotifyMask;
} else {
enum PRESENT_REDIRECT_NOTIFY_MASK =    0;
}

enum PresentAllEvents =   (PresentConfigureNotifyMask |        
                            PresentCompleteNotifyMask |         
                            PresentIdleNotifyMask |             
                            PRESENT_REDIRECT_NOTIFY_MASK);

/* Complete Kinds */

enum PresentCompleteKindPixmap =       0;
enum PresentCompleteKindNotifyMSC =    1;

/* Complete Modes */

enum PresentCompleteModeCopy =           0;
enum PresentCompleteModeFlip =           1;
enum PresentCompleteModeSkip =           2;
enum PresentCompleteModeSuboptimalCopy = 3;


