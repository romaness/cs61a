#lang simply-scheme


(define (a) (list 23 72 149 34 101))

(define (last-pair lst)
  (if (null? (cdr lst))
         (car lst)
         (last-pair (cdr lst))))


