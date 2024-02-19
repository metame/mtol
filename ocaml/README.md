# OCaml

https://en.wikipedia.org/wiki/OCaml
https://ocaml.org/docs/your-first-program
https://ocaml.org/docs/tour-of-ocaml#exceptions
https://ocaml.org/docs/tour-of-ocaml#records
https://learnxinyminutes.com/docs/ocaml/
https://cs3110.github.io/textbook/chapters/modules/module_systems.html
https://aantron.github.io/dream/
https://github.com/aantron/dream/tree/master/example/e-json
https://github.com/ocaml-community/yojson#readme
https://github.com/aantron/dream/tree/master/example/1-hello
https://v2.ocaml.org/manual/moduleexamples.html#s%3Aseparate-compilation
https://github.com/ocaml-ppx/ppx_deriving_yojson

## Adding github/external dependency

Options:
* opam pin add <package-name> <git-url>
* adding github dependencies in project.opam.template file where `project` is your project name:
e.g.
```
pin-depends: [
  ["tailwindcss.dev" "https://github.com/tmattio/opam-tailwindcss/archive/3e60fc32bbcf82525999d83ad0f395e16107026b.tar.gz"]
  ["olinkcheck.~dev" "git+https://github.com/tarides/olinkcheck"]
  ]
```
