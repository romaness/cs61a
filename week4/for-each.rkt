#lang simply-scheme

(define (for-each proc items)
  (cond ((null? (cdr items)) (proc (car items)))
      (#t (proc (car items))
      (for-each proc (cdr items)))))
      

(for-each (lambda (x) (newline) (display x)) (list 57 321 88))



