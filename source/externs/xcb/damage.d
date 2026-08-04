module damage.h;
@nogc nothrow:
extern(C): __gshared:
/*
 * This file generated automatically from damage.xml by c_client.py.
 * Edit at your peril.
 */

/**
 * @defgroup XCB_Damage_API XCB Damage API
 * @brief Damage XCB Protocol Implementation.
 * @{
 **/

 
public import externs.xcb.xcb;
public import externs.xcb.xproto;
public import externs.xcb.xfixes;
import externs.xcb.xcbext;



enum XCB_DAMAGE_MAJOR_VERSION = 1;
enum XCB_DAMAGE_MINOR_VERSION = 1;

extern xcb_extension_t xcb_damage_id;

alias xcb_damage_damage_t = uint;

/**
 * @brief xcb_damage_damage_iterator_t
 **/
struct xcb_damage_damage_iterator_t {
    xcb_damage_damage_t* data;
    int rem;
    int index;
}

enum xcb_damage_report_level_t {
    XCB_DAMAGE_REPORT_LEVEL_RAW_RECTANGLES = 0,
    XCB_DAMAGE_REPORT_LEVEL_DELTA_RECTANGLES = 1,
    XCB_DAMAGE_REPORT_LEVEL_BOUNDING_BOX = 2,
    XCB_DAMAGE_REPORT_LEVEL_NON_EMPTY = 3
}
alias XCB_DAMAGE_REPORT_LEVEL_RAW_RECTANGLES = xcb_damage_report_level_t.XCB_DAMAGE_REPORT_LEVEL_RAW_RECTANGLES;
alias XCB_DAMAGE_REPORT_LEVEL_DELTA_RECTANGLES = xcb_damage_report_level_t.XCB_DAMAGE_REPORT_LEVEL_DELTA_RECTANGLES;
alias XCB_DAMAGE_REPORT_LEVEL_BOUNDING_BOX = xcb_damage_report_level_t.XCB_DAMAGE_REPORT_LEVEL_BOUNDING_BOX;
alias XCB_DAMAGE_REPORT_LEVEL_NON_EMPTY = xcb_damage_report_level_t.XCB_DAMAGE_REPORT_LEVEL_NON_EMPTY;


/** Opcode for xcb_damage_bad_damage. */
enum XCB_DAMAGE_BAD_DAMAGE = 0;

/**
 * @brief xcb_damage_bad_damage_error_t
 **/
struct xcb_damage_bad_damage_error_t {
    ubyte response_type;
    ubyte error_code;
    ushort sequence;
    uint bad_value;
    ushort minor_opcode;
    ubyte major_opcode;
}

/**
 * @brief xcb_damage_query_version_cookie_t
 **/
struct xcb_damage_query_version_cookie_t {
    uint sequence;
}

/** Opcode for xcb_damage_query_version. */
enum XCB_DAMAGE_QUERY_VERSION = 0;

/**
 * @brief xcb_damage_query_version_request_t
 **/
struct xcb_damage_query_version_request_t {
    ubyte major_opcode;
    ubyte minor_opcode;
    ushort length;
    uint client_major_version;
    uint client_minor_version;
}

/**
 * @brief xcb_damage_query_version_reply_t
 **/
struct xcb_damage_query_version_reply_t {
    ubyte response_type;
    ubyte pad0;
    ushort sequence;
    uint length;
    uint major_version;
    uint minor_version;
    ubyte[16] pad1;
}

/** Opcode for xcb_damage_create. */
enum XCB_DAMAGE_CREATE = 1;

/**
 * @brief xcb_damage_create_request_t
 **/
struct xcb_damage_create_request_t {
    ubyte major_opcode;
    ubyte minor_opcode;
    ushort length;
    xcb_damage_damage_t damage;
    xcb_drawable_t drawable;
    ubyte level;
    ubyte[3] pad0;
}

/** Opcode for xcb_damage_destroy. */
enum XCB_DAMAGE_DESTROY = 2;

/**
 * @brief xcb_damage_destroy_request_t
 **/
struct xcb_damage_destroy_request_t {
    ubyte major_opcode;
    ubyte minor_opcode;
    ushort length;
    xcb_damage_damage_t damage;
}

/** Opcode for xcb_damage_subtract. */
enum XCB_DAMAGE_SUBTRACT = 3;

/**
 * @brief xcb_damage_subtract_request_t
 **/
struct xcb_damage_subtract_request_t {
    ubyte major_opcode;
    ubyte minor_opcode;
    ushort length;
    xcb_damage_damage_t damage;
    xcb_xfixes_region_t repair;
    xcb_xfixes_region_t parts;
}

