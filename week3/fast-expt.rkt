#lang racket

 (require racket/trace)

(define (expt b n)
  (expt-iter b n 1))
(define (expt-iter b counter product)
  (if (= counter 0)
      product
      (expt-iter b (- counter 1) (* b product))))


(define (expt-faster b n)
  (expt-fast-iter b n 1))
  (define (expt-fast-iter b n a)
      (cond ((= n 0) a)
      ((even? n) (expt-fast-iter (square b) (/ n 2) a))
      (else (expt-fast-iter b (- n 1) (* a b)))))



(define (fast-exp b n)
  (define (iter a b n)
    (cond ((= n 0) a)
	  ((even? n) (iter a (square b) (/ n 2)))
	  (else (iter (* a b) b (- n 1)))))
  (iter 1 b n))



(define (square x) (* x x))

(define (fast-expt b n)
  (cond ((= n 0) 1)
      ((even? n) (square (fast-expt b (/ n 2))))
      (else (* b (fast-expt b (- n 1))))))


(trace fast-expt)

(trace expt-faster)


(expt-faster 2 5)
  



(fast-expt 2 4)

(expt-faster 2 4)
