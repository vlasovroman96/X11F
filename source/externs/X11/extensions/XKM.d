module externs.X11.extensions.XKM;
@nogc nothrow:
extern(C): __gshared:
/************************************************************
 Copyright (c) 1994 by Silicon Graphics Computer Systems, Inc.

 Permission to use, copy, modify, and distribute this
 software and its documentation for any purpose and without
 fee is hereby granted, provided that the above copyright
 notice appear in all copies and that both that copyright
 notice and this permission notice appear in supporting
 documentation, and that the name of Silicon Graphics not be
 used in advertising or publicity pertaining to distribution
 of the software without specific prior written permission.
 Silicon Graphics makes no representation about the suitability
 of this software for any purpose. It is provided "as is"
 without any express or implied warranty.

 SILICON GRAPHICS DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS
 SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
 AND FITNESS FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL SILICON
 GRAPHICS BE LIABLE FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL
 DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
 DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE
 OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION  WITH
 THE USE OR PERFORMANCE OF THIS SOFTWARE.

 ********************************************************/
version (XKM_H) {} else {
enum	XKM_H = 1;

enum	XkmFileVersion =		15;

enum	XkmIllegalFile =		-1;
enum	XkmSemanticsFile =	20;
enum	XkmLayoutFile =		21;
enum	XkmKeymapFile =		22;
enum	XkmGeometryFile =		23;

enum	XkmTypesIndex =		0;
enum	XkmCompatMapIndex =	1;
enum	XkmSymbolsIndex =		2;
enum	XkmIndicatorsIndex =	3;
enum	XkmKeyNamesIndex =	4;
enum	XkmGeometryIndex =	5;
enum	XkmVirtualModsIndex =	6;
enum	XkmLastIndex =		XkmVirtualModsIndex;

enum	XkmTypesMask =		(1<<0);
enum	XkmCompatMapMask =	(1<<1);
enum	XkmSymbolsMask =		(1<<2);
enum	XkmIndicatorsMask =	(1<<3);
enum	XkmKeyNamesMask =		(1<<4);
enum	XkmGeometryMask =		(1<<5);
enum	XkmVirtualModsMask =	(1<<6);
enum	XkmLegalIndexMask =	(0x7f);
enum	XkmAllIndicesMask =	(0x7f);

enum	XkmSemanticsRequired =	(XkmCompatMapMask);
enum	XkmSemanticsOptional =	(XkmTypesMask|XkmVirtualModsMask|XkmIndicatorsMask);
enum	XkmSemanticsLegal =	(XkmSemanticsRequired|XkmSemanticsOptional);
enum	XkmLayoutRequired =	(XkmKeyNamesMask|XkmSymbolsMask|XkmTypesMask);
enum	XkmLayoutOptional =	(XkmVirtualModsMask|XkmGeometryMask);
enum	XkmLayoutLegal =		(XkmLayoutRequired|XkmLayoutOptional);
enum	XkmKeymapRequired =	(XkmSemanticsRequired|XkmLayoutRequired);
enum	XkmKeymapOptional =	((XkmSemanticsOptional|XkmLayoutOptional)&(~XkmKeymapRequired));
enum	XkmKeymapLegal =		(XkmKeymapRequired|XkmKeymapOptional);

enum string	XkmLegalSection(string m) = `(((` ~ m ~ `)&(~XkmKeymapLegal))==0)`;
enum string	XkmSingleSection(string m) = `(` ~ XkmLegalSection!(m) ~ `&&(((` ~ m ~ `)&(~(` ~ m ~ `)+1))==(` ~ m ~ `)))`;

} /* XKM_H */
