module externs.X11.extensions.xcmiscproto;
@nogc nothrow:
extern(C): __gshared:
/*

Copyright 1993, 1994, 1998  The Open Group

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

 
enum X_XCMiscGetVersion =	0;
enum X_XCMiscGetXIDRange =	1;
enum X_XCMiscGetXIDList =	2;

enum XCMiscNumberEvents =	0;

enum XCMiscNumberErrors =	0;

enum XCMiscMajorVersion =	1;
enum XCMiscMinorVersion =	1;

enum XCMiscExtensionName =	"XC-MISC";

public import externs.X11.Xmd;

struct xXCMiscGetVersionReq {
    CARD8 reqType;	/* always XCMiscCode */
    CARD8 miscReqType;	/* always X_XCMiscGetVersion */
    CARD16 length;
    CARD16 majorVersion;
    CARD16 minorVersion;
}
enum sz_xXCMiscGetVersionReq = 8;

struct xXCMiscGetVersionReply {
    BYTE type;			/* X_Reply */
    CARD8 pad0;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD16 majorVersion;
    CARD16 minorVersion;
    CARD32 pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
}
enum sz_xXCMiscGetVersionReply = 32;

struct xXCMiscGetXIDRangeReq {
    CARD8 reqType;	/* always XCMiscCode */
    CARD8 miscReqType;	/* always X_XCMiscGetXIDRange */
    CARD16 length;
}
enum sz_xXCMiscGetXIDRangeReq = 4;

struct xXCMiscGetXIDRangeReply {
    BYTE type;			/* X_Reply */
    CARD8 pad0;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 start_id;
    CARD32 count;
    CARD32 pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
}
enum sz_xXCMiscGetXIDRangeReply = 32;

struct xXCMiscGetXIDListReq {
    CARD8 reqType;	/* always XCMiscCode */
    CARD8 miscReqType;	/* always X_XCMiscGetXIDList */
    CARD16 length;
    CARD32 count;		/* number of IDs requested */
}
enum sz_xXCMiscGetXIDListReq = 8;

struct xXCMiscGetXIDListReply {
    BYTE type;			/* X_Reply */
    CARD8 pad0;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 count;		/* number of IDs requested */
    CARD32 pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
}
enum sz_xXCMiscGetXIDListReply = 32;

 /* _XCMISCPROTO_H_ */
