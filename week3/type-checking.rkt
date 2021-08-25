#lang racket
(require berkeley)

(define (type-check fn predicate arg)
  (if (predicate arg)
      (fn arg)
      #f))
  