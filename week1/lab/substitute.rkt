#lang racket
(require berkeley)
(require racket/trace)







(define (substitute sent old new)
  (cond ((empty? sent) '())
        ((equal? (first sent) old)
         (se new (substitute (bf sent) old new)))
        (else (se (first sent) (substitute (bf sent) old new)))))







;(trace substitute)
(substitute '(she loves you yeah yeah yeah) 'yeah 'maybe)


(define (g)
  (lambda (x) (+ 2 x)))

returns a number


any f will do
f has to return a function, otherwise it expects an argument
f that gets one argument
a lambda that returns a lambda

(define (f) (lambda () (lambda() (lambda(x) x))))
