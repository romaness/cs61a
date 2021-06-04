#lang racket
(require berkeley)

; When the sentence contains just one number then it has run through the whole sentence without finding a non asencding pair
(define (ordered? numbers)
  (cond ((empty? (bf numbers)) #t)
        ((< (first numbers) (first (bf numbers))) (ordered? (bf numbers)))
        (else #f )))


(ordered? '(1 2 3 6))

