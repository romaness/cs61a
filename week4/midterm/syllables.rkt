#lang simply-scheme
(define (syllables word)
  (cond ((empty? word) 0)
        ((and (vowel? (first word)) (vowel? (first (first word)))) (+ 1 (syllables (bf (bf word)))))
        ((vowel? (first word)) (+ 1 (syllables (bf word))))
        (else (syllables (bf word)))))

;realized that this solution is incomplete in case more than two syllables are in the beginning -> to fix it remove syllables recursively 


(define (vowel? letter)
(member? letter '(a e i o u)))