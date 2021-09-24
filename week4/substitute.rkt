#lang simply-scheme
(define (substitute items old new)
    (define (replace item)
    (if (equal? item old)
        new
        item))
  (define (sublist subitems)
    (if (list? subitems)
    (map replace subitems)
    (replace subitems)))
  (if (null? items)
      '()
  (cons (sublist (car items)) (substitute (cdr items) old new))))



(substitute '((lead guitar) (bass guitar) (rhythm guitar) guitar)
'guitar 'axe)


(define (substitute2 items old-list new-list)
  (define (replace item old-sublist new-sublist)
    (cond ((null? old-sublist) item)
          ((equal? item (car old-sublist)) (car new-sublist))
          (else (replace item (cdr old-sublist) (cdr new-sublist))))) 
  (define (substitute-sub-list sublist)
    (if (list? sublist)
    (map (lambda (x) (replace x old-list new-list)) sublist)
    (replace sublist old-list new-list)))
  (if (null? items) 
      '()
  (cons (substitute-sub-list (car items)) (substitute2 (cdr items) old-list new-list))))





(substitute2 '((4 calling birds) (3 french hens) (2 turtle doves))
'(1 2 3 4) '(one two three four))
;((four calling birds) (three french hens) (two turtle doves))