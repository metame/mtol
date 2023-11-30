# Common Lisp

Common Lisp is a spec, not an implementation

## VODs

* [Part 1](https://www.youtube.com/watch?v=Y1_Tcwchunk)
* [Part 2](https://www.youtube.com/watch?v=hC2MAsa14cI)

## References

* [Common Lisp HyperSpec](https://www.lispworks.com/documentation/HyperSpec/Front/index.htm) - online documentation of the spec
* [Common Lisp Nova Spec](https://novaspec.org/cl/) - a prettier, searchable version of the spec
* [Lisp Cookbook](https://lispcookbook.github.io/cl-cookbook/) - an oft recommended source for starting, learning, and reference
* [Steel Bank Common Lisp (sbcl)](https://www.sbcl.org/) - the implementation we used
* [Quicklisp](https://www.quicklisp.org/beta/) - library manager
*

## Dev Env

### Compiler/Interpreter

The compilation process is a little confusing so we didn't really try to compile a binary, but it is possible. Instead we just started our application in the repl.

### REPL
Just run `sbcl`.

### LSP
We used slime for emacs setup and the tooling is quite powerful though I wouldn't necessarily say modern. Like other lisps, this isn't an LSP but a repl-connected buffer mode.

### Package Management
[Quicklisp](https://www.quicklisp.org/beta) is amazing. Install dependencies with `ql:quickload`.
It was a little confusing that the install name of the package isn't necessarily the package name for the source, e.g. we installed `cl-json` but the package name is just `json` in our source code.

### Issues

None so far

## Packages

* [clack](https://quickdocs.org/clack)
* [cl-json](https://cl-json.common-lisp.dev/cl-json.html)

## Thoughts

There's a lot common lisp took from scheme, and SO MUCH that clojure took from common lisp.

Fun fact, elisp (emacs lisp) is a common lisp implementation (LFG)
