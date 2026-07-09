module os.bug_priv;
@nogc nothrow:
extern(C): __gshared:
/* SPDX-License-Identifier: MIT OR X11
 *
 * Copyright © 2024 Enrico Weigelt, metux IT consult <info@metux.net>
 */
 
/* Don't use this directly, use BUG_WARN or BUG_WARN_MSG instead */
enum string __BUG_WARN_MSG(string cond, string with_msg) = ``;
enum string BUG_WARN_MSG(string cond) = `` ~ __BUG_WARN_MSG!(cond, `__VA_ARGS__`) ~ ``;

enum string BUG_WARN(string cond) = __BUG_WARN_MSG!(cond, `null`);

enum string BUG_RETURN(string cond) = `
    do { if (` ~ cond ~ `) { ` ~ __BUG_WARN_MSG!(cond, `null`) ~ `; return; } } while(0)`;

enum string BUG_RETURN_MSG(string cond) = `
    do { if (` ~ cond ~ `) { ` ~ __BUG_WARN_MSG!(cond, `__VA_ARGS__`) ~ `; return; } } while(0)`;

enum string BUG_RETURN_VAL(string cond, string val) = `
    do { if (` ~ cond ~ `) { ` ~ __BUG_WARN_MSG!(cond, `null`) ~ `; return (` ~ val ~ `); } } while(0)`;

enum string BUG_RETURN_VAL_MSG(string cond, string val) = `
    do { if (` ~ cond ~ `) { ` ~ __BUG_WARN_MSG!(cond, `__VA_ARGS__`) ~ `; return (` ~ val ~ `); } } while(0)`;

 /* _XSERVER_OS_BUG_H_ */
