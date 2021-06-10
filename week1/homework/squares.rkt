#lang racket
(require berkeley)

(define (squares s)
  (if (empty? s)
  '()
  (se (square (first s))
            (squares (bf s)))))