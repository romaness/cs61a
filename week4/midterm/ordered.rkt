#lang simply-scheme
(define (shorter? a b)
(<= (count a) (count b)) )

(define (order-checker predicate?)
  (lambda (words) (in-order? words)))

(define length-ordered? (order-checker shorter?))




(define (in-order? predicate? words)
  (cond ((empty? (bf words)) #t)
        ((predicate? (first words) (first (bf words))) (in-order? predicate? (bf words)))
        (else #f)))



(in-order? shorter?  '(i saw them standing together))

(in-order? > '(23 14 7 5 2))