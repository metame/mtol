(define-module (meta server))
(use-modules (ice-9 iconv)
             (json)
             (web server)
             (web request)
             (web response)
             (web uri))

(define (bad-request request)
  (values (build-response #:code 400)
          (string-append "Bad request on: "
                         (uri->string (request-uri request)))))

(define (not-found request)
  (values (build-response #:code 404)
          (string-append "Resource not found: "
                         (uri->string (request-uri request)))))

(define (request-path-components request)
  (split-and-decode-uri-path (uri-path (request-uri request))))

;; Get `/hello` returns text response of "Hello World!"
(define (hello-world-handler request request-body)
  (values '((content-type . (text/plain)))
          "Hello World!"))

;; GET `/hello/<name>` returns json response of `{"greeting": "Hello <name>!"}`
(define (hello-name-handler request request-body)
  (let* ((name (car (cdr (request-path-components request))))
         (greeting (string-append "Hello " name "!"))
         (res (assoc-set! '() "greeting" greeting)))
    (values '((content-type . (application/json)))
            (scm->json-string res))))

;; POST `/goodbye` takes a json payload of `{"name":string}` and returns text response of "Goodbye <name>"
(define (goodbye-handler request request-body)
  (let* ((body (json-string->scm (bytevector->string request-body "utf-8")))
         (name (assoc-ref body "name")))
    (if (string? name)
        (values '((content-type . (text/plain)))
                (string-append "Goodbye " name))
        (bad-request request))))

(define (handler request request-body)
  (let ((path-parts (request-path-components request))
         (method (request-method request)))
    (cond
     ((and (equal? (car path-parts) "hello")
           (= 2 (length path-parts))
           (not (nil? (cdr path-parts))))
      (hello-name-handler request request-body))

     ((equal? path-parts '("hello"))
      (hello-world-handler request request-body))

     ((equal? path-parts '("goodbye"))
      (goodbye-handler request request-body))

     (else (not-found request)))))

(display "Starting server on localhost:8080")
(run-server handler)