/** Opcode for xcb_damage_add. */
enum XCB_DAMAGE_ADD = 4;

/**
 * @brief xcb_damage_add_request_t
 **/
struct xcb_damage_add_request_t {
    ubyte major_opcode;
    ubyte minor_opcode;
    ushort length;
    xcb_drawable_t drawable;
    xcb_xfixes_region_t region;
}

/** Opcode for xcb_damage_notify. */
enum XCB_DAMAGE_NOTIFY = 0;

/**
 * @brief xcb_damage_notify_event_t
 **/
struct xcb_damage_notify_event_t {
    ubyte response_type;
    ubyte level;
    ushort sequence;
    xcb_drawable_t drawable;
    xcb_damage_damage_t damage;
    xcb_timestamp_t timestamp;
    xcb_rectangle_t area;
    xcb_rectangle_t geometry;
}

/**
 * Get the next element of the iterator
 * @param i Pointer to a xcb_damage_damage_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_damage_damage_t)
 */
void xcb_damage_damage_next(xcb_damage_damage_iterator_t* i);

/**
 * Return the iterator pointing to the last element
 * @param i An xcb_damage_damage_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
 */
xcb_generic_iterator_t xcb_damage_damage_end(xcb_damage_damage_iterator_t i);

/**
 * @brief Negotiate the version of the DAMAGE extension
 *
 * @param c The connection
 * @param client_major_version The major version supported by the client.
 * @param client_minor_version The minor version supported by the client.
 * @return A cookie
 *
 * This negotiates the version of the DAMAGE extension.  It must precede any other
 * request using the DAMAGE extension.  Failure to do so will cause a BadRequest
 * error for those requests.
 *
 */
xcb_damage_query_version_cookie_t xcb_damage_query_version(xcb_connection_t* c, uint client_major_version, uint client_minor_version);

/**
 * @brief Negotiate the version of the DAMAGE extension
 *
 * @param c The connection
 * @param client_major_version The major version supported by the client.
 * @param client_minor_version The minor version supported by the client.
 * @return A cookie
 *
 * This negotiates the version of the DAMAGE extension.  It must precede any other
 * request using the DAMAGE extension.  Failure to do so will cause a BadRequest
 * error for those requests.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
 */
xcb_damage_query_version_cookie_t xcb_damage_query_version_unchecked(xcb_connection_t* c, uint client_major_version, uint client_minor_version);

/**
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_damage_query_version_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
 */
xcb_damage_query_version_reply_t* xcb_damage_query_version_reply(xcb_connection_t* c, xcb_damage_query_version_cookie_t cookie, xcb_generic_error_t** e);

/**
 * @brief Creates a Damage object to monitor changes to a drawable.
 *
 * @param c The connection
 * @param damage The ID with which you will refer to the new Damage object, created by
 * `xcb_generate_id`.
 * @param drawable The ID of the drawable to be monitored.
 * @param level A bitmask of #xcb_damage_report_level_t values.
 * @param level The level of detail to be provided in Damage events.
 * @return A cookie
 *
 * This creates a Damage object to monitor changes to a drawable, and specifies
 * the level of detail to be reported for changes.
 * 
 * We call changes made to pixel contents of windows and pixmaps 'damage'
 * throughout this extension.
 * 
 * Damage accumulates as drawing occurs in the drawable.  Each drawing operation
 * 'damages' one or more rectangular areas within the drawable.  The rectangles
 * are guaranteed to include the set of pixels modified by each operation, but
 * may include significantly more than just those pixels.  The desire is for
 * the damage to strike a balance between the number of rectangles reported and
 * the extraneous area included.  A reasonable goal is for each primitive
 * object drawn (line, string, rectangle) to be represented as a single
 * rectangle and for the damage area of the operation to be the union of these
 * rectangles.
 * 
 * The DAMAGE extension allows applications to either receive the raw
 * rectangles as a stream of events, or to have them partially processed within
 * the X server to reduce the amount of data transmitted as well as reduce the
 * processing latency once the repaint operation has started.
 * 
 * The Damage object holds any accumulated damage region and reflects the
 * relationship between the drawable selected for damage notification and the
 * drawable for which damage is tracked.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
 */
xcb_void_cookie_t xcb_damage_create_checked(xcb_connection_t* c, xcb_damage_damage_t damage, xcb_drawable_t drawable, ubyte level);

