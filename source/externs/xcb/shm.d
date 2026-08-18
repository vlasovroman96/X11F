module externs.xcb.shm;
@nogc nothrow:
extern(C): __gshared:
/*
 * This file generated automatically from shm.xml by c_client.py.
 * Edit at your peril.
 */

/**
 * @defgroup XCB_Shm_API XCB Shm API
 * @brief Shm XCB Protocol Implementation.
 * @{
 **/

 
public import externs.xcb.xcb;
public import externs.xcb.xproto;
import externs.xcb.xcbext;


enum XCB_SHM_MAJOR_VERSION = 1;
enum XCB_SHM_MINOR_VERSION = 2;

xcb_extension_t xcb_shm_id;

alias xcb_shm_seg_t = uint;

/**
 * @brief xcb_shm_seg_iterator_t
 **/
struct xcb_shm_seg_iterator_t {
    xcb_shm_seg_t* data;
    int rem;
    int index;
}

/** Opcode for xcb_shm_completion. */
enum XCB_SHM_COMPLETION = 0;

/**
 * @brief xcb_shm_completion_event_t
 **/
struct xcb_shm_completion_event_t {
    ubyte response_type;
    ubyte pad0;
    ushort sequence;
    xcb_drawable_t drawable;
    ushort minor_event;
    ubyte major_event;
    ubyte pad1;
    xcb_shm_seg_t shmseg;
    uint offset;
}

/** Opcode for xcb_shm_bad_seg. */
enum XCB_SHM_BAD_SEG = 0;

alias xcb_shm_bad_seg_error_t = xcb_value_error_t;

/**
 * @brief xcb_shm_query_version_cookie_t
 **/
struct xcb_shm_query_version_cookie_t {
    uint sequence;
}

/** Opcode for xcb_shm_query_version. */
enum XCB_SHM_QUERY_VERSION = 0;

/**
 * @brief xcb_shm_query_version_request_t
 **/
struct xcb_shm_query_version_request_t {
    ubyte major_opcode;
    ubyte minor_opcode;
    ushort length;
}

/**
 * @brief xcb_shm_query_version_reply_t
 **/
struct xcb_shm_query_version_reply_t {
    ubyte response_type;
    ubyte shared_pixmaps;
    ushort sequence;
    uint length;
    ushort major_version;
    ushort minor_version;
    ushort uid;
    ushort gid;
    ubyte pixmap_format;
    ubyte[15] pad0;
}

/** Opcode for xcb_shm_attach. */
enum XCB_SHM_ATTACH = 1;

/**
 * @brief xcb_shm_attach_request_t
 **/
struct xcb_shm_attach_request_t {
    ubyte major_opcode;
    ubyte minor_opcode;
    ushort length;
    xcb_shm_seg_t shmseg;
    uint shmid;
    ubyte read_only;
    ubyte[3] pad0;
}

/** Opcode for xcb_shm_detach. */
enum XCB_SHM_DETACH = 2;

/**
 * @brief xcb_shm_detach_request_t
 **/
struct xcb_shm_detach_request_t {
    ubyte major_opcode;
    ubyte minor_opcode;
    ushort length;
    xcb_shm_seg_t shmseg;
}

/** Opcode for xcb_shm_put_image. */
enum XCB_SHM_PUT_IMAGE = 3;

/**
 * @brief xcb_shm_put_image_request_t
 **/
struct xcb_shm_put_image_request_t {
    ubyte major_opcode;
    ubyte minor_opcode;
    ushort length;
    xcb_drawable_t drawable;
    xcb_gcontext_t gc;
    ushort total_width;
    ushort total_height;
    ushort src_x;
    ushort src_y;
    ushort src_width;
    ushort src_height;
    short dst_x;
    short dst_y;
    ubyte depth;
    ubyte format;
    ubyte send_event;
    ubyte pad0;
    xcb_shm_seg_t shmseg;
    uint offset;
}

/**
 * @brief xcb_shm_get_image_cookie_t
 **/
struct xcb_shm_get_image_cookie_t {
    uint sequence;
}

/** Opcode for xcb_shm_get_image. */
enum XCB_SHM_GET_IMAGE = 4;

/**
 * @brief xcb_shm_get_image_request_t
 **/
