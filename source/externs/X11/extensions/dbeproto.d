module externs.X11.extensions.dbeproto;
@nogc nothrow:
extern(C): __gshared:
/******************************************************************************
 *
 * Copyright (c) 1994, 1995  Hewlett-Packard Company
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 *
 * The above copyright notice and this permission notice shall be included
 * in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
 * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 * IN NO EVENT SHALL HEWLETT-PACKARD COMPANY BE LIABLE FOR ANY CLAIM,
 * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
 * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR
 * THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 * Except as contained in this notice, the name of the Hewlett-Packard
 * Company shall not be used in advertising or otherwise to promote the
 * sale, use or other dealings in this Software without prior written
 * authorization from the Hewlett-Packard Company.
 *
 *     Header file for Xlib-related DBE
 *
 *****************************************************************************/

 
public import externs.X11.extensions.dbe;
public import externs.X11.Xdefs;
public import externs.X11.Xmd;

/* Request values used in (S)ProcDbeDispatch() */
enum X_DbeGetVersion =                 0;
enum X_DbeAllocateBackBufferName =     1;
enum X_DbeDeallocateBackBufferName =   2;
enum X_DbeSwapBuffers =                3;
enum X_DbeBeginIdiom =                 4;
enum X_DbeEndIdiom =                   5;
enum X_DbeGetVisualInfo =              6;
enum X_DbeGetBackBufferAttributes =    7;

alias xDbeSwapAction = CARD8;
alias xDbeBackBuffer = CARD32;

/* TYPEDEFS */

/* Protocol data types */

struct xDbeSwapInfo {
    CARD32 window;		/* window      */
    xDbeSwapAction swapAction;	/* swap action */
    CARD8 pad1;		/* unused      */
    CARD16 pad2;

}

struct xDbeVisInfo {
    CARD32 visualID;	/* associated visual      */
    CARD8 depth;		/* depth of visual        */
    CARD8 perfLevel;	/* performance level hint */
    CARD16 pad1;

}
enum sz_xDbeVisInfo =	8;

struct xDbeScreenVisInfo {
    CARD32 n;	/* number of visual info items in list  */

}	/* followed by n xDbeVisInfo items */

struct xDbeBufferAttributes {
    CARD32 window;		/* window */

}


/* Requests and replies */

struct xDbeGetVersionReq {
    CARD8 reqType;	/* major-opcode: always codes->major_opcode */
    CARD8 dbeReqType;	/* minor-opcode: always X_DbeGetVersion (0) */
    CARD16 length;		/* request length: (2)                      */
    CARD8 majorVersion;	/* client-major-version                     */
    CARD8 minorVersion;	/* client-minor-version                     */
    CARD16 unused;		/* unused                                   */

}
enum sz_xDbeGetVersionReq =	8;

struct xDbeGetVersionReply {
    BYTE type;			/* Reply: X_Reply (1)   */
    CARD8 unused;			/* unused               */
    CARD16 sequenceNumber;		/* sequence number      */
    CARD32 length;			/* reply length: (0)    */
    CARD8 majorVersion;		/* server-major-version */
    CARD8 minorVersion;		/* server-minor-version */
    CARD16 pad1;			/* unused               */
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;
    CARD32 pad6;

}
enum sz_xDbeGetVersionReply =	32;

struct xDbeAllocateBackBufferNameReq {
    CARD8 reqType;	/* major-opcode: codes->major_opcode */
    CARD8 dbeReqType;	/* X_DbeAllocateBackBufferName (1)   */
    CARD16 length;		/* request length: (4)               */
    CARD32 window;		/* window                            */
    xDbeBackBuffer buffer;		/* back buffer name                  */
    xDbeSwapAction swapAction;	/* swap action hint                  */
    CARD8 pad1;		/* unused                            */
    CARD16 pad2;

}
enum sz_xDbeAllocateBackBufferNameReq =	16;

struct xDbeDeallocateBackBufferNameReq {
    CARD8 reqType;	/* major-opcode: codes->major_opcode */
    CARD8 dbeReqType;	/* X_DbeDeallocateBackBufferName (2) */
    CARD16 length;		/* request length: (2)               */
    xDbeBackBuffer buffer;		/* back buffer name                  */

}
enum sz_xDbeDeallocateBackBufferNameReq =	8;

struct xDbeSwapBuffersReq {
    CARD8 reqType;	/* major-opcode: always codes->major_opcode  */
    CARD8 dbeReqType;	/* minor-opcode: always X_DbeSwapBuffers (3) */
    CARD16 length;		/* request length: (2+2n)                    */
    CARD32 n;		/* n, number of window/swap action pairs     */

}		/* followed by n window/swap action pairs    */
enum sz_xDbeSwapBuffersReq =	8;

struct xDbeBeginIdiomReq {
    CARD8 reqType;	/* major-opcode: always codes->major_opcode */
    CARD8 dbeReqType;	/* minor-opcode: always X_DbeBeginIdom (4)  */
    CARD16 length;		/* request length: (1)                      */

}
enum sz_xDbeBeginIdiomReq =	4;

struct xDbeEndIdiomReq {
    CARD8 reqType;	/* major-opcode: always codes->major_opcode */
    CARD8 dbeReqType;	/* minor-opcode: always X_DbeEndIdom (5)    */
    CARD16 length;		/* request length: (1)                      */

}
enum sz_xDbeEndIdiomReq =	4;

struct xDbeGetVisualInfoReq {
    CARD8 reqType;	/* always codes->major_opcode     */
    CARD8 dbeReqType;	/* always X_DbeGetVisualInfo (6)  */
    CARD16 length;		/* request length: (2+n)          */
    CARD32 n;		/* n, number of drawables in list */

}		/* followed by n drawables        */
enum sz_xDbeGetVisualInfoReq =	8;

struct xDbeGetVisualInfoReply {
    BYTE type;			/* Reply: X_Reply (1)                */
    CARD8 unused;			/* unused                            */
    CARD16 sequenceNumber;		/* sequence number                   */
    CARD32 length;			/* reply length                      */
    CARD32 m;			/* m, number of visual infos in list */
    CARD32 pad1;			/* unused                            */
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;

}		/* followed by m visual infos        */
enum sz_xDbeGetVisualInfoReply =	32;

struct xDbeGetBackBufferAttributesReq {
    CARD8 reqType;	/* always codes->major_opcode       */
    CARD8 dbeReqType;	/* X_DbeGetBackBufferAttributes (7) */
    CARD16 length;		/* request length: (2)              */
    xDbeBackBuffer buffer;		/* back buffer name                 */

}
enum sz_xDbeGetBackBufferAttributesReq =	8;

struct xDbeGetBackBufferAttributesReply {
    BYTE type;			/* Reply: X_Reply (1) */
    CARD8 unused;			/* unused             */
    CARD16 sequenceNumber;		/* sequence number    */
    CARD32 length;			/* reply length: (0)  */
    CARD32 attributes;		/* attributes         */
    CARD32 pad1;			/* unused             */
    CARD32 pad2;
    CARD32 pad3;
    CARD32 pad4;
    CARD32 pad5;

}
enum sz_xDbeGetBackBufferAttributesReply =	32;

 /* DBE_PROTO_H */

