#lang racket


(define (iterative-improve good-enough? improve-guess)
  (define (iterate guess)
    (if (good-enough? guess)
                  guess
                  (iterate (improve-guess guess)))) iterate)


(define (average x y) (/ (+ x y) 2))
(define (improve guess x) (average guess (/ x guess)))


(define (square x) (* x x))

(define (good-enough? guess x) (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iterate x)
  ((iterative-improve (lambda (guess) (< (abs (- (square guess) x)) 0.001))
                      (lambda (guess) (average guess (/ x guess))))
   1.0))


(define (fixed-point f)
  ((iterative-improve (lambda (guess) (< (abs (- guess (f guess))) 0.00001))
                      f)
   1.0))




(sqrt-iterate 9)

(fixed-point cos)



