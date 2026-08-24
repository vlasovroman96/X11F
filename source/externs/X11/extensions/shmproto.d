module externs.X11.extensions.shmproto;
@nogc nothrow:
extern(C): __gshared:
/************************************************************

Copyright 1989, 1998  The Open Group

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

********************************************************/

/* THIS IS NOT AN X CONSORTIUM STANDARD OR AN X PROJECT TEAM SPECIFICATION */

 
public import externs.X11.extensions.shm;
public import externs.X11.Xmd;

alias ShmSeg = CARD32;
alias Drawable = CARD32;
alias VisualID = CARD32;
alias GContext = CARD32;
alias Pixmap = CARD32;

enum X_ShmQueryVersion =		0;
enum X_ShmAttach =			1;
enum X_ShmDetach =			2;
enum X_ShmPutImage =			3;
enum X_ShmGetImage =			4;
enum X_ShmCreatePixmap =		5;
enum X_ShmAttachFd =                   6;
enum X_ShmCreateSegment =              7;

struct xShmQueryVersionReq {
    CARD8 reqType;		/* always ShmReqCode */
    CARD8 shmReqType;		/* always X_ShmQueryVersion */
    CARD16 length;
}
enum sz_xShmQueryVersionReq =	4;

struct xShmQueryVersionReply {
    BYTE type;			/* X_Reply */
    BOOL sharedPixmaps;
    CARD16 sequenceNumber;
    CARD32 length;
    CARD16 majorVersion;		/* major version of SHM protocol */
    CARD16 minorVersion;		/* minor version of SHM protocol */
    CARD16 uid;
    CARD16 gid;
    CARD8 pixmapFormat;
    CARD8 pad0;
    CARD16 pad1;
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
}
enum sz_xShmQueryVersionReply =	32;

struct xShmAttachReq {
    CARD8 reqType;	/* always ShmReqCode */
    CARD8 shmReqType;	/* always X_ShmAttach */
    CARD16 length;
    ShmSeg shmseg;
    CARD32 shmid;
    BOOL readOnly;
    BYTE pad0;
    CARD16 pad1;
}
enum sz_xShmAttachReq =	16;

struct xShmDetachReq {
    CARD8 reqType;	/* always ShmReqCode */
    CARD8 shmReqType;	/* always X_ShmDetach */
    CARD16 length;
    ShmSeg shmseg;
}
enum sz_xShmDetachReq =	8;

struct xShmPutImageReq {
    CARD8 reqType;	/* always ShmReqCode */
    CARD8 shmReqType;	/* always X_ShmPutImage */
    CARD16 length;
    Drawable drawable;
    GContext gc;
    CARD16 totalWidth;
    CARD16 totalHeight;
    CARD16 srcX;
    CARD16 srcY;
    CARD16 srcWidth;
    CARD16 srcHeight;
    INT16 dstX;
    INT16 dstY;
    CARD8 depth;
    CARD8 format;
    CARD8 sendEvent;
    CARD8 bpad;
    ShmSeg shmseg;
    CARD32 offset;
}
enum sz_xShmPutImageReq =	40;

struct xShmGetImageReq {
    CARD8 reqType;	/* always ShmReqCode */
    CARD8 shmReqType;	/* always X_ShmGetImage */
    CARD16 length;
    Drawable drawable;
    INT16 x;
    INT16 y;
    CARD16 width;
    CARD16 height;
    CARD32 planeMask;
    CARD8 format;
    CARD8 pad0;
    CARD8 pad1;
    CARD8 pad2;
    ShmSeg shmseg;
    CARD32 offset;
}
enum sz_xShmGetImageReq =	32;

struct xShmGetImageReply {
    BYTE type;  /* X_Reply */
    CARD8 depth;
    CARD16 sequenceNumber;
    CARD32 length;
    VisualID visual;
    CARD32 size;
    CARD32 pad0;
    CARD32 pad1;
    CARD32 pad2;
    CARD32 pad3;
}
enum sz_xShmGetImageReply =	32;

struct xShmCreatePixmapReq {
    CARD8 reqType;	/* always ShmReqCode */
    CARD8 shmReqType;	/* always X_ShmCreatePixmap */
    CARD16 length;
    Pixmap pid;
    Drawable drawable;
    CARD16 width;
    CARD16 height;
    CARD8 depth;
    CARD8 pad0;
    CARD8 pad1;
    CARD8 pad2;
    ShmSeg shmseg;
    CARD32 offset;
}
enum sz_xShmCreatePixmapReq = 28;

struct xShmCompletionEvent {
    BYTE type;		/* always eventBase + ShmCompletion */
    BYTE bpad0;
    CARD16 sequenceNumber;
    Drawable drawable;
    CARD16 minorEvent;
    BYTE majorEvent;
    BYTE bpad1;
    ShmSeg shmseg;
    CARD32 offset;
    CARD32 pad0;
    CARD32 pad1;
    CARD32 pad2;
}
enum sz_xShmCompletionEvent =	32;

/* Version 1.2 additions */
struct xShmAttachFdReq {
    CARD8 reqType;	/* always ShmReqCode */
    CARD8 shmReqType;	/* always X_ShmAttachFd */
    CARD16 length;
    ShmSeg shmseg;
    BOOL readOnly;
    BYTE pad0;
    CARD16 pad1;
}
/* File descriptor is passed with this request */
enum sz_xShmAttachFdReq =	12;

struct xShmCreateSegmentReq {
    CARD8 reqType;	/* always ShmReqCode */
    CARD8 shmReqType;	/* always X_ShmAttachFd */
    CARD16 length;
    ShmSeg shmseg;
    CARD32 size;
    BOOL readOnly;
    BYTE pad0;
    CARD16 pad1;
}
enum sz_xShmCreateSegmentReq = 16;

struct xShmCreateSegmentReply {
    CARD8 type;			/* must be X_Reply */
    CARD8 nfd;			/* must be 1	*/
    CARD16 sequenceNumber;		/* last sequence number */
    CARD32 length;			/* 0 */
    CARD32 pad2;			/* unused */
    CARD32 pad3;			/* unused */
    CARD32 pad4;			/* unused */
    CARD32 pad5;			/* unused */
    CARD32 pad6;			/* unused */
    CARD32 pad7;			/* unused */
}
/* File descriptor is passed with this reply */
enum sz_xShmCreateSegmentReply =	32;

 /* _SHMPROTO_H_ */
