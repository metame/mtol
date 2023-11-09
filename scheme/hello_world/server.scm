(use-modules (web server)
             (web request)
             (web response)
             (web uri))

(define (not-found request)
  (values (build-response #:code 404)
          (string-append "Resource not found: "
                         (uri->string (request-uri request)))))

(define (request-path-components request)
  (split-and-decode-uri-path (uri-path (request-uri request))))

;; GET `/hello` returns text response of "Hello World!"
(define (hello-world-handler request request-body)
  (values '((content-type . (text/plain)))
          "Hello World!"))

;; GET `/hello/<name>` returns json response of `{"greeting": "Hello <name>!"}`
(define (hello-name-handler request request-body)
  (let ((name (car (cdr (request-path-components request)))))
    (values '((content-type . (text/plain)))
          (string-append "Hello " name "!"))))

;; POST `/goodbye` takes a json payload of `{"name":string}` and returns text response of "Goodbye <name>"
(define (goodbye-handler request request-body)
  (let ((name "meta"))
    (values '((content-type . (text/plain)))
            (string-append "Goodbye " name))))

(define (handler request request-body)
  (let ((path-parts (request-path-components request))
         (method (request-method request)))
    (display method)
    (display path-parts)
    (cond
     ;; check for whether there is a 2nd element before cadr
     ((and (equal? (car path-parts) "hello")
           (= 2 (length path-parts))
           (not (nil? (cdr path-parts))))
      (hello-name-handler request request-body))

     ((equal? path-parts '("hello"))
      (hello-world-handler request request-body))

     ((equal? path-parts '("goodbye"))
      (goodbye-handler request request-body))

     (else (not-found request)))))

(run-server handler)
