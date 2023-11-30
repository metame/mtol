# Scheme

## VODs

* [Day 1](https://www.youtube.com/watch?v=TFtnmthigUY)

## References

* [Scheme.org](https://www.scheme.org/)
* [Reference](https://www.gnu.org/software/guile/manual/guile.html#API-Reference)
* [Scheme Primer](https://spritely.institute/static/papers/scheme-primer.html)
* [Guile](https://www.gnu.org/software/guile) - the scheme implementation we chose

## Dev Env

Emacs comes with `scheme-mode` built-in.

### Compiler/Interpreter
We chose the Guile implementation as it is a good beginner friendly implementation with manuals, docs, and a nice website (link in bio, errr 7 lines up). It was already installed on my system (I don't remember how or when) but on MacOS you can just `brew install guile`.

### REPL
Running `guile` with no args opens up a REPL. Being used to the very nice clojure REPL, this one felt a little clunky but it's usable.

### LSP
In common Lisp fashion, the REPL gives the emacs buffer information about your code and powers most things an LSP would. But for those outside of the emacs world, there is this that I didn't bother trying to install:
[scheme-lsp-server](https://codeberg.org/rgherdt/scheme-lsp-server)

### Package Management
There's no package manager but I found the install process for Guile modules to be well-documented and straightforward with established conventions for configuration and linking that made using an external package easy.

### Issues
Most tools recommend installing with [Guix](https://guix.gnu.org), which seems like a good option if you're on GNU/Linux, but isn't supported on MacOS so we went without some tools that probably could've helped early on (like an LSP, for example)

## Packages

* [guile-json](https://github.com/aconchillo/guile-json)
