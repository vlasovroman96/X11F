module externs.libhal;

// Базовые типы данных для компиляции старого Си-интерфейса HAL
struct LibHalContext;
struct LibHalPropertySet;

alias LibHalPropertyIterator = void*;
alias DBusConnection = void*;
alias DBusError = void*;

// Минимальные заглушки функций, если config/hal.d их вызывает напрямую
extern(C) {
    LibHalContext* libhal_ctx_new() { return null; }
    int libhal_ctx_set_dbus_connection(LibHalContext* ctx, DBusConnection* conn) { return 0; }
    int libhal_ctx_init(LibHalContext* ctx, DBusError* error) { return 0; }
    int libhal_ctx_shutdown(LibHalContext* ctx, DBusError* error) { return 0; }
    void libhal_ctx_free(LibHalContext* ctx) {}
    
    char* libhal_device_get_property_string(LibHalContext* ctx, const(char)* udi, const(char)* key, DBusError* error) { return null; }
    int libhal_device_property_exists(LibHalContext* ctx, const(char)* udi, const(char)* key, DBusError* error) { return 0; }
    void libhal_free_string(char* str) {}
}