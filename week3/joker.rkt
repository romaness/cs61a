#lang simply-scheme
(require berkeley)
(require racket/trace)


(define (twenty-one strategy)
  (define (play-dealer customer-hand dealer-hand-so-far rest-of-deck)
    (cond ((> (best-total dealer-hand-so-far) 21) 1)
	  ((< (best-total dealer-hand-so-far) 17)
	   (play-dealer customer-hand
			(se dealer-hand-so-far (first rest-of-deck))
			(bf rest-of-deck)))
	  ((< (best-total customer-hand) (best-total dealer-hand-so-far)) -1)
	  ((= (best-total customer-hand) (best-total dealer-hand-so-far)) 0)
	  (else 1)))

  (define (play-customer customer-hand-so-far dealer-up-card rest-of-deck)
    (cond ((> (best-total customer-hand-so-far) 21) -1)
	  ((strategy customer-hand-so-far dealer-up-card)
	   (play-customer (se customer-hand-so-far (first rest-of-deck))
			  dealer-up-card
			  (bf rest-of-deck)))
	  (else
	   (play-dealer customer-hand-so-far
			(se dealer-up-card (first rest-of-deck))
			(bf rest-of-deck)))))

  (let ((deck (make-deck)))
    (play-customer (se (first deck) (first (bf deck)))
		   (first (bf (bf deck)))
		   (bf (bf (bf deck))))) )

(define (make-ordered-deck)
  (define (make-joker s)
    (word (random 12) s))
  (define (make-suit s)
    (every (lambda (rank) (word rank s)) '(A 2 3 4 5 6 7 8 9 10 J Q K)) )
  (se (make-suit 'H) (make-suit 'S) (make-suit 'D) (make-suit 'C) (make-joker 'L) (make-joker 'L)))


(define (make-deck)
  (define (shuffle deck size)
    (define (move-card in out which)
      (if (= which 0)
	  (se (first in) (shuffle (se (bf in) out) (- size 1)))
	  (move-card (bf in) (se (first in) out) (- which 1)) ))
    (if (= size 0)
	deck
    	(move-card deck '() (random size)) ))
  (shuffle (make-ordered-deck) 54) )

(define (best-total cards)
  (let ((total (total-value-of-cards cards)))
  (if (> total 21)
      (- total 10)
      total)))

(define (total-value-of-cards cards)
    (if (empty? cards)
      0
  (+ (value-of-card (butlast (first cards)))
     (total-value-of-cards (bf cards)))))

(define (value-of-card card)
  (cond ((member? card '(1 2 3 4 5 6 7 8 9 10 11)) card)
        ((member? card '(J Q K)) 10)
        (else 11)))


(define (stop-at-17 customer-hand dealer-card)
  (< (best-total customer-hand) 17))

(define (stop-at n)
  (lambda (customer-hand dealer-card)
    (< (best-total customer-hand) n)))




(define (play-n strategy n)
  (define (iter b n result)
    (if (= b n)
        result 
    (iter (+ b 1) n (+ result (twenty-one strategy)))))
  (iter 0 n 0))



(define (dealer-sensitive customer-hand dealer-card)
  (cond ((and (< (best-total customer-hand) 17)
              (member? (butlast (first dealer-card)) '(7 8 9 10 J Q K A))) #t)
        ((or (member? (butlast (first dealer-card)) '(2 3 4 5 6))
             (< (best-total customer-hand) 12)) #t)
            (else #f)))

(define (valentine customer-hand dealer-card)
  ; could've used every instead
  (define (contains-card-type type customer-hand)
    (cond ((empty? customer-hand) #f)
          ((member? (last (first customer-hand)) type) #t)
          (else (contains-card-type type (bf customer-hand)))))
  (if (contains-card-type 'h customer-hand)
      (stop-at 19)
      (stop-at 17)))



(define (majority s1 s2 s3)
  (lambda (customer-hand dealer-card)
    (let ((a (s1 customer-hand dealer-card)))
    (let ((b (s2 customer-hand dealer-card)))
    (let ((c (s3 customer-hand dealer-card)))
    ((and (or a b) (or a c) (or b c))))))))




    

                                    
(valentine '(ad 8s 5h) '(8s))
  
(trace twenty-one)
(play-n stop-at-17 3)
(twenty-one (majority dealer-sensitive stop-at-17 (play-n stop-at-17 3)))
;(best-total '(1s 10s))
  

(define (best-total hand)
  (define (value rank)
    (cond ((number? rank) rank)
  ((equal? rank 'A) 11)
  (else 10)))
  (define (lower aces points)
    (cond ((<= points 21) points)
  ((= aces 0) points)
  (else (lower (- aces 1) (- points 10))) ))
  (define (total aces points hand)
    (if (empty? hand)
  (lower aces points)
  (let ((rank (bl (first hand))))
    (total (if (equal? rank 'A) (+ aces 1) aces)
           (+ points (value rank))
     (bf hand)) )))
  (total 0 0 hand))




