module externs.X11.fonts.libxfont2;
@nogc nothrow:
extern(C): __gshared:
import core.stdc.config: c_long, c_ulong;
/*
 * Copyright © 2015 Keith Packard
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

 
public import	core.stdc.stddef;
public import	core.stdc.stdarg;
public import	core.stdc.stdint;
public import	externs.X11.Xfuncproto;
public import	externs.X11.fonts.font;
public import	externs.X11.fonts.fontproto;

enum XFONT2_FPE_FUNCS_VERSION =	1;

alias WakeupFpe = int function(FontPathElementPtr fpe);

struct _xfont2_fpe_funcs {
	int version_;
	NameCheckFunc name_check;
	InitFpeFunc init_fpe;
	FreeFpeFunc free_fpe;
	ResetFpeFunc reset_fpe;
	OpenFontFunc open_font;
	CloseFontFunc close_font;
	ListFontsFunc list_fonts;
	StartLfwiFunc start_list_fonts_with_info;
	NextLfwiFunc list_next_font_with_info;
	WakeupFpe wakeup_fpe;
	ClientDiedFunc client_died;
	LoadGlyphsFunc load_glyphs;
	StartLaFunc start_list_fonts_and_aliases;
	NextLaFunc list_next_font_or_alias;
	SetPathFunc set_path_hook;
}alias xfont2_fpe_funcs_rec = _xfont2_fpe_funcs;
alias xfont2_fpe_funcs_ptr = _xfont2_fpe_funcs*;

alias FontBlockHandlerProcPtr = void function(void* timeout);

alias FontFdHandlerProcPtr = void function(int fd, void* data);

enum XFONT2_CLIENT_FUNCS_VERSION =	1;

struct _xfont2_client_funcs {
	int version_;
	int function(ClientPtr client) client_auth_generation;
	Bool function(ClientPtr client) client_signal;
	void function(Font id) delete_font_client_id;
	void function(const(char)* f, va_list ap) verrorf;
	FontPtr function(FSID id) find_old_font;
	FontResolutionPtr function(int* num) get_client_resolutions;
	int function() get_default_point_size;
	Font function() get_new_font_client_id;
	uint function() get_time_in_millis;
	int function(FontPathElementPtr fpe, FontBlockHandlerProcPtr block_handler) init_fs_handlers;
	int function(xfont2_fpe_funcs_rec* funcs) register_fpe_funcs;
	void function(FontPathElementPtr fpe, FontBlockHandlerProcPtr block_handler, Bool all) remove_fs_handlers;
	void* function() get_server_client;
	int function(char** authorizations, int* authlen, void* client) set_font_authorizations;
	int function(FontPtr pfont, Font id) store_font_client_font;
	Atom function(const(char)* string, uint len, int makeit) make_atom;
	int function(Atom atom) valid_atom;
	const(char)* function(Atom atom) name_for_atom;
	c_ulong function() get_server_generation;
	int function(int fd, FontFdHandlerProcPtr handler, void* data) add_fs_fd;
	void function(int fd) remove_fs_fd;
	void function(void* wt, c_ulong newdelay) adjust_fs_wait_for_delay;
}alias xfont2_client_funcs_rec = _xfont2_client_funcs;
alias xfont2_client_funcs_ptr = _xfont2_client_funcs*;

int xfont2_init(const(xfont2_client_funcs_rec)* client_funcs);

void xfont2_query_glyph_extents(FontPtr pFont, CharInfoPtr* charinfo, c_ulong count, ExtentInfoRec* info);

Bool xfont2_query_text_extents(FontPtr pFont, c_ulong count, ubyte* chars, ExtentInfoRec* info);

Bool xfont2_parse_glyph_caching_mode(char* str);

void xfont2_init_glyph_caching();

void xfont2_set_glyph_caching_mode(int newmode);

FontNamesPtr xfont2_make_font_names_record(uint size);

void xfont2_free_font_names(FontNamesPtr pFN);

int xfont2_add_font_names_name(FontNamesPtr names, char* name, int length);

extern struct _xfont2_pattern_cache;

alias xfont2_pattern_cache_ptr = _xfont2_pattern_cache*;

xfont2_pattern_cache_ptr xfont2_make_font_pattern_cache();

void xfont2_free_font_pattern_cache(xfont2_pattern_cache_ptr cache);

void xfont2_empty_font_pattern_cache(xfont2_pattern_cache_ptr cache);

void xfont2_cache_font_pattern(xfont2_pattern_cache_ptr cache, const(char)* pattern, int patlen, FontPtr pFont);

FontPtr xfont2_find_cached_font_pattern(xfont2_pattern_cache_ptr cache, const(char)* pattern, int patlen);

void xfont2_remove_cached_font_pattern(xfont2_pattern_cache_ptr cache, FontPtr pFont);

/* private.c */

int xfont2_allocate_font_private_index();

pragma(inline, true) private void* xfont2_font_get_private(FontPtr pFont, int n)
{
	if (n > pFont.maxPrivate)
		return null;
	return pFont.devPrivates[n];
}

Bool xfont2_font_set_private(FontPtr pFont, int n, void* ptr);

 /* _LIBXFONT2_H_ */
