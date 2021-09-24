#lang simply-scheme
(define (make-time hr mn cat) (list hr mn cat))
(define hour car)
(define minute cadr)
(define category caddr)


(define (time-print-form time)
  (if (= (count (minute time)) 1)
      (word (hour time) ': '0 (minute time) (category time))
      (word (hour time) ': (minute time) (category time))))


(define (24-hour time)
  (word (+ (hour time) 12) (minute time)))



(24-hour (make-time 3 47 'pm))
(time-print-form (make-time 12 11 'pm))


(define (make-time-new hr mn cat)
  (if (equal? cat 'am)
      (+ (* hr 100) mn)
      (+ (* (+ hr 12) 100) mn)))


(define (minute-new time)
  (remainder time 100))


(define (hour-new time)
  (quotient time 100))


(define (category-new time)
  (if (>= time 1200)
      'pm
      'am))

