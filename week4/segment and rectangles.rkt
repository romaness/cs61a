#lang simply-scheme

;implementation of rectangles (exerise 2.2)
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))


(define (make-point x y)
  (cons x y))

(define (x-point x)
  (car x))

(define (y-point y)
  (cdr y))

(define (make-segment start end)
  (cons start end))

(define (start-segment x)
  (car x))

(define (end-segment x)
  (cdr x))

(define (midpoint-segment x)
  (make-point (/ (+ (x-point (start-segment x)) (x-point (end-segment x))) 2)
        (/ (+ (y-point (start-segment x)) (y-point (end-segment x))) 2)))



(midpoint-segment (make-segment (make-point 3 2) (make-point 3 4))) 
   
;implementation of rectangles (exerise 2.3)
(define (make-rectangle segment-a segment-b)
  (cons segment-a segment-b))


(define (square x)
  (* x x))

(define (perimeter rectangle)
  (let ((length (segment-length (start-segment rectangle)))
        (width (segment-length (end-segment rectangle))))
  (* 2 (+ length width))))


(define (first-side rectangle)
  (car rectangle))

(define (second-side rectangle)
  (cdr rectangle))

(define (area rectangle)
  (let ((length (segment-length (first-side rectangle)))
        (width (segment-length (second-side rectangle))))
  (* length width)))

(define (segment-length segment)
  (let ((a (square (- (x-point (start-segment segment))
                        (x-point (end-segment segment)))))
        (b (square (- (y-point (start-segment segment))
                       (y-point (end-segment segment))))))
    (sqrt (+ a b))))

           




