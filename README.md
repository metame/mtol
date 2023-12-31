# Meta Tour of Languages

12 languages in 4 weeks
1 week per language grouping
4 hours per language (non contiguous)
Streamed live on [twitch.tv/metameeee](https://twitch.tv/metameeee)
Recordings can be found on [YouTube](https://www.youtube.com/playlist?list=PLIQMZpTvfeMYRLWuaEHZ0mNTXctfoUwUt)

## Schedule

### Week 1

Low-level:
[C](/c)
[C++](/cpp)
[Zig](/zig)

### Week 2

Lisps:
[Scheme](/scheme)
[Common Lisp](/common_lisp)
[Racket](/racket)

### Week 3
ML:
[Standard ML](/standardML)
[Haskell](/haskell)
[OCaml](/ocaml)

### Week 4
Dependently-typed:
[Coq](/coq)
[Agda](/agda)
[Idris](/idris)

## Format
1. Getting started docs 15m
2. Dev env setup: compilers, repls, editor config, etc. 15m to 1h
3. Hello world web service
4. Twitch chat bot: send only to start, command bot

### Hello World Web Service
* GET `/hello` returns text response of "Hello World!"
* GET `/hello/<name>` returns json response of `{"greeting": "Hello <name>!"}`
* POST `/goodbye` takes a json payload of `{"name":string}` and returns text response of "Goodbye <name>"

## Directory Structure
* Each lang has it's own directory from root
* In the root directory, the README will contain links to the resources used
* Each lang directory will have a `hello_world` subdir with the hello world web service and a `twitch_bot` subdir.

## TODO

### Off stream
1. Recompile emacs with native comp
2. Add timer to obs scenes
