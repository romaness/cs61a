#lang racket
(require berkeley)
;Exercise: Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.

; Solution
; other version, can be solved more beautifully through recursion
; Though still an interesting solution, I think, just to see those nested ()..

(define (square-sum-of-larger-nums a b c)
  (define (square x) (* x x))
  (cond((>= a b) (+ (square a) (square (if (>= b c) b c))))
       ((>= b c) (+ (square b) (square (if (>= a c) a c))))
       (else (+ (square c) (square (if (>= a b) a b))))))



(square-sum-of-larger-nums 1 2 3)
(square-sum-of-larger-nums 1 5 6)