module externs.xcb.xcb_atom;
@nogc nothrow:
extern(C): __gshared:
 
public import externs.xcb.xcb;


char* xcb_atom_name_by_screen(const(char)* base, ubyte screen);
char* xcb_atom_name_by_resource(const(char)* base, uint resource);
char* xcb_atom_name_unique(const(char)* base, uint id);


 /* __XCB_ATOM_H__ */
