#lang racket 
(require berkeley)


(define (filtered-accumulate filter? combiner null-value term a next b)
  (cond ((> a b) null-value)
        ((filter? a)(combiner (term a)
                              (filtered-accumulate
                                        filter?
                                        combiner
                                        null-value
                                        term
                                        (next a)
                                        next
                                        b)))
  (else (filtered-accumulate filter?
                             combiner
                             null-value
                             term
                             (next a)
                             next
                             b))))



(define (sum-of-squares-prime a b)
  (define (square x) (* x x))
  (filtered-accumulate prime? + 0 square a +1 b))

(define (product-of-all-int-relative-prime n)
  (filtered-accumulate (lambda (x) (= 1 (gcd x n))) * 1 (lambda (x) x) 1 +1 n))
  

  

 