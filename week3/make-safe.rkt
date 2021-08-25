#lang racket
(require berkeley)

(define (make-safe fn predicate)
  (lambda (x) 
  (if (predicate x)
      (fn x)
      #f)))



(define safe-sqrt (make-safe sqrt number?))