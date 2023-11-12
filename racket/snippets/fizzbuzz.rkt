#lang racket

(provide fizzbuzz)

(define (fizzbuzz x)
  (cond
   [(and (= 0 (modulo x 3))
         (= 0 (modulo x 5)))
    "fizzbuzz"]
   [(= 0 (modulo x 3))
    "fizz"]
   [(= 0 (modulo x 5))
    "buzz"]
   [else
    (number->string x)]))
