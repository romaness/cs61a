#lang racket
(require berkeley)

(define (switch s)
  (if (empty? s)
  '()
  (se (replace (first s))
            (switch (bf s)))))


(define (replace w)
  (cond ((equal? w 'i) 'you)
        ((equal? w 'I) 'you)
        ((equal? w 'me) 'you)
        ((equal? w 'You) 'i)
        ((equal? w 'you) 'me)
        (else w) ))


(switch '(You told me that I should wake you up))