#lang racket


(define (next-perfect n)
    (define (sum-of-factors n result factor)
    (cond ((= factor n) result)
          ((= (remainder n factor) 0) (sum-of-factors n (+ result factor) (+ factor 1)))
          (else (sum-of-factors n result (+ factor 1)))))
  (let ((result (sum-of-factors n 0 1)))
(if (or (> result n) (< result n))
    (next-perfect (+ n 1))
    result
)))









 
(next-perfect 10)
