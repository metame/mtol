#lang racket
(require web-server/servlet
         web-server/servlet-env)


(define (app req)
    (response/xexpr
     "Hello world"))

(define (start port)
  (printf "Starting server on localhost:~s\n" port)
  (serve/servlet app
                 #:port port))

(start 3000)
