#lang racket
(require berkeley)

; Exercise
; Return a sentence with all the words that end with e
; > (ends-e ’(please put the salami above the blue elephant))
; (please the above the blue)


(define (ends-e s)
  (if (empty? (bf s))
  (last-letter-check (last s))
  (se (last-letter-check (first s)) (ends-e (bf s)))))


(define (last-letter-check w)
  (cond ((equal? (last w) 'e) w)
        (else '()) ))


(ends-e '(please above the blue))
