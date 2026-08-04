module externs.xcb.dri3;
@nogc nothrow:
extern(C): __gshared:
/*
 * This file generated automatically from dri3.xml by c_client.py.
 * Edit at your peril.
 */

/**
 * @defgroup XCB_DRI3_API XCB DRI3 API
 * @brief DRI3 XCB Protocol Implementation.
 * @{
 **/

 
public import externs.xcb.xcb;
public import externs.xcb.xproto;
import externs.xcb.xcbext;


enum XCB_DRI3_MAJOR_VERSION = 1;
enum XCB_DRI3_MINOR_VERSION = 4;

extern xcb_extension_t xcb_dri3_id;

alias xcb_dri3_syncobj_t = uint;

/**
 * @brief xcb_dri3_syncobj_iterator_t
 **/
struct xcb_dri3_syncobj_iterator_t {
    xcb_dri3_syncobj_t* data;
    int rem;
    int index;
}

/**
 * @brief xcb_dri3_query_version_cookie_t
 **/
struct xcb_dri3_query_version_cookie_t {
    uint sequence;
}

/** Opcode for xcb_dri3_query_version. */
enum XCB_DRI3_QUERY_VERSION = 0;

/**
 * @brief xcb_dri3_query_version_request_t
 **/
struct xcb_dri3_query_version_request_t {
    ubyte major_opcode;
    ubyte minor_opcode;
    ushort length;
    uint major_version;
    uint minor_version;
}

/**
 * @brief xcb_dri3_query_version_reply_t
 **/
struct xcb_dri3_query_version_reply_t {
    ubyte response_type;
    ubyte pad0;
    ushort sequence;
    uint length;
    uint major_version;
    uint minor_version;
}

/**
 * @brief xcb_dri3_open_cookie_t
 **/
struct xcb_dri3_open_cookie_t {
    uint sequence;
}

/** Opcode for xcb_dri3_open. */
enum XCB_DRI3_OPEN = 1;

/**
 * @brief xcb_dri3_open_request_t
 **/
struct xcb_dri3_open_request_t {
    ubyte major_opcode;
    ubyte minor_opcode;
    ushort length;
    xcb_drawable_t drawable;
    uint provider;
}

/**
 * @brief xcb_dri3_open_reply_t
 **/
struct xcb_dri3_open_reply_t {
    ubyte response_type;
    ubyte nfd;
    ushort sequence;
    uint length;
    ubyte[24] pad0;
}

/** Opcode for xcb_dri3_pixmap_from_buffer. */
enum XCB_DRI3_PIXMAP_FROM_BUFFER = 2;

/**
 * @brief xcb_dri3_pixmap_from_buffer_request_t
 **/
struct xcb_dri3_pixmap_from_buffer_request_t {
    ubyte major_opcode;
    ubyte minor_opcode;
    ushort length;
    xcb_pixmap_t pixmap;
    xcb_drawable_t drawable;
    uint size;
    ushort width;
    ushort height;
    ushort stride;
    ubyte depth;
    ubyte bpp;
}

/**
 * @brief xcb_dri3_buffer_from_pixmap_cookie_t
 **/
struct xcb_dri3_buffer_from_pixmap_cookie_t {
    uint sequence;
}

/** Opcode for xcb_dri3_buffer_from_pixmap. */
enum XCB_DRI3_BUFFER_FROM_PIXMAP = 3;

/**
 * @brief xcb_dri3_buffer_from_pixmap_request_t
 **/
struct xcb_dri3_buffer_from_pixmap_request_t {
    ubyte major_opcode;
    ubyte minor_opcode;
    ushort length;
    xcb_pixmap_t pixmap;
}

/**
 * @brief xcb_dri3_buffer_from_pixmap_reply_t
 **/
struct xcb_dri3_buffer_from_pixmap_reply_t {
    ubyte response_type;
    ubyte nfd;
    ushort sequence;
    uint length;
    uint size;
    ushort width;
    ushort height;
    ushort stride;
    ubyte depth;
    ubyte bpp;
    ubyte[12] pad0;
}

/** Opcode for xcb_dri3_fence_from_fd. */
enum XCB_DRI3_FENCE_FROM_FD = 4;

/**
 * @brief xcb_dri3_fence_from_fd_request_t
 **/
