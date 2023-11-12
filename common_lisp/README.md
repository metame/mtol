# Common Lisp

> Wow, these are getting worse as time goes on, the READMEs, not the languages

Common Lisp is a spec, not an implementation
We used sbcl
quicklisp is amazing `ql:quickload` installs dependencies
It was a little confusing that the install name of the package isn't necessarily the package name for the source, e.g. we installed `cl-json` but the package name is just `json` in our source code.
Lisp Cookbook is excellent
There's a lot common lisp took from scheme, and SO MUCH that clojure took from common lisp.

Fun fact, elisp (emacs lisp) is a common lisp implements (LFG)

The compilation process is a little confusing so we didn't really try to compile a binary, but it is possible. Instead we just started our application in the repl.

We used slime for emacs setup and the tooling is quite powerful though I wouldn't necessarily say modern.
