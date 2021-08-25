#lang racket
(require berkeley)





(define (squares s)
  (if (empty? s)
  '()
  (se (square (first s))
            (squares (bf s)))))




(define (every f s)
  (if (empty? s)
    '()
    (se (f (first s))
        (every f (bf s)))))