struct xcb_shm_get_image_request_t {
    ubyte major_opcode;
    ubyte minor_opcode;
    ushort length;
    xcb_drawable_t drawable;
    short x;
    short y;
    ushort width;
    ushort height;
    uint plane_mask;
    ubyte format;
    ubyte[3] pad0;
    xcb_shm_seg_t shmseg;
    uint offset;
}

/**
 * @brief xcb_shm_get_image_reply_t
 **/
struct xcb_shm_get_image_reply_t {
    ubyte response_type;
    ubyte depth;
    ushort sequence;
    uint length;
    xcb_visualid_t visual;
    uint size;
}

/** Opcode for xcb_shm_create_pixmap. */
enum XCB_SHM_CREATE_PIXMAP = 5;

/**
 * @brief xcb_shm_create_pixmap_request_t
 **/
struct xcb_shm_create_pixmap_request_t {
    ubyte major_opcode;
    ubyte minor_opcode;
    ushort length;
    xcb_pixmap_t pid;
    xcb_drawable_t drawable;
    ushort width;
    ushort height;
    ubyte depth;
    ubyte[3] pad0;
    xcb_shm_seg_t shmseg;
    uint offset;
}

/** Opcode for xcb_shm_attach_fd. */
enum XCB_SHM_ATTACH_FD = 6;

/**
 * @brief xcb_shm_attach_fd_request_t
 **/
struct xcb_shm_attach_fd_request_t {
    ubyte major_opcode;
    ubyte minor_opcode;
    ushort length;
    xcb_shm_seg_t shmseg;
    ubyte read_only;
    ubyte[3] pad0;
}

/**
 * @brief xcb_shm_create_segment_cookie_t
 **/
struct xcb_shm_create_segment_cookie_t {
    uint sequence;
}

/** Opcode for xcb_shm_create_segment. */
enum XCB_SHM_CREATE_SEGMENT = 7;

/**
 * @brief xcb_shm_create_segment_request_t
 **/
struct xcb_shm_create_segment_request_t {
    ubyte major_opcode;
    ubyte minor_opcode;
    ushort length;
    xcb_shm_seg_t shmseg;
    uint size;
    ubyte read_only;
    ubyte[3] pad0;
}

/**
 * @brief xcb_shm_create_segment_reply_t
 **/
struct xcb_shm_create_segment_reply_t {
    ubyte response_type;
    ubyte nfd;
    ushort sequence;
    uint length;
    ubyte[24] pad0;
}

/**
 * Get the next element of the iterator
 * @param i Pointer to a xcb_shm_seg_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_shm_seg_t)
 */
void xcb_shm_seg_next(xcb_shm_seg_iterator_t* i);

/**
 * Return the iterator pointing to the last element
 * @param i An xcb_shm_seg_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
 */
xcb_generic_iterator_t xcb_shm_seg_end(xcb_shm_seg_iterator_t i);

/**
 * @brief Query the version of the MIT-SHM extension.
 *
 * @param c The connection
 * @return A cookie
 *
 * This is used to determine the version of the MIT-SHM extension supported by the
 * X server.  Clients MUST NOT make other requests in this extension until a reply
 * to this requests indicates the X server supports them.
 *
 */
xcb_shm_query_version_cookie_t xcb_shm_query_version(xcb_connection_t* c);

/**
 * @brief Query the version of the MIT-SHM extension.
 *
 * @param c The connection
 * @return A cookie
 *
 * This is used to determine the version of the MIT-SHM extension supported by the
 * X server.  Clients MUST NOT make other requests in this extension until a reply
 * to this requests indicates the X server supports them.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
 */
xcb_shm_query_version_cookie_t xcb_shm_query_version_unchecked(xcb_connection_t* c);

/**
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_shm_query_version_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
 */
xcb_shm_query_version_reply_t* xcb_shm_query_version_reply(xcb_connection_t* c, xcb_shm_query_version_cookie_t cookie, xcb_generic_error_t** e);

/**
 * @brief Attach a System V shared memory segment.
 *
 * @param c The connection
 * @param shmseg A shared memory segment ID created with xcb_generate_id().
 * @param shmid The System V shared memory segment the server should map.
 * @param read_only True if the segment shall be mapped read only by the X11 server, otherwise false.
 * @return A cookie
 *
 * Attach a System V shared memory segment to the server.  This will fail unless
 * the server has permission to map the segment.  The client may destroy the segment
 * as soon as it receives a XCB_SHM_COMPLETION event with the shmseg value in this
 * request and with the appropriate serial number.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
 */
