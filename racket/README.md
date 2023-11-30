# Racket

## VODs

* [Day 1](https://www.youtube.com/watch?v=D3CBQqTPBZo)
* [Day 2](https://www.youtube.com/watch?v=dlY0RQgpmkk)

## References

* [Racket Website](https://racket-lang.org)
* [The Racket Guide](https://docs.racket-lang.org/guide/index.html) - good beginner's resource
* [The Racket Reference](https://docs.racket-lang.org/reference/index.html)
* [Systems Programming with Racket](https://docs.racket-lang.org/more/index.html)
* [Web Applications Tutorial](https://docs.racket-lang.org/continue/index.html)
* [Web Server Docs](https://docs.racket-lang.org/web-server/index.html)
* [JSON docs](https://docs.racket-lang.org/json/index.html)

## Dev Env

We installed [racket-mode](https://racket-mode.com/#Install) which had everything we needed built-in.

### Compiler/Interpreter

We didn't compile anything. Just used the REPL.

### REPL

`$ racket`

### LSP

No LSP needed. REPL-connected buffer provides LSP-like functionality.

### Package Management

The pre-installed libraries had everything we needed so we never reached for any package management.

### Issues
* Had issues installing racket-mode the first time, but seemed to be a transient issue with refreshing packages from melpa.
* Despite the docs having a more modern UI and nice hyperlinking, I found the documentation to be a little difficult to use. Perhaps, this was due to not understanding some basics around struct behavior (such as what I assume are macro-generated accessors). I also missed the one page guides, manuals, and documentation available for Common Lisp.
* As alluded to the syntax of struct accessors being `<structname>-<fieldname>` definitely through me off.

## Packages

We didn't use any!
