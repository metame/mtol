(define (fizzbuzz x)
  (cond
   ((and (= 0 (modulo x 3)) (= 0 (modulo x 5))) "fizzbuzz")
   ((= 0 (modulo x 3)) "fizz")
   ((= 0 (modulo x 5)) "buzz")
   (else (number->string x))))

(display (string-append (fizzbuzz 1) "\n"))
(display (string-append (fizzbuzz 3) "\n"))
(display (string-append (fizzbuzz 6) "\n"))
(display (string-append (fizzbuzz 5) "\n"))
(display (string-append (fizzbuzz 10) "\n"))
(display (string-append (fizzbuzz 15) "\n"))