xcb_void_cookie_t xcb_shm_attach_checked(xcb_connection_t* c, xcb_shm_seg_t shmseg, uint shmid, ubyte read_only);

/**
 * @brief Attach a System V shared memory segment.
 *
 * @param c The connection
 * @param shmseg A shared memory segment ID created with xcb_generate_id().
 * @param shmid The System V shared memory segment the server should map.
 * @param read_only True if the segment shall be mapped read only by the X11 server, otherwise false.
 * @return A cookie
 *
 * Attach a System V shared memory segment to the server.  This will fail unless
 * the server has permission to map the segment.  The client may destroy the segment
 * as soon as it receives a XCB_SHM_COMPLETION event with the shmseg value in this
 * request and with the appropriate serial number.
 *
 */
xcb_void_cookie_t xcb_shm_attach(xcb_connection_t* c, xcb_shm_seg_t shmseg, uint shmid, ubyte read_only);

/**
 * @brief Destroys the specified shared memory segment.
 *
 * @param c The connection
 * @param shmseg The segment to be destroyed.
 * @return A cookie
 *
 * Destroys the specified shared memory segment.  This will never fail unless the
 * segment number is incorrect.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
 */
xcb_void_cookie_t xcb_shm_detach_checked(xcb_connection_t* c, xcb_shm_seg_t shmseg);

/**
 * @brief Destroys the specified shared memory segment.
 *
 * @param c The connection
 * @param shmseg The segment to be destroyed.
 * @return A cookie
 *
 * Destroys the specified shared memory segment.  This will never fail unless the
 * segment number is incorrect.
 *
 */
xcb_void_cookie_t xcb_shm_detach(xcb_connection_t* c, xcb_shm_seg_t shmseg);

/**
 * @brief Copy data from the shared memory to the specified drawable.
 *
 * @param c The connection
 * @param drawable The drawable to draw to.
 * @param gc The graphics context to use.
 * @param total_width The total width of the source image.
 * @param total_height The total height of the source image.
 * @param src_x The source X coordinate of the sub-image to copy.
 * @param src_y The source Y coordinate of the sub-image to copy.
 * @param src_width The width, in source image coordinates, of the data to copy from the source.
 * The X server will use this to determine the amount of data to copy.  The amount
 * of the destination image that is overwritten is determined automatically.
 * @param src_height The height, in source image coordinates, of the data to copy from the source.
 * The X server will use this to determine the amount of data to copy.  The amount
 * of the destination image that is overwritten is determined automatically.
 * @param dst_x The X coordinate on the destination drawable to copy to.
 * @param dst_y The Y coordinate on the destination drawable to copy to.
 * @param depth The depth to use.
 * @param format The format of the image being drawn.  If it is XYBitmap, depth must be 1, or a
 * "BadMatch" error results.  The foreground pixel in the GC determines the source
 * for the one bits in the image, and the background pixel determines the source
 * for the zero bits.  For XYPixmap and ZPixmap, the depth must match the depth of
 * the drawable, or a "BadMatch" error results.
 * @param send_event True if the server should send an XCB_SHM_COMPLETION event when the blit
 * completes.
 * @param offset The offset that the source image starts at.
 * @return A cookie
 *
 * Copy data from the shared memory to the specified drawable.  The amount of bytes
 * written to the destination image is always equal to the number of bytes read
 * from the shared memory segment.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
 */
xcb_void_cookie_t xcb_shm_put_image_checked(xcb_connection_t* c, xcb_drawable_t drawable, xcb_gcontext_t gc, ushort total_width, ushort total_height, ushort src_x, ushort src_y, ushort src_width, ushort src_height, short dst_x, short dst_y, ubyte depth, ubyte format, ubyte send_event, xcb_shm_seg_t shmseg, uint offset);

