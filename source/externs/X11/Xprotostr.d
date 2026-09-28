module x11.Xprotostr;
 
 /*
 * Copyright 2026, Roman Vlasov
 * Copyright 1987, 1998  The Open Group
 * Copyright 1987 by Digital Equipment Corporation, Maynard, Massachusetts.
 *
 * See COPYING for the full license texts.
 */

public import x11.Xmd;

/* Used by PolySegment */
struct xSegment {
    INT16 x1, y1, x2, y2;
}

/* POINT */
struct xPoint {
    INT16 x, y;
}

/* RECTANGLE */
struct xRectangle {
    INT16 x, y;
    CARD16 width, height;
}

/*  ARC  */
// 2026: ohrealy?
struct xArc {
    INT16 x, y;
    CARD16 width, height;
    INT16 angle1, angle2;
}
