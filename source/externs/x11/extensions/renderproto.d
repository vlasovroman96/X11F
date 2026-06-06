module externs.x11.extensions.renderproto;

public import externs.x11.X;
import deimos.X11.Xutil;
import deimos.X11.extensions.render;
import deimos.X11.extensions.Xrender;

alias Fixed = XFixed ;

struct XRenderTransform {
    Fixed	matrix11;
    Fixed	matrix12;
    Fixed	matrix13;
    Fixed	matrix21;
    Fixed	matrix22;
    Fixed	matrix23;
    Fixed	matrix31;
    Fixed	matrix32;
    Fixed	matrix33;
};
