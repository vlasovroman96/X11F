#!/bin/bash

# --- КОНФИГУРАЦИЯ СЕРВЕРА ---
SRC_ROOT="/usr/include/xorg"          # Теперь корень - это строго Xorg SDK!
DEST_ROOT="source/xorg/include"       # Складываем в вашу структуру папок
BASE_PKG="xorg.include"               # Базовый пакет D

# Собираем пути только внутри xorg и добавляем стандартный /usr/include
INCLUDE_FLAGS="-I${SRC_ROOT} -I/usr/include -I/usr/include/pixman-1 -I/usr/include/libdrm"
while IFS= read -r dir; do
    INCLUDE_FLAGS="${INCLUDE_FLAGS} -I${dir}"
done < <(find "$SRC_ROOT" -type d)

# Нам БОЛЬШЕ НЕ НУЖНЫ грязные хаки вроде -DBool=int или подмешивание Xlib.h!
# Окружение xorg само знает все свои типы через встроенные файлы (callback.h, os.h и т.д.)
CLANG_FLAGS="${INCLUDE_FLAGS} -D__WCHAR_TYPE__=int -DX_LITTLE_ENDIAN=1 -D_XOPEN_SOURCE=500"

echo "🚀 Начинаем генерацию СЕРВЕРНЫХ D-связок из /usr/include/xorg..."
echo "------------------------------------------------"

find "$SRC_ROOT" -type f -name "*.h" | while read -r src_file; do
    
    rel_path="${src_file#$SRC_ROOT/}"
    rel_dir=$(dirname "$rel_path")
    file_name=$(basename "$rel_path")
    
    if [ "$rel_dir" = "." ]; then
        sub_pkg=""
        dest_dir="${DEST_ROOT}"
    elseвги
        sub_pkg=".$(echo "$rel_dir" | tr '[:upper:]' '[:lower:]' | tr '/' '.')"
        dest_dir="${DEST_ROOT}/$(echo "$rel_dir" | tr '[:upper:]' '[:lower:]')"
    fi
    
    d_package="${BASE_PKG}${sub_pkg}"
    d_filename=$(echo "${file_name%.*}" | tr '[:upper:]' '[:lower:]').d
    dest_file="${dest_dir}/${d_filename}"
    
    mkdir -p "$dest_dir"
    
    echo "📦 Конвертируем серверный: xorg/$rel_path..."
    
    # Запускаем dstep НАПРЯМУЮ на файл, без всяких временных файлов-оберток!
    dstep "$src_file" \
        -o "$dest_file" \
        --package "$d_package" \
        $CLANG_FLAGS 2>/dev/null
        
    if [ $? -ne 0 ] || [ ! -s "$dest_file" ]; then
        echo "❌ Пропущен или пуст: $rel_path"
        rm -f "$dest_file"
    fi
done

echo "------------------------------------------------"
echo "🎉 Генерация серверного SDK завершена!"
