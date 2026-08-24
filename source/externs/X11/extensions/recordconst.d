module externs.X11.extensions.recordconst;
@nogc nothrow:
extern(C): __gshared:
/***************************************************************************
 * Copyright 1995 Network Computing Devices
 *
 * Permission to use, copy, modify, distribute, and sell this software and
 * its documentation for any purpose is hereby granted without fee, provided
 * that the above copyright notice appear in all copies and that both that
 * copyright notice and this permission notice appear in supporting
 * documentation, and that the name of Network Computing Devices
 * not be used in advertising or publicity pertaining to distribution
 * of the software without specific, written prior permission.
 *
 * NETWORK COMPUTING DEVICES DISCLAIMs ALL WARRANTIES WITH REGARD TO
 * THIS SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS, IN NO EVENT SHALL NETWORK COMPUTING DEVICES BE LIABLE
 * FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN
 * AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING
 * OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 **************************************************************************/

 
enum RECORD_NAME =			"RECORD";
enum RECORD_MAJOR_VERSION =		1;
enum RECORD_MINOR_VERSION =		13;
enum RECORD_LOWEST_MAJOR_VERSION =	1;
enum RECORD_LOWEST_MINOR_VERSION =	12;

enum XRecordBadContext =       0	/* Not a valid RC */;

enum RecordNumErrors =         (XRecordBadContext + 1);
enum RecordNumEvents =		0L;

/*
 * Constants for arguments of various requests
 */
enum	XRecordFromServerTime =		0x01;
enum	XRecordFromClientTime =		0x02;
enum	XRecordFromClientSequence =	0x04;

enum XRecordCurrentClients =		1;
enum XRecordFutureClients =		2;
enum XRecordAllClients =		3;

enum XRecordFromServer =           	0;
enum XRecordFromClient =               1;
enum XRecordClientStarted =           	2;
enum XRecordClientDied =               3;
enum XRecordStartOfData =		4;
enum XRecordEndOfData =		5;


 /* _RECORD_H_ */
