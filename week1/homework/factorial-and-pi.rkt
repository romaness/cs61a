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
  (product (lambda (x y) (/ x y)) 3 add-two 1)