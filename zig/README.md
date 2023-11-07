# Zig

[Reference](https://ziglang.org)
[ziglearn "book"](https://ziglearn.org)

## Dev Env

Installed `zig-mode` in emacs.

### Compiler
You could install using a package manager.
I just downloaded a build from the [downloads page](https://ziglang.org/download).
Extract with `tar -xvf` somewhere you want it to be.
Add that directory to your path `echo 'export PATH=$PATH:~/path/to/zig' >> .bash_profile`.

### LSP
[zls](https://github.com/zigtools/zls/wiki/Installation#prebuilt-binaries) - I just downloaded the prebuilt binary and put it in the same dir as my zig install. Eglot found it without issue.

### Issues
