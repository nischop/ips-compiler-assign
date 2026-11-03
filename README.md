# FASTO Compiler

A compiler for the FASTO functional language, built for the *Implementation of Programming Languages* course.

**Features:** Lexer, parser, interpreter, type checker, RISC-V code generation, array operations (`map`, `reduce`, `replicate`, `filter`, `scan`), and optimizations such as inlining, constant folding, and dead-code removal.

**Requirements:** .NET 9.0 and Java Runtime Environment (for RARS).

**Usage:**
- `bin/fasto.sh -i tests/file.fo` — interpret a program
- `bin/fasto.sh -c tests/file.fo` — compile without optimizations
- `bin/fasto.sh -o tests/file.fo` — compile with optimizations
- `bin/rars.sh tests/file.asm` — run generated assembly

**Folders:** `Fasto/` contains compiler source; `tests/` contains test programs; `doc/` contains documentation; `bin/` contains scripts and simulator; `tools/` contains optional editor support.
