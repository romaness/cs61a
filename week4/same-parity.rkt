#lang simply-scheme


(define (same-parity num . numbers)
  (define (choose-predicate-even-or-not num)
    (if (even? num)
        (lambda (x) (even? x))
        (lambda (x) (not (even? x)))))
  (define (nums-that-satisfy-predicate predicate? all-nums)
      (cond ((null? all-nums) '()) 
        ((predicate? (car all-nums)) (cons (car all-nums) (nums-that-satisfy-predicate predicate? (cdr all-nums))))
        (else  (nums-that-satisfy-predicate predicate? (cdr all-nums)))))
  (nums-that-satisfy-predicate (choose-predicate-even-or-not num) (cons num numbers)))
   

                
                

(same-parity 2 3 4 5 6 7)