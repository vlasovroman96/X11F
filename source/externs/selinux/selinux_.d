module externs.selinux.selinux_;

extern(C): @nogc:
nothrow: 
import externs.selinux.selinux;
import externs.selinux.avc;
import externs.selinux.label;
// import Xext.xselinux_label;

struct avc_init_args;
// struct selabel_handle;

int getpeercon_raw(int fd, char** con) @nogc nothrow;
int getpeercon_raw_d(int fd, char** con)
{
    return getpeercon_raw(fd, con);
}

int avc_context_to_sid_raw(const(char)* ctx, security_id_t* sid) @nogc nothrow;
int avc_context_to_sid_raw_d(const(char)* ctx, security_id_t* sid)
{
    return avc_context_to_sid_raw(ctx, sid);
}

int getcon_raw(char** ctx) @nogc nothrow;
int getcon_raw_d(char** ctx)
{
    return getcon_raw(ctx);
}

int avc_compute_create(
    security_id_t ssid,
    security_id_t tsid,
    security_class_t tclass,
    security_id_t* outSid) @nogc nothrow;
int avc_compute_create_d(
    security_id_t ssid,
    security_id_t tsid,
    security_class_t tclass,
    security_id_t* outSid)
{
    return avc_compute_create(ssid, tsid, tclass, outSid);
}

int audit_log_user_avc_message(
    int audit_fd,
    int type,
    const(char)* message,
    const(char)* hostname,
    const(char)* addr,
    const(char)* tty,
    int result) @nogc nothrow;
int audit_log_user_avc_message_d(
    int audit_fd,
    int type,
    const(char)* message,
    const(char)* hostname,
    const(char)* addr,
    const(char)* tty,
    int result)
{
    return audit_log_user_avc_message(
        audit_fd,
        type,
        message,
        hostname,
        addr,
        tty,
        result);
}


int selinux_set_mapping(security_class_mapping* map) @nogc nothrow;
int selinux_set_mapping_d(security_class_mapping* map)
{
    return selinux_set_mapping(map);
}

void avc_netlink_check_nb()  @nogc nothrow;
void avc_netlink_check_nb_d() {
	avc_netlink_check_nb();
}

void audit_close(int audit_fd)  @nogc nothrow;;
void audit_close_d(int audit_fd) {
	audit_close(audit_fd);
}

void avc_netlink_release_fd()  @nogc nothrow;;
void avc_netlink_release_fd_d() {
	avc_netlink_release_fd();
}
// void RemoveNotifyFd(netlink_fd);
void avc_destroy()  @nogc nothrow;;
void avc_destroy_d() {
	avc_destroy();
}

int selinux_set_callback(int type, selinux_callback cb)  @nogc nothrow;;
int selinux_set_callback_d(int type, selinux_callback cb)
{
    return selinux_set_callback(type, cb);
}

int avc_open(avc_init_args* args, int flags) @nogc nothrow;;
int avc_open_d(avc_init_args* args, int flags)
{
    return avc_open(args, flags);
}

int security_get_initial_context_raw(const(char)* name, char** ctx)  @nogc nothrow;;
int security_get_initial_context_raw_d(const(char)* name, char** ctx)
{
    return security_get_initial_context_raw(name, ctx);
}

int audit_open() @nogc nothrow;
int audit_open_d()
{
    return audit_open();
}

int avc_netlink_acquire_fd() 
@nogc nothrow;;
int avc_netlink_acquire_fd_d()
{
    return avc_netlink_acquire_fd();
}

int selabel_lookup_raw(
    selabel_handle* hnd,
    char** ctx,
    const(char)* name,
    int map)
@nogc nothrow;;
int selabel_lookup_raw_d(
    selabel_handle* hnd,
    char** ctx,
    const(char)* name,
    int map)
{
    return selabel_lookup_raw(hnd, ctx, name, map);
}

void freecon(char* con)
@nogc nothrow;;

void freecon_d(char* con)
{
    freecon(con);
}

int avc_compute_member(
    security_id_t ssid,
    security_id_t tsid,
    security_class_t tclass,
    security_id_t* outSid)

@nogc nothrow;;

int avc_compute_member_d(
    security_id_t ssid,
    security_id_t tsid,
    security_class_t tclass,
    security_id_t* outSid)
{
    return avc_compute_member(ssid, tsid, tclass, outSid);
}

selabel_handle* selabel_open(
    int backend,
    selinux_opt* opts,
    uint nopts)


@nogc nothrow;;
selabel_handle* selabel_open_d(
    int backend,
    selinux_opt* opts,
    uint nopts)
{
    return selabel_open(backend, opts, nopts);
}

void selabel_close(selabel_handle* hnd)
@nogc nothrow;;


void selabel_close_d(selabel_handle* hnd)
{
    selabel_close(hnd);
}