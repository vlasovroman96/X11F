module cFix;

template cFixer(string moduleName, size_t line)
{
    enum string cFixer =
        `"__x12_` ~ moduleName ~ `_` ~ line.stringof ~ `"`;
}

//USING:
// pragma(mangle, mixin(cFixer!(__MODULE__, __LINE__)))
// extern(C)
// private void fillSpans(...)
// {
//  	......
// }
// pragma(mangle, mixin(cFixer!(__MODULE__, __LINE__)))