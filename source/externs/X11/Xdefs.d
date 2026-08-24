module externs.X11.Xdefs;
@nogc nothrow:
extern(C): __gshared:
import core.stdc.config: c_long, c_ulong;
/***********************************************************

Copyright (c) 1999  The XFree86 Project Inc.

All Rights Reserved.

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
OPEN GROUP BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Except as contained in this notice, the name of The XFree86 Project
Inc. shall not be used in advertising or otherwise to promote the
sale, use or other dealings in this Software without prior written
authorization from The XFree86 Project Inc..

*/

/**
 ** Types definitions shared between server and clients
 **/

 
version (_XSERVER64) {
public import externs.X11.Xmd;
import std.path;
}

import externs.X11.fonts.fontstruct;

 
version (_XSERVER64) {} else {
alias Atom = c_ulong;
} version (_XSERVER64) {
alias Atom = CARD32;
}


version (Bool) {} else {
 
alias Bool = int;

}

 
alias pointer = void*;






 
version (_XSERVER64) {} else {
alias XID = c_ulong;
} version (_XSERVER64) {
alias XID = CARD32;
}


 
version (_XSERVER64) {} else {
alias Mask = c_ulong;
} version (_XSERVER64) {
alias Mask = CARD32;
}

 
alias FontPtr = _Font*; /* also in fonts/include/font.h */


 
alias Font = XID;


version (_XTYPEDEF_FSID) {} else {
version (_XSERVER64) {} else {
alias FSID = c_ulong;
} version (_XSERVER64) {
alias FSID = CARD32;
}
}

alias AccContext = FSID;

extern struct timeval;

/* OS independent time value
   XXX Should probably go in Xos.h */
alias OSTimePtr = timeval**;


alias BlockHandlerProcPtr = void function(void*, OSTimePtr, void*);


