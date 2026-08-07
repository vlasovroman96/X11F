module externs.linux.fbio;

extern(C):

import core.stdc.stdint;
public import core.sys.posix.unistd;
public import core.sys.posix.fcntl;


//
// ioctl encoding
//

enum IOC_NRBITS   = 8;
enum IOC_TYPEBITS = 8;
enum IOC_SIZEBITS = 14;
enum IOC_DIRBITS  = 2;

enum IOC_NRSHIFT   = 0;
enum IOC_TYPESHIFT = IOC_NRSHIFT + IOC_NRBITS;
enum IOC_SIZESHIFT = IOC_TYPESHIFT + IOC_TYPEBITS;
enum IOC_DIRSHIFT  = IOC_SIZESHIFT + IOC_SIZEBITS;

enum IOC_NONE  = 0;
enum IOC_WRITE = 1;
enum IOC_READ  = 2;


private ulong _IOC(ulong dir, ulong type, ulong nr, ulong size)
{
    return (dir << IOC_DIRSHIFT) |
           (type << IOC_TYPESHIFT) |
           (nr << IOC_NRSHIFT) |
           (size << IOC_SIZESHIFT);
}


private ulong _IO(T)(char type, ulong nr)
{
    return _IOC(IOC_NONE,
                cast(ulong) type,
                nr,
                0);
}


private ulong _IOR(T)(char type, ulong nr)
{
    return _IOC(IOC_READ,
                cast(ulong) type,
                nr,
                T.sizeof);
}


private ulong _IOW(T)(char type, ulong nr)
{
    return _IOC(IOC_WRITE,
                cast(ulong) type,
                nr,
                T.sizeof);
}


private ulong _IOWR(T)(char type, ulong nr)
{
    return _IOC(IOC_READ | IOC_WRITE,
                cast(ulong) type,
                nr,
                T.sizeof);
}


//
// Sun framebuffer ABI
//

enum FB_ATTR_NEMUTYPES = 4;

struct fbtype
{
    int fb_type;
    int fb_height;
    int fb_width;
    int fb_depth;
    int fb_cmsize;
    int fb_size;
}


struct fbsattr
{
    int flags;
    int emu_type;
    int dev_specific;
}


struct fbgattr
{
    int real_type;
    int owner;

    fbtype fbtype_;
    fbsattr sattr;

    int[FB_ATTR_NEMUTYPES] emu_types;
}


struct fbcmap
{
    int index;
    int count;

    ubyte* red;
    ubyte* green;
    ubyte* blue;
}


//
// ioctls
//

enum ulong FBIOGTYPE    = _IOR!fbtype('F', 0);
enum ulong FBIOPUTCMAP = _IOW!fbcmap('F', 4);
enum ulong FBIOGETCMAP = _IOWR!fbcmap('F', 3);
enum ulong FBIOGATTR   = _IOR!fbgattr('F', 6);