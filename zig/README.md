# Zig

[Home Page](https://ziglang.org)
[Zig Language Reference](https://ziglang.org/documentation/master/)
[Zig Standard Library Docs](https://ziglang.org/documentation/master/std/#A;std)
[ziglearn "book"](https://ziglearn.org)
[Ziglings](https://ziglings.org/)

## Dev Env

Installed `zig-mode` in emacs.

### Compiler
You could install using a package manager.
I just downloaded a build from the [downloads page](https://ziglang.org/download).
Extract with `tar -xvf` somewhere you want it to be.
Add that directory to your path `echo 'export PATH=$PATH:~/path/to/zig' >> .bash_profile`.

### LSP
[zls](https://github.com/zigtools/zls/wiki/Installation#prebuilt-binaries) - I just downloaded the prebuilt binary and put it in the same dir as my zig install. Eglot found it without issue.

### Package Management
Zon is the Zig package manager. It currently doesn't have a cli but works from the `build.zig.zon` file in project root to install dependencies.

### Issues
The install process wasn't perfectly smooth, but it wasn't difficult either.

## Packages
[Zap](https://github.com/zigzap/zap) - Backend web micro framework. Wraps facil.io (which we used for C)
> Note: We did have issues with Zap's latest pre-release not being compatible with Zig 0.12, thanks to chatter [Southporter](https://github.com/zigzap/zap/tree/master) we were able to patch our cached version of Zap for compatibility without downgrading our Zig toolchain.
