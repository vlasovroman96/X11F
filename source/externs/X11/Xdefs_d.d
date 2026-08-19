module externs.X11.Xdefs_d;

// 1. Импортируем оригинальный Си-заголовок через ImportC
// (В зависимости от вашей структуры папок, путь может отличаться)
import xdefs_c = externs.X11.Xdefs; 

// 2. Импортируем правильный D-тип
import include.dixstruct : _Client; 

// 3. Перевыпускаем все сишные символы наружу (mixin)
public import externs.X11.Xdefs_;

// 4. ГЛАВНАЯ ПОДМЕНА: Переопределяем ClientPtr для D-пространства
// Теперь для всех, кто импортирует этот бридж, ClientPtr — это D-указатель
// alias ClientPtr = _Client*;
// alias clientptr = _client*; // на случай, если регистр отличается
