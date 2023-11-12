(defpackage hello_world/tests/main
  (:use :cl
        :hello_world
        :rove))
(in-package :hello_world/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :hello_world)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
