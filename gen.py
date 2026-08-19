#!/usr/bin/env python3

from pathlib import Path
import sys


root = Path(sys.argv[1]) if len(sys.argv) > 1 else Path("source/externs/X11")

for header in root.rglob("*.h"):
    rel = header.relative_to(root)
    parts = rel.with_suffix("").parts

    module = "externs.X11." + ".".join(parts)

    importc_module = module + "_"

    c_file = header.with_name(header.stem + "_.c")
    d_file = header.with_name(header.stem + ".d")

    c_file.write_text(
        f"#if __IMPORTC__\n"
        f"__module {importc_module};\n"
        f"#endif\n\n"
        f'#include "{header.name}"\n',
        encoding="utf-8",
    )

    d_file.write_text(
        f"module {module};\n\n"
        f"public import {importc_module};\n",
        encoding="utf-8",
    )

    print(f"{rel}")
    print(f"  C: {c_file}")
    print(f"  D: {d_file}")