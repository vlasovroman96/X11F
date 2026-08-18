module externs.xcb.bigreq;
@nogc nothrow:
extern(C): __gshared:
/*
 * This file generated automatically from bigreq.xml by c_client.py.
 * Edit at your peril.
 */

/**
 * @defgroup XCB_BigRequests_API XCB BigRequests API
 * @brief BigRequests XCB Protocol Implementation.
 * @{
 **/

 
public import externs.xcb.xcb;

import externs.xcb.xcbext;

enum XCB_BIGREQUESTS_MAJOR_VERSION = 0;
enum XCB_BIGREQUESTS_MINOR_VERSION = 0;

xcb_extension_t xcb_big_requests_id;

/**
 * @brief xcb_big_requests_enable_cookie_t
 **/
struct xcb_big_requests_enable_cookie_t {
    uint sequence;
}

/** Opcode for xcb_big_requests_enable. */
enum XCB_BIG_REQUESTS_ENABLE = 0;

/**
 * @brief xcb_big_requests_enable_request_t
 **/
struct xcb_big_requests_enable_request_t {
    ubyte major_opcode;
    ubyte minor_opcode;
    ushort length;
}

/**
 * @brief xcb_big_requests_enable_reply_t
 **/
struct xcb_big_requests_enable_reply_t {
    ubyte response_type;
    ubyte pad0;
    ushort sequence;
    uint length;
    uint maximum_request_length;
}

/**
 * @brief Enable the BIG-REQUESTS extension
 *
 * @param c The connection
 * @return A cookie
 *
 * This enables the BIG-REQUESTS extension, which allows for requests larger than
 * 262140 bytes in length.  When enabled, if the 16-bit length field is zero, it
 * is immediately followed by a 32-bit length field specifying the length of the
 * request in 4-byte units.
 *
 */
xcb_big_requests_enable_cookie_t xcb_big_requests_enable(xcb_connection_t* c);

/**
 * @brief Enable the BIG-REQUESTS extension
 *
 * @param c The connection
 * @return A cookie
 *
 * This enables the BIG-REQUESTS extension, which allows for requests larger than
 * 262140 bytes in length.  When enabled, if the 16-bit length field is zero, it
 * is immediately followed by a 32-bit length field specifying the length of the
 * request in 4-byte units.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
 */
xcb_big_requests_enable_cookie_t xcb_big_requests_enable_unchecked(xcb_connection_t* c);

/**
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_big_requests_enable_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
 */
xcb_big_requests_enable_reply_t* xcb_big_requests_enable_reply(xcb_connection_t* c, xcb_big_requests_enable_cookie_t cookie, xcb_generic_error_t** e);





/**
 * @}
 */
