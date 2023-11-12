(defpackage fizzbuzz/tests/main
  (:use :cl
        :fizzbuzz
        :rove))
(in-package :fizzbuzz/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :fizzbuzz)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