/**
 * @brief Copy data from the shared memory to the specified drawable.
 *
 * @param c The connection
 * @param drawable The drawable to draw to.
 * @param gc The graphics context to use.
 * @param total_width The total width of the source image.
 * @param total_height The total height of the source image.
 * @param src_x The source X coordinate of the sub-image to copy.
 * @param src_y The source Y coordinate of the sub-image to copy.
 * @param src_width The width, in source image coordinates, of the data to copy from the source.
 * The X server will use this to determine the amount of data to copy.  The amount
 * of the destination image that is overwritten is determined automatically.
 * @param src_height The height, in source image coordinates, of the data to copy from the source.
 * The X server will use this to determine the amount of data to copy.  The amount
 * of the destination image that is overwritten is determined automatically.
 * @param dst_x The X coordinate on the destination drawable to copy to.
 * @param dst_y The Y coordinate on the destination drawable to copy to.
 * @param depth The depth to use.
 * @param format The format of the image being drawn.  If it is XYBitmap, depth must be 1, or a
 * "BadMatch" error results.  The foreground pixel in the GC determines the source
 * for the one bits in the image, and the background pixel determines the source
 * for the zero bits.  For XYPixmap and ZPixmap, the depth must match the depth of
 * the drawable, or a "BadMatch" error results.
 * @param send_event True if the server should send an XCB_SHM_COMPLETION event when the blit
 * completes.
 * @param offset The offset that the source image starts at.
 * @return A cookie
 *
 * Copy data from the shared memory to the specified drawable.  The amount of bytes
 * written to the destination image is always equal to the number of bytes read
 * from the shared memory segment.
 *
 */
xcb_void_cookie_t xcb_shm_put_image(xcb_connection_t* c, xcb_drawable_t drawable, xcb_gcontext_t gc, ushort total_width, ushort total_height, ushort src_x, ushort src_y, ushort src_width, ushort src_height, short dst_x, short dst_y, ubyte depth, ubyte format, ubyte send_event, xcb_shm_seg_t shmseg, uint offset);

/**
 * @brief Copies data from the specified drawable to the shared memory segment.
 *
 * @param c The connection
 * @param drawable The drawable to copy the image out of.
 * @param x The X coordinate in the drawable to begin copying at.
 * @param y The Y coordinate in the drawable to begin copying at.
 * @param width The width of the image to copy.
 * @param height The height of the image to copy.
 * @param plane_mask A mask that determines which planes are used.
 * @param format The format to use for the copy (???).
 * @param shmseg The destination shared memory segment.
 * @param offset The offset in the shared memory segment to copy data to.
 * @return A cookie
 *
 * Copy data from the specified drawable to the shared memory segment.  The amount
 * of bytes written to the destination image is always equal to the number of bytes
 * read from the shared memory segment.
 *
 */
xcb_shm_get_image_cookie_t xcb_shm_get_image(xcb_connection_t* c, xcb_drawable_t drawable, short x, short y, ushort width, ushort height, uint plane_mask, ubyte format, xcb_shm_seg_t shmseg, uint offset);

/**
 * @brief Copies data from the specified drawable to the shared memory segment.
 *
 * @param c The connection
 * @param drawable The drawable to copy the image out of.
 * @param x The X coordinate in the drawable to begin copying at.
 * @param y The Y coordinate in the drawable to begin copying at.
 * @param width The width of the image to copy.
 * @param height The height of the image to copy.
 * @param plane_mask A mask that determines which planes are used.
 * @param format The format to use for the copy (???).
 * @param shmseg The destination shared memory segment.
 * @param offset The offset in the shared memory segment to copy data to.
 * @return A cookie
 *
 * Copy data from the specified drawable to the shared memory segment.  The amount
 * of bytes written to the destination image is always equal to the number of bytes
 * read from the shared memory segment.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
 */
xcb_shm_get_image_cookie_t xcb_shm_get_image_unchecked(xcb_connection_t* c, xcb_drawable_t drawable, short x, short y, ushort width, ushort height, uint plane_mask, ubyte format, xcb_shm_seg_t shmseg, uint offset);

/**
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_shm_get_image_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
 */
xcb_shm_get_image_reply_t* xcb_shm_get_image_reply(xcb_connection_t* c, xcb_shm_get_image_cookie_t cookie, xcb_generic_error_t** e);

/**
 * @brief Create a pixmap backed by shared memory.
 *
 * @param c The connection
 * @param pid A pixmap ID created with xcb_generate_id().
 * @param drawable The drawable to create the pixmap in.
 * @param width The width of the pixmap to create.  Must be nonzero, or a Value error results.
 * @param height The height of the pixmap to create.  Must be nonzero, or a Value error results.
 * @param depth The depth of the pixmap to create.  Must be nonzero, or a Value error results.
 * @param shmseg The shared memory segment to use to create the pixmap.
 * @param offset The offset in the segment to create the pixmap at.
 * @return A cookie
 *
 * Create a pixmap backed by shared memory.  Writes to the shared memory will be
 * reflected in the contents of the pixmap, and writes to the pixmap will be
 * reflected in the contents of the shared memory.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
 */
