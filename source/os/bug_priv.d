module os.bug_priv;
@nogc nothrow:
extern(C): __gshared:
/* SPDX-License-Identifier: MIT OR X11
 *
 * Copyright © 2024 Enrico Weigelt, metux IT consult <info@metux.net>
 */
 
public import os.log;

/* Don't use this directly, use BUG_WARN or BUG_WARN_MSG instead */
enum string __BUG_WARN_MSG(string cond, string with_msg) = `
{
    if (`~cond~`) {                                                  
            ErrorF("BUG: 'if (\"`~cond~`\")'\n");                            
            ErrorF("BUG: %s:%u in %s()\n", __FILE__.ptr, __LINE__, __FUNCTION__.ptr); 
            static if ("`~with_msg~`" != null) 
                ErrorF("`~with_msg~`");                            
            xorg_backtrace();                                             
        }
}`;
enum string BUG_WARN_MSG(string cond, string msg) = `` ~ __BUG_WARN_MSG!(cond, msg) ~ ``;

enum string BUG_WARN(string cond) = __BUG_WARN_MSG!(cond, `null`);

enum string BUG_RETURN(string cond) = `
    if (` ~ cond ~ `) { ` ~ __BUG_WARN_MSG!(cond, `null`) ~ `; return; }`;

enum string BUG_RETURN_MSG(string cond) = `
    do { if (` ~ cond ~ `) { ` ~ __BUG_WARN_MSG!(cond, `__VA_ARGS__`) ~ `; return; } } while(0)`;

enum string BUG_RETURN_VAL(string cond, string val) = `
    if (` ~ cond ~ `) { ` ~ __BUG_WARN_MSG!(cond, `null`) ~ `; return (` ~ val ~ `); }`;

enum string BUG_RETURN_VAL_MSG(string cond, string val, string msg) = `
    if (` ~ cond ~ `) { ` ~ __BUG_WARN_MSG!(cond, msg) ~ `; return (` ~ val ~ `); }`;

 /* _XSERVER_OS_BUG_H_ */
