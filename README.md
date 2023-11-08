# Meta Tour of Languages

12 languages in 4 weeks
1 week per language grouping
4 hours per language (non contiguous)

## Schedule

### Week 1
Low-level: C, C++, Zig

### Week 2
Lisps: Scheme, Common, Racket

### Week 3
ML: Standard, Haskell, OCaml

### Week 4
Dependently-typed: Coq, Agda, Idris


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
