(defsystem "hello_world"
  :version "0.0.1"
  :author ""
  :license ""
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "hello_world/tests"))))

(defsystem "hello_world/tests"
  :author ""
  :license ""
  :depends-on ("hello_world"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for hello_world"
  :perform (test-op (op c) (symbol-call :rove :run c)))
