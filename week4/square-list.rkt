#lang simply-scheme

(define (square x)
  (* x x))
 (define (square-list items) 
   (define (iter things answer) 
     (if (null? things) 
         answer 
         (iter (cdr things) 
               (cons (square (car things)) answer  )))) 
   (iter items '()))



 
 (square-list (list 1 2 3 4))


;Because through cons each one of iterated list elements gets placed in the beginning of the list. Thus the first element that gets processed gets pushed towards the end of the list


;Why the second solution doesn’t work? The issue starts with the fact that each iteration a new list gets created and stored in the answer argument. Using this list as the first argument to cons and using a single element for the second argument results in a nested list.
;Where with the other way around we avoid the issue with the nested list but end up with a reversed list 
