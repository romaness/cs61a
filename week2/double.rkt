#lang racket
(require berkeley)



(define (double procedure)
  (lambda (x) (procedure (procedure x))))



(define (inc a)
  (+ a 1))




;(lambda (x) ((double (double x)) ((double (double x)) x))))
;(((double (double double)) inc) 5)
; 4x4 = 16



