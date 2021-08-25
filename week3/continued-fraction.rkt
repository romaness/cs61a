#lang racket


(define (cont-frac n d k)
  (define (helper i)
  (if (= k 0)
      (n k)
      (cont-frac (/ n k) (d)) d (- k 1)))
  (helper 1))



(define (expt-faster b n)
  (expt-fast-iter b n 1))
  (define (expt-fast-iter b n a)
      (cond ((= n 0) a)
      ((even? n) (expt-fast-iter (square b) (/ n 2) a))
      (else (expt-fast-iter b (- n 1) (* a b)))))
      

(define (cont-frac n d k)
  (define (iter k result)
    (if (= k 0)
	result
	(iter (- k 1)
	      (/ (n k) (+ (d k) result)))))
  (iter k 0))



(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0) 3)