xcb_void_cookie_t xcb_shm_create_pixmap_checked(xcb_connection_t* c, xcb_pixmap_t pid, xcb_drawable_t drawable, ushort width, ushort height, ubyte depth, xcb_shm_seg_t shmseg, uint offset);

/**
 * @brief Create a pixmap backed by shared memory.
 *
 * @param c The connection
 * @param pid A pixmap ID created with xcb_generate_id().
 * @param drawable The drawable to create the pixmap in.
 * @param width The width of the pixmap to create.  Must be nonzero, or a Value error results.
 * @param height The height of the pixmap to create.  Must be nonzero, or a Value error results.
 * @param depth The depth of the pixmap to create.  Must be nonzero, or a Value error results.
 * @param shmseg The shared memory segment to use to create the pixmap.
 * @param offset The offset in the segment to create the pixmap at.
 * @return A cookie
 *
 * Create a pixmap backed by shared memory.  Writes to the shared memory will be
 * reflected in the contents of the pixmap, and writes to the pixmap will be
 * reflected in the contents of the shared memory.
 *
 */
xcb_void_cookie_t xcb_shm_create_pixmap(xcb_connection_t* c, xcb_pixmap_t pid, xcb_drawable_t drawable, ushort width, ushort height, ubyte depth, xcb_shm_seg_t shmseg, uint offset);

/**
 * @brief Create a shared memory segment
 *
 * @param c The connection
 * @param shmseg A shared memory segment ID created with xcb_generate_id().
 * @param shm_fd The file descriptor the server should mmap().
 * @param read_only True if the segment shall be mapped read only by the X11 server, otherwise false.
 * @return A cookie
 *
 * Create a shared memory segment.  The file descriptor will be mapped at offset
 * zero, and the size will be obtained using fstat().  A zero size will result in a
 * Value error.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
 */
xcb_void_cookie_t xcb_shm_attach_fd_checked(xcb_connection_t* c, xcb_shm_seg_t shmseg, int shm_fd, ubyte read_only);

/**
 * @brief Create a shared memory segment
 *
 * @param c The connection
 * @param shmseg A shared memory segment ID created with xcb_generate_id().
 * @param shm_fd The file descriptor the server should mmap().
 * @param read_only True if the segment shall be mapped read only by the X11 server, otherwise false.
 * @return A cookie
 *
 * Create a shared memory segment.  The file descriptor will be mapped at offset
 * zero, and the size will be obtained using fstat().  A zero size will result in a
 * Value error.
 *
 */
xcb_void_cookie_t xcb_shm_attach_fd(xcb_connection_t* c, xcb_shm_seg_t shmseg, int shm_fd, ubyte read_only);

/**
 * @brief Asks the server to allocate a shared memory segment.
 *
 * @param c The connection
 * @param shmseg A shared memory segment ID created with xcb_generate_id().
 * @param size The size of the segment to create.
 * @param read_only True if the server should map the segment read-only; otherwise false.
 * @return A cookie
 *
 * Asks the server to allocate a shared memory segment.  The server’s reply will
 * include a file descriptor for the client to pass to mmap().
 *
 */
xcb_shm_create_segment_cookie_t xcb_shm_create_segment(xcb_connection_t* c, xcb_shm_seg_t shmseg, uint size, ubyte read_only);

/**
 * @brief Asks the server to allocate a shared memory segment.
 *
 * @param c The connection
 * @param shmseg A shared memory segment ID created with xcb_generate_id().
 * @param size The size of the segment to create.
 * @param read_only True if the server should map the segment read-only; otherwise false.
 * @return A cookie
 *
 * Asks the server to allocate a shared memory segment.  The server’s reply will
 * include a file descriptor for the client to pass to mmap().
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
 */
xcb_shm_create_segment_cookie_t xcb_shm_create_segment_unchecked(xcb_connection_t* c, xcb_shm_seg_t shmseg, uint size, ubyte read_only);

/**
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_shm_create_segment_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
 */
xcb_shm_create_segment_reply_t* xcb_shm_create_segment_reply(xcb_connection_t* c, xcb_shm_create_segment_cookie_t cookie, xcb_generic_error_t** e);

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
int* xcb_shm_create_segment_reply_fds(xcb_connection_t* c, xcb_shm_create_segment_reply_t* reply);





/**
 * @}
 */
