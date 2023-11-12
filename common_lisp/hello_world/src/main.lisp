(defpackage hello_world
  (:use :cl :json :clack :str))
(in-package :hello_world)

(defun not-found (env)
  (format t "~S~%" (getf env :path-info))
  '(404 () ("Path not found")))

(defun bad-request (env)
  (declare (ignore env))
  '(400 () ("Bad Request")))

;; GET `/hello` returns text response of "Hello World!"
(defun hello-handler (env)
  (declare (ignore env))
  '(200 (:content-type "text/plain") ("Hello World!")))

;; GET `/hello/<name>` returns json response of `{"greeting": "Hello <name>!"}`
(defun hello-name-handler (env)
  (let* ((path-parts (rest (str:split "/" (getf env :path-info))))
         (name (second path-parts))
         (pl (list :greeting (str:concat "Hello " name "!")))
         (json (json:encode-json-plist-to-string pl)))
    (cond
      ((str:empty? name) (bad-request env))
      ((> (length path-parts) 2) (not-found env))
      (t (list 200 '(:content-type "application/json") (list json))))))

;; POST `/goodbye` takes a json payload of `{"name":string}` and returns text response of "Goodbye <name>"
(defun goodbye-handler (env)
  (let* ((body (getf env :raw-body))
         (json (json:decode-json body))
         (name (cdr (assoc :name json))))
    (if (not name)
        (bad-request env)
        (list 200 '(:content-type "text/plain") (list (str:concat "Goodbye " name))))))

(defun handler (env)
  (let ((method (getf env :request-method))
        (path (getf env :path-info)))
    (format t "~A~%" method)
    (format t "~S~%" path)
    (cond
      ((and (eq :GET method)
           (equal "/hello" path))
       (hello-handler env))

      ((and (eq :GET method)
            (str:starts-with? "/hello" path))
       (hello-name-handler env))

      ((and (eq :POST method)
            (equal "/goodbye" path))
       (goodbye-handler env))

      (t (not-found env)))))

;; blah blah blah.
(defvar *server*
  (clack:clackup
   (lambda (env) (funcall 'handler env))
   :port 3000))
