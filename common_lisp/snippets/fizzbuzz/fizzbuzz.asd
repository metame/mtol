(defsystem "fizzbuzz"
  :version "0.0.1"
  :author ""
  :license ""
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "fizzbuzz/tests"))))

(defsystem "fizzbuzz/tests"
  :author ""
  :license ""
  :depends-on ("fizzbuzz"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for fizzbuzz"
  :perform (test-op (op c) (symbol-call :rove :run c)))
