module externs.libdbus;

@nogc nothrow {
    public import externs.dbus; // Импортируем весь Си-модуль целиком
}

template resolve(string name)
{
    auto resolve() @nogc nothrow
    {
        // 1. Создаем переменную типа void* и пишем туда адрес функции через ассемблерное имя.
        // Строка развернется в: void* ptr = &dbus_connection_get_is_connected;
        // Никаких кортежей, никаких AliasSeq, чистый Си-символ!
        void* ptr = mixin("&" ~ name);

        // 2. Объявляем тип "указатель на функцию, принимающую void* и возвращающую int"
        // Она примет ЛЮБОЙ указатель (структуру, bus, connection) как первый аргумент.
        alias CheatFunc = extern(C) int function(void*) @nogc nothrow;

        // 3. Кастим void* в этот указатель. Для DMD это простое преобразование данных.
        return cast(CheatFunc) ptr;
    }
}