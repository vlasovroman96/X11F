module dix.atomsgen;
import std.array;
import std.conv : to;
import std.file : readText, write;
import std.string : splitLines, strip;
import std.file : readText, write;
import std.string : splitLines, strip, indexOf;
import std.conv : to;
import build.dix_config;

pragma(mangle, mixin(cFixer!(__MODULE__, __LINE__)))
void main(string[] args)
{
    if (args.length != 3)
        throw new Exception("usage: generate-atoms INPUT OUTPUT");

    auto input = readText(args[1]);

    string output;

    output ~= "/* THIS IS A GENERATED FILE\n";
    output ~= " *\n";
    output ~= " * Do not change! Changing this file implies a protocol change!\n";
    output ~= " */\n\n";

    output ~= "void MakePredeclaredAtoms()\n";
    output ~= "{\n";

    foreach (line; input.splitLines)
    {
        auto l = line.strip;

        if (l.indexOf('@') < 0)
            continue;

        auto parts = l.split();

        if (parts.length == 0)
            continue;

        auto name = parts[0];

        output ~= "    if (MakeAtom(\"" ~ name ~ "\", " ~
                  name.length.to!string ~
                  ", 1) != XA_" ~ name ~ ")\n";

        output ~= "        FatalError(\"Adding builtin atom\");\n";
    }

    output ~= "}\n";

    write(args[2], output);
}