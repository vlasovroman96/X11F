module externs.X11.extensions.secur;
@nogc nothrow:
extern(C): __gshared:
/*
Copyright 1996, 1998  The Open Group

Permission to use, copy, modify, distribute, and sell this software and its
documentation for any purpose is hereby granted without fee, provided that
the above copyright notice appear in all copies and that both that
copyright notice and this permission notice appear in supporting
documentation.

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE OPEN GROUP BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

Except as contained in this notice, the name of The Open Group shall
not be used in advertising or otherwise to promote the sale, use or
other dealings in this Software without prior written authorization
from The Open Group.
*/

 
enum SECURITY_EXTENSION_NAME =		"SECURITY";
enum SECURITY_MAJOR_VERSION =		1;
enum SECURITY_MINOR_VERSION =		0;

enum XSecurityNumberEvents =		1;
enum XSecurityNumberErrors =		2;
enum XSecurityBadAuthorization =	0;
enum XSecurityBadAuthorizationProtocol = 1;

/* trust levels */
enum XSecurityClientTrusted =		0;
enum XSecurityClientUntrusted =	1;

/* authorization attribute masks */
enum XSecurityTimeout =		(1<<0);
enum XSecurityTrustLevel =		(1<<1);
enum XSecurityGroup =  		(1<<2);
enum XSecurityEventMask =		(1<<3);
enum XSecurityAllAuthorizationAttributes = 
 (XSecurityTimeout | XSecurityTrustLevel | XSecurityGroup | XSecurityEventMask);

/* event masks */
enum XSecurityAuthorizationRevokedMask = (1<<0);
enum XSecurityAllEventMasks = XSecurityAuthorizationRevokedMask;

/* event offsets */
enum XSecurityAuthorizationRevoked = 0;

enum XSecurityAuthorizationName =	"XC-QUERY-SECURITY-1";
enum XSecurityAuthorizationNameLen =	19;

 /* _SECUR_H */
