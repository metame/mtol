# C

[Reference](https://en.cppreference.com/w/c)

## Dev Env

Emacs already has `c-mode` by default so nothing to install there.

### Compiler
Most likely you already have `gcc`, but there are other options out there. If you're going to use `clangd` LSP anyway you might as well use `clang`, which is already included when you install llvm (at least from homebrew). Finally, if you're using a `makefile`, then you can _build_ with `make`.

### LSP
[ccls](https://github.com/MaskRay/ccls) - Cumbersome build process
[clangd](https://clangd.llvm.org/) - Just `brew install llvm` and you're ready

### Issues
At first I had issues with `clangd` not finding external packages. This was fixed by installing [Bear](https://github.com/rizsotto/Bear).
