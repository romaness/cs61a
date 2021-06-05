#lang racket
(require berkeley)

(define (switch s)
  (if (empty? s)
  '()
  (se (switch-first (first s)) (switch-rest (bf s)))))

(define (switch-first w)
  (cond ((equal? w 'I) 'you)
        ((equal? w 'You) 'i)
        (else w) ))


(define (switch-rest s)
  (if (empty? s)
  '()
  (se (replace (first s))
            (switch (bf s)))))


(define (replace w)
  (cond ((equal? w 'you) 'me)
        ((equal? w 'i) 'you)
        ((equal? w 'me) 'you)
        (else w) ))


(switch '(You told me that I should wake you up))