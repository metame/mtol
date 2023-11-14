#lang racket
(require json
         web-server/servlet
         web-server/servlet-env)

(define (hello req)
    (response/xexpr
     "Hello world"
     #:mime-type #"text/plain"))

(define (hello-name req name)
  (let* ([greeting (format "Hello ~a" name)]
         [json (hash 'greeting greeting)])
    (response/jsexpr json)))

(define (bad-request req)
  (response/empty #:code 400))

(define (goodbye req)
  (let* ([bytes (request-post-data/raw req)]
         [body (when (bytes? bytes)
                 (bytes->jsexpr bytes))]
         [name (when (hash? body)
                 (hash-ref body 'name null))])
    (if (string? name)
        (response/xexpr
         (format "Goodbye ~a" name)
         #:mime-type #"text/plain")
        (bad-request req))))

(define (not-found req)
  (response/empty #:code 404))

(define-values (route url)
  (dispatch-rules
   [("hello") hello]
   [("hello" (string-arg)) hello-name]
   [("goodbye") #:method "post" goodbye]
   [else not-found]))

(define (handler request)
  (route request))

(define (start port)
  (printf "Starting server on localhost:~s\n" port)
  (serve/servlet handler
                 #:launch-browser? #f
                 #:servlet-path "/"
                 #:servlet-regexp #rx""
                 #:port port))

(start 3000)
