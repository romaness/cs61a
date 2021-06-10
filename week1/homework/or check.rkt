#lang racket
(require berkeley)



(define (true)
  #t)

(define (false)
  #f)


; Or: If any expression evaluates to a true value, that value is returned as the value of the or expression,
; and the rest of the ⟨e⟩’s are not evaluated
; (ordinary-or #t #f) -> #f, this means #f gets evaluated even though the first argument is #t
; (special-or #t #f) -> #t, this means that the second argument #f doesn't get evaluated

(define (normal-or x y)
  x
  y
)

(define (special-or x y)
(or x y))




; And: If any expression evaluates to false, the value of the and expression is false,
; and the rest of the ⟨e⟩’s are not evaluated.
; (ordinary-and #f #t) -> #t, this means #t gets evaluated even though the first argument is #f
; (special-and #f #t) -> #f, this means that the second argument #t doesn't get evaluated


(define (normal-and x y)
  x
  y
)

(define (special-and x y)
(and x y))


