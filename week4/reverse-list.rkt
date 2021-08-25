#lang simply-scheme
(require racket/trace)	

; return (25 16 9 4 1)

(define (reverse given-list)
  (define (iter counter)
          (if (= counter 1)
          (return-element given-list counter)
          (append (return-element given-list counter) (iter (- counter 1)))))
(iter (list-length 0 given-list)))

(define (list-length counter reduced-list)
      (if (null? reduced-list)
          counter
      (list-length (+ counter 1) (cdr reduced-list))))

(define (return-element given-list index)
  (if (= index 1)
      (list (car given-list))
      (return-element (cdr given-list) (- index 1))))
  

(reverse '(16 25 33 66))


; simpler solution

(define (reversed liste)
  (if (empty? liste)
      '()
    (append (reverse (cdr liste)) (list (car liste)))))