# C++

## VODs

* [Day 1](https://www.youtube.com/watch?v=EHkFIut4jtU)
* [Day 2](https://www.youtube.com/watch?v=F1nK8GyJS7s)

## References

* [Reference](https://en.cppreference.com/w/cpp)
* [cpp-httplib](https://github.com/yhirose/cpp-httplib/tree/master)
* [nlohmann/json](https://github.com/nlohmann/json)

## Dev Env

Emacs already has `c++-mode` by default so nothing to install there.

### Compiler

We used `g++`.

### LSP

* [ccls](https://github.com/MaskRay/ccls) - Cumbersome build process
* [clangd](https://clangd.llvm.org/) - Just `brew install llvm` and you're ready

### Issues

* `clang` didn't work to compile `snippets/fizzbuzz.cpp` and maybe that's a me problem. `clang++` works fine and so does `g++`.
