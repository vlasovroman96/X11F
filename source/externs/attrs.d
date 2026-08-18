module externs.attrs;

import std.traits;

auto assumeNoGC(T)(T t)
if (isFunctionPointer!T)
{
    alias FT = FunctionTypeOf!T;

    alias NewFT = SetFunctionAttributes!(
        FT,
        functionLinkage!FT,
        functionAttributes!FT | FunctionAttribute.nogc | FunctionAttribute.nothrow_
    );

    return cast(NewFT*) t;
}