struct xcb_dri3_fence_from_fd_request_t {
    ubyte major_opcode;
    ubyte minor_opcode;
    ushort length;
    xcb_drawable_t drawable;
    uint fence;
    ubyte initially_triggered;
    ubyte[3] pad0;
}

/**
 * @brief xcb_dri3_fd_from_fence_cookie_t
 **/
struct xcb_dri3_fd_from_fence_cookie_t {
    uint sequence;
}

/** Opcode for xcb_dri3_fd_from_fence. */
enum XCB_DRI3_FD_FROM_FENCE = 5;

/**
 * @brief xcb_dri3_fd_from_fence_request_t
 **/
struct xcb_dri3_fd_from_fence_request_t {
    ubyte major_opcode;
    ubyte minor_opcode;
    ushort length;
    xcb_drawable_t drawable;
    uint fence;
}

/**
 * @brief xcb_dri3_fd_from_fence_reply_t
 **/
struct xcb_dri3_fd_from_fence_reply_t {
    ubyte response_type;
    ubyte nfd;
    ushort sequence;
    uint length;
    ubyte[24] pad0;
}

/**
 * @brief xcb_dri3_get_supported_modifiers_cookie_t
 **/
struct xcb_dri3_get_supported_modifiers_cookie_t {
    uint sequence;
}

/** Opcode for xcb_dri3_get_supported_modifiers. */
enum XCB_DRI3_GET_SUPPORTED_MODIFIERS = 6;

/**
 * @brief xcb_dri3_get_supported_modifiers_request_t
 **/
struct xcb_dri3_get_supported_modifiers_request_t {
    ubyte major_opcode;
    ubyte minor_opcode;
    ushort length;
    uint window;
    ubyte depth;
    ubyte bpp;
    ubyte[2] pad0;
}

/**
 * @brief xcb_dri3_get_supported_modifiers_reply_t
 **/
struct xcb_dri3_get_supported_modifiers_reply_t {
    ubyte response_type;
    ubyte pad0;
    ushort sequence;
    uint length;
    uint num_window_modifiers;
    uint num_screen_modifiers;
    ubyte[16] pad1;
}

/** Opcode for xcb_dri3_pixmap_from_buffers. */
enum XCB_DRI3_PIXMAP_FROM_BUFFERS = 7;

/**
 * @brief xcb_dri3_pixmap_from_buffers_request_t
 **/
struct xcb_dri3_pixmap_from_buffers_request_t {
    ubyte major_opcode;
    ubyte minor_opcode;
    ushort length;
    xcb_pixmap_t pixmap;
    xcb_window_t window;
    ubyte num_buffers;
    ubyte[3] pad0;
    ushort width;
    ushort height;
    uint stride0;
    uint offset0;
    uint stride1;
    uint offset1;
    uint stride2;
    uint offset2;
    uint stride3;
    uint offset3;
    ubyte depth;
    ubyte bpp;
    ubyte[2] pad1;
    ulong modifier;
}

/**
 * @brief xcb_dri3_buffers_from_pixmap_cookie_t
 **/
struct xcb_dri3_buffers_from_pixmap_cookie_t {
    uint sequence;
}

/** Opcode for xcb_dri3_buffers_from_pixmap. */
enum XCB_DRI3_BUFFERS_FROM_PIXMAP = 8;

/**
 * @brief xcb_dri3_buffers_from_pixmap_request_t
 **/
struct xcb_dri3_buffers_from_pixmap_request_t {
    ubyte major_opcode;
    ubyte minor_opcode;
    ushort length;
    xcb_pixmap_t pixmap;
}

/**
 * @brief xcb_dri3_buffers_from_pixmap_reply_t
 **/
struct xcb_dri3_buffers_from_pixmap_reply_t {
    ubyte response_type;
    ubyte nfd;
    ushort sequence;
    uint length;
    ushort width;
    ushort height;
    ubyte[4] pad0;
    ulong modifier;
    ubyte depth;
    ubyte bpp;
    ubyte[6] pad1;
}

/** Opcode for xcb_dri3_set_drm_device_in_use. */
enum XCB_DRI3_SET_DRM_DEVICE_IN_USE = 9;

