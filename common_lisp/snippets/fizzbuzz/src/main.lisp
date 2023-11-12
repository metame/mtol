(defpackage fizzbuzz
  (:use :cl)
  (:export
   #:fizzbuzz))
(in-package :fizzbuzz)

(defun fizzbuzz (x)
  (cond
    ((and (= 0 (mod x 3)) (= 0 (mod x 5)))
     "fizzbuzz")
    ((= 0 (mod x 3))
     "fizz")
    ((= 0 (mod x 5))
     "buzz")
    (t (write-to-string x))))

(format t "~A~%" (fizzbuzz 1))
(format t "~A~%" (fizzbuzz 3))
(format t "~A~%" (fizzbuzz 6))
(format t "~A~%" (fizzbuzz 5))
(format t "~A~%" (fizzbuzz 10))
(format t "~A~%" (fizzbuzz 15))
