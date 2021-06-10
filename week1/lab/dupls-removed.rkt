#lang racket
(require berkeley)

;Exercise: Write a procedure dupls-removed that, given a sentence as input, returns the result of removing duplicate words from the sentence. It should work this way
;> (dupls-removed ’(a a a a b a a))
;(b a)



(define (dupls-removed letters)
  (define (is-duplicate s letters)
  (if (member? s letters)
      '()
      s))
  (if (empty? letters)
  '()
  (se (is-duplicate (first letters) (bf letters)) (dupls-removed (bf letters)))))



