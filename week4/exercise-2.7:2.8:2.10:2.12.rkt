#lang simply-scheme
(define (make-interval a b) (cons a b))


(define (upper-bound interval) (car interval))

(define (lower-bound interval) (cdr interval))

(define (add-interval x y)
(make-interval (+ (lower-bound x) (lower-bound y))
               (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
  (add-interval x (make-interval (- (upper-bound y))
                                 (- (lower-bound y)))))

(define (mul-interval x y) (let ((p1 (* (lower-bound x) (lower-bound y)))
                                 (p2 (* (lower-bound x) (upper-bound y))) (p3 (* (upper-bound x) (lower-bound y))) (p4 (* (upper-bound x) (upper-bound y)))) (make-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4))))


;Exercises 2.7, 2.8, 2.10, 2.12
(define (div-interval x y)
  (if (and (<= (lower-bound y) 0)
      (>= (lower-bound y) 0))
      '(error "Can't divide by an interval that spans 0")
(mul-interval x (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y))))))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))


(define (make-center-percent center tolerance-percent)
  (let ((tolerance-value (* (/ center 100) tolerance-percent)))
    (make-interval (- center tolerance-value) (+ center tolerance-value))))


(define (percent i)
  (* 100 (/ (width i) (center i))))
  



(define a (make-interval 2 4))
(define b (make-interval 5 10))
(define c (make-interval 0 0))