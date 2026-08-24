module externs.X11.extensions.bigreqsproto;
@nogc nothrow:
extern(C): __gshared:
/*

Copyright 1992, 1998  The Open Group

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
public import externs.X11.Xmd;


enum X_BigReqEnable =		0;

enum XBigReqNumberEvents =	0;

enum XBigReqNumberErrors =	0;

enum XBigReqExtensionName =	"BIG-REQUESTS";

struct xBigReqEnableReq {
    CARD8 reqType;	/* always XBigReqCode */
    CARD8 brReqType;	/* always X_BigReqEnable */
    CARD16 length;
}
enum sz_xBigReqEnableReq = 4;

struct xBigReqEnableReply {
    BYTE type;			/* X_Reply */
    CARD8 pad0;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD32 max_request_size;
    CARD32 pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
}
enum sz_xBigReqEnableReply = 32;


struct xBigReq {
	CARD8 reqType;
	CARD8 data;
	CARD16 zero;
	CARD32 length;
}

 /* _BIGREQSPROTO_H_ */
