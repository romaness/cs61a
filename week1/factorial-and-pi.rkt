#lang racket
(require berkeley)


(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))


(define (product fn a next b)
  (if (= a 0)
      1
      (* (fn a) (product fn (next a) next b))))



(define (dec n) (- n 1))

(define (factorial a)
  (product (lambda (x) x) a dec 1))


(define (add-two n) (+ n 2))


(define (pi-approximation x)
  (product (lambda (x y) (/ x y)) 3 add-two 1))





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



                     