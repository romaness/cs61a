#lang racket
(require berkeley)


(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))


(define (product fn a next b)
  (if (> a b)
      1
      (* (fn a)
         (product fn (next a) next b))))


(define (inc n) (+ n 1))

(define (factorial b)
  (product (lambda (x) x) 1 inc b))



(define (pi-approximation b)
  (define (add-product n) (* (/ (* 2 n) (- (* 2 n) 1)) (/ (* 2 n) (+ (* 2 n) 1))))
  (product add-product 1 inc b))







                     