/**
 * @brief xcb_dri3_set_drm_device_in_use_request_t
 **/
struct xcb_dri3_set_drm_device_in_use_request_t {
    ubyte major_opcode;
    ubyte minor_opcode;
    ushort length;
    xcb_window_t window;
    uint drmMajor;
    uint drmMinor;
}

/** Opcode for xcb_dri3_import_syncobj. */
enum XCB_DRI3_IMPORT_SYNCOBJ = 10;

/**
 * @brief xcb_dri3_import_syncobj_request_t
 **/
struct xcb_dri3_import_syncobj_request_t {
    ubyte major_opcode;
    ubyte minor_opcode;
    ushort length;
    xcb_dri3_syncobj_t syncobj;
    xcb_drawable_t drawable;
}

/** Opcode for xcb_dri3_free_syncobj. */
enum XCB_DRI3_FREE_SYNCOBJ = 11;

/**
 * @brief xcb_dri3_free_syncobj_request_t
 **/
struct xcb_dri3_free_syncobj_request_t {
    ubyte major_opcode;
    ubyte minor_opcode;
    ushort length;
    xcb_dri3_syncobj_t syncobj;
}

/**
 * Get the next element of the iterator
 * @param i Pointer to a xcb_dri3_syncobj_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_dri3_syncobj_t)
 */
void xcb_dri3_syncobj_next(xcb_dri3_syncobj_iterator_t* i);

/**
 * Return the iterator pointing to the last element
 * @param i An xcb_dri3_syncobj_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
 */
xcb_generic_iterator_t xcb_dri3_syncobj_end(xcb_dri3_syncobj_iterator_t i);

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 */
xcb_dri3_query_version_cookie_t xcb_dri3_query_version(xcb_connection_t* c, uint major_version, uint minor_version);

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
 */
xcb_dri3_query_version_cookie_t xcb_dri3_query_version_unchecked(xcb_connection_t* c, uint major_version, uint minor_version);

/**
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_dri3_query_version_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
 */
xcb_dri3_query_version_reply_t* xcb_dri3_query_version_reply(xcb_connection_t* c, xcb_dri3_query_version_cookie_t cookie, xcb_generic_error_t** e);

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 */
xcb_dri3_open_cookie_t xcb_dri3_open(xcb_connection_t* c, xcb_drawable_t drawable, uint provider);

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
 */
xcb_dri3_open_cookie_t xcb_dri3_open_unchecked(xcb_connection_t* c, xcb_drawable_t drawable, uint provider);

/**
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_dri3_open_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
 */
xcb_dri3_open_reply_t* xcb_dri3_open_reply(xcb_connection_t* c, xcb_dri3_open_cookie_t cookie, xcb_generic_error_t** e);

/**
 * Return the reply fds
 * @param c      The connection
 * @param reply  The reply
 *
 * Returns a pointer to the array of reply fds of the reply.
 *
 * The returned value points into the reply and must not be free().
 * The fds are not managed by xcb. You must close() them before freeing the reply.
 */
int* xcb_dri3_open_reply_fds(xcb_connection_t* c, xcb_dri3_open_reply_t* reply);

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
 */
xcb_void_cookie_t xcb_dri3_pixmap_from_buffer_checked(xcb_connection_t* c, xcb_pixmap_t pixmap, xcb_drawable_t drawable, uint size, ushort width, ushort height, ushort stride, ubyte depth, ubyte bpp, int pixmap_fd);

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 */
xcb_void_cookie_t xcb_dri3_pixmap_from_buffer(xcb_connection_t* c, xcb_pixmap_t pixmap, xcb_drawable_t drawable, uint size, ushort width, ushort height, ushort stride, ubyte depth, ubyte bpp, int pixmap_fd);

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 */
xcb_dri3_buffer_from_pixmap_cookie_t xcb_dri3_buffer_from_pixmap(xcb_connection_t* c, xcb_pixmap_t pixmap);

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
 */
xcb_dri3_buffer_from_pixmap_cookie_t xcb_dri3_buffer_from_pixmap_unchecked(xcb_connection_t* c, xcb_pixmap_t pixmap);

/**
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_dri3_buffer_from_pixmap_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
 */