/**
 * @brief Creates a Damage object to monitor changes to a drawable.
 *
 * @param c The connection
 * @param damage The ID with which you will refer to the new Damage object, created by
 * `xcb_generate_id`.
 * @param drawable The ID of the drawable to be monitored.
 * @param level A bitmask of #xcb_damage_report_level_t values.
 * @param level The level of detail to be provided in Damage events.
 * @return A cookie
 *
 * This creates a Damage object to monitor changes to a drawable, and specifies
 * the level of detail to be reported for changes.
 * 
 * We call changes made to pixel contents of windows and pixmaps 'damage'
 * throughout this extension.
 * 
 * Damage accumulates as drawing occurs in the drawable.  Each drawing operation
 * 'damages' one or more rectangular areas within the drawable.  The rectangles
 * are guaranteed to include the set of pixels modified by each operation, but
 * may include significantly more than just those pixels.  The desire is for
 * the damage to strike a balance between the number of rectangles reported and
 * the extraneous area included.  A reasonable goal is for each primitive
 * object drawn (line, string, rectangle) to be represented as a single
 * rectangle and for the damage area of the operation to be the union of these
 * rectangles.
 * 
 * The DAMAGE extension allows applications to either receive the raw
 * rectangles as a stream of events, or to have them partially processed within
 * the X server to reduce the amount of data transmitted as well as reduce the
 * processing latency once the repaint operation has started.
 * 
 * The Damage object holds any accumulated damage region and reflects the
 * relationship between the drawable selected for damage notification and the
 * drawable for which damage is tracked.
 *
 */
xcb_void_cookie_t xcb_damage_create(xcb_connection_t* c, xcb_damage_damage_t damage, xcb_drawable_t drawable, ubyte level);

/**
 * @brief Destroys a previously created Damage object.
 *
 * @param c The connection
 * @param damage The ID you provided to `xcb_create_damage`.
 * @return A cookie
 *
 * This destroys a Damage object and requests the X server stop reporting
 * the changes it was tracking.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
 */
xcb_void_cookie_t xcb_damage_destroy_checked(xcb_connection_t* c, xcb_damage_damage_t damage);

/**
 * @brief Destroys a previously created Damage object.
 *
 * @param c The connection
 * @param damage The ID you provided to `xcb_create_damage`.
 * @return A cookie
 *
 * This destroys a Damage object and requests the X server stop reporting
 * the changes it was tracking.
 *
 */
xcb_void_cookie_t xcb_damage_destroy(xcb_connection_t* c, xcb_damage_damage_t damage);

/**
 * @brief Remove regions from a previously created Damage object.
 *
 * @param c The connection
 * @param damage The ID you provided to `xcb_create_damage`.
 * @return A cookie
 *
 * This updates the regions of damage recorded in a a Damage object.
 * See https://www.x.org/releases/current/doc/damageproto/damageproto.txt
 * for details.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
 */
xcb_void_cookie_t xcb_damage_subtract_checked(xcb_connection_t* c, xcb_damage_damage_t damage, xcb_xfixes_region_t repair, xcb_xfixes_region_t parts);

/**
 * @brief Remove regions from a previously created Damage object.
 *
 * @param c The connection
 * @param damage The ID you provided to `xcb_create_damage`.
 * @return A cookie
 *
 * This updates the regions of damage recorded in a a Damage object.
 * See https://www.x.org/releases/current/doc/damageproto/damageproto.txt
 * for details.
 *
 */
xcb_void_cookie_t xcb_damage_subtract(xcb_connection_t* c, xcb_damage_damage_t damage, xcb_xfixes_region_t repair, xcb_xfixes_region_t parts);

/**
 * @brief Add a region to a previously created Damage object.
 *
 * @param c The connection
 * @return A cookie
 *
 * This updates the regions of damage recorded in a a Damage object.
 * See https://www.x.org/releases/current/doc/damageproto/damageproto.txt
 * for details.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
 */
xcb_void_cookie_t xcb_damage_add_checked(xcb_connection_t* c, xcb_drawable_t drawable, xcb_xfixes_region_t region);

/**
 * @brief Add a region to a previously created Damage object.
 *
 * @param c The connection
 * @return A cookie
 *
 * This updates the regions of damage recorded in a a Damage object.
 * See https://www.x.org/releases/current/doc/damageproto/damageproto.txt
 * for details.
 *
 */
xcb_void_cookie_t xcb_damage_add(xcb_connection_t* c, xcb_drawable_t drawable, xcb_xfixes_region_t region);





/**
 * @}
 */
