#lang racket
(require berkeley)
(require racket/trace)	


(define (square x) (* x x))


(define (repeated f n)
    (lambda (x)
    (if (= n 0)
	x
	(f ((repeated f (- n 1)) x)))))







((repeated square 2) 5)