xcb_dri3_buffer_from_pixmap_reply_t* xcb_dri3_buffer_from_pixmap_reply(xcb_connection_t* c, xcb_dri3_buffer_from_pixmap_cookie_t cookie, xcb_generic_error_t** e);

/**
 * Return the reply fds
 * @param c      The connection
 * @param reply  The reply
 *
 * Returns a pointer to the array of reply fds of the reply.
 *
 * The returned value points into the reply and must not be free().
 * The fds are not managed by xcb. You must close() them before freeing the reply.
 */
int* xcb_dri3_buffer_from_pixmap_reply_fds(xcb_connection_t* c, xcb_dri3_buffer_from_pixmap_reply_t* reply);

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
 */
xcb_void_cookie_t xcb_dri3_fence_from_fd_checked(xcb_connection_t* c, xcb_drawable_t drawable, uint fence, ubyte initially_triggered, int fence_fd);

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 */
xcb_void_cookie_t xcb_dri3_fence_from_fd(xcb_connection_t* c, xcb_drawable_t drawable, uint fence, ubyte initially_triggered, int fence_fd);

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 */
xcb_dri3_fd_from_fence_cookie_t xcb_dri3_fd_from_fence(xcb_connection_t* c, xcb_drawable_t drawable, uint fence);

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
 */
xcb_dri3_fd_from_fence_cookie_t xcb_dri3_fd_from_fence_unchecked(xcb_connection_t* c, xcb_drawable_t drawable, uint fence);

/**
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_dri3_fd_from_fence_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
 */
xcb_dri3_fd_from_fence_reply_t* xcb_dri3_fd_from_fence_reply(xcb_connection_t* c, xcb_dri3_fd_from_fence_cookie_t cookie, xcb_generic_error_t** e);

/**
 * Return the reply fds
 * @param c      The connection
 * @param reply  The reply
 *
 * Returns a pointer to the array of reply fds of the reply.
 *
 * The returned value points into the reply and must not be free().
 * The fds are not managed by xcb. You must close() them before freeing the reply.
 */
int* xcb_dri3_fd_from_fence_reply_fds(xcb_connection_t* c, xcb_dri3_fd_from_fence_reply_t* reply);

int xcb_dri3_get_supported_modifiers_sizeof(const(void)* _buffer);

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 */
xcb_dri3_get_supported_modifiers_cookie_t xcb_dri3_get_supported_modifiers(xcb_connection_t* c, uint window, ubyte depth, ubyte bpp);

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
 */
xcb_dri3_get_supported_modifiers_cookie_t xcb_dri3_get_supported_modifiers_unchecked(xcb_connection_t* c, uint window, ubyte depth, ubyte bpp);

ulong* xcb_dri3_get_supported_modifiers_window_modifiers(const(xcb_dri3_get_supported_modifiers_reply_t)* R);

int xcb_dri3_get_supported_modifiers_window_modifiers_length(const(xcb_dri3_get_supported_modifiers_reply_t)* R);

xcb_generic_iterator_t xcb_dri3_get_supported_modifiers_window_modifiers_end(const(xcb_dri3_get_supported_modifiers_reply_t)* R);

ulong* xcb_dri3_get_supported_modifiers_screen_modifiers(const(xcb_dri3_get_supported_modifiers_reply_t)* R);

int xcb_dri3_get_supported_modifiers_screen_modifiers_length(const(xcb_dri3_get_supported_modifiers_reply_t)* R);

xcb_generic_iterator_t xcb_dri3_get_supported_modifiers_screen_modifiers_end(const(xcb_dri3_get_supported_modifiers_reply_t)* R);

/**
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_dri3_get_supported_modifiers_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
 */
xcb_dri3_get_supported_modifiers_reply_t* xcb_dri3_get_supported_modifiers_reply(xcb_connection_t* c, xcb_dri3_get_supported_modifiers_cookie_t cookie, xcb_generic_error_t** e);

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
 */
xcb_void_cookie_t xcb_dri3_pixmap_from_buffers_checked(xcb_connection_t* c, xcb_pixmap_t pixmap, xcb_window_t window, ubyte num_buffers, ushort width, ushort height, uint stride0, uint offset0, uint stride1, uint offset1, uint stride2, uint offset2, uint stride3, uint offset3, ubyte depth, ubyte bpp, ulong modifier, const(int)* buffers);

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 */
xcb_void_cookie_t xcb_dri3_pixmap_from_buffers(xcb_connection_t* c, xcb_pixmap_t pixmap, xcb_window_t window, ubyte num_buffers, ushort width, ushort height, uint stride0, uint offset0, uint stride1, uint offset1, uint stride2, uint offset2, uint stride3, uint offset3, ubyte depth, ubyte bpp, ulong modifier, const(int)* buffers);

int xcb_dri3_buffers_from_pixmap_sizeof(const(void)* _buffer, int buffers);

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 */
xcb_dri3_buffers_from_pixmap_cookie_t xcb_dri3_buffers_from_pixmap(xcb_connection_t* c, xcb_pixmap_t pixmap);

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
 */
xcb_dri3_buffers_from_pixmap_cookie_t xcb_dri3_buffers_from_pixmap_unchecked(xcb_connection_t* c, xcb_pixmap_t pixmap);

uint* xcb_dri3_buffers_from_pixmap_strides(const(xcb_dri3_buffers_from_pixmap_reply_t)* R);

int xcb_dri3_buffers_from_pixmap_strides_length(const(xcb_dri3_buffers_from_pixmap_reply_t)* R);

xcb_generic_iterator_t xcb_dri3_buffers_from_pixmap_strides_end(const(xcb_dri3_buffers_from_pixmap_reply_t)* R);

uint* xcb_dri3_buffers_from_pixmap_offsets(const(xcb_dri3_buffers_from_pixmap_reply_t)* R);

int xcb_dri3_buffers_from_pixmap_offsets_length(const(xcb_dri3_buffers_from_pixmap_reply_t)* R);

xcb_generic_iterator_t xcb_dri3_buffers_from_pixmap_offsets_end(const(xcb_dri3_buffers_from_pixmap_reply_t)* R);

int* xcb_dri3_buffers_from_pixmap_buffers(const(xcb_dri3_buffers_from_pixmap_reply_t)* R);

int xcb_dri3_buffers_from_pixmap_buffers_length(const(xcb_dri3_buffers_from_pixmap_reply_t)* R);

xcb_generic_iterator_t xcb_dri3_buffers_from_pixmap_buffers_end(const(xcb_dri3_buffers_from_pixmap_reply_t)* R);

/**
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_dri3_buffers_from_pixmap_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
 */
xcb_dri3_buffers_from_pixmap_reply_t* xcb_dri3_buffers_from_pixmap_reply(xcb_connection_t* c, xcb_dri3_buffers_from_pixmap_cookie_t cookie, xcb_generic_error_t** e);

/**
 * Return the reply fds
 * @param c      The connection
 * @param reply  The reply
 *
 * Returns a pointer to the array of reply fds of the reply.
 *
 * The returned value points into the reply and must not be free().
 * The fds are not managed by xcb. You must close() them before freeing the reply.
 */
int* xcb_dri3_buffers_from_pixmap_reply_fds(xcb_connection_t* c, xcb_dri3_buffers_from_pixmap_reply_t* reply);

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
 */
xcb_void_cookie_t xcb_dri3_set_drm_device_in_use_checked(xcb_connection_t* c, xcb_window_t window, uint drmMajor, uint drmMinor);

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 */
xcb_void_cookie_t xcb_dri3_set_drm_device_in_use(xcb_connection_t* c, xcb_window_t window, uint drmMajor, uint drmMinor);

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
 */
xcb_void_cookie_t xcb_dri3_import_syncobj_checked(xcb_connection_t* c, xcb_dri3_syncobj_t syncobj, xcb_drawable_t drawable, int syncobj_fd);

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 */
xcb_void_cookie_t xcb_dri3_import_syncobj(xcb_connection_t* c, xcb_dri3_syncobj_t syncobj, xcb_drawable_t drawable, int syncobj_fd);

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
 */
xcb_void_cookie_t xcb_dri3_free_syncobj_checked(xcb_connection_t* c, xcb_dri3_syncobj_t syncobj);

/**
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 */
xcb_void_cookie_t xcb_dri3_free_syncobj(xcb_connection_t* c, xcb_dri3_syncobj_t syncobj);





/**
 * @}
 */
