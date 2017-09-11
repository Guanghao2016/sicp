#lang racket

(define (multi a b)
  (m a b 0))

; n
; (define (m a b c)
;   (cond ((= b 1) (+ a c))
;     ((> b 0) (m a (- b 1) (+ a c)))))

; log n
(define (m a b c)
  (cond ((= b 1)  c)
        ((and (even? b) (> b 1))
          (m a (halve b) (+ (double a) c)))
        ((and (odd? b)(> b 1))
          (m a (- b 1) (+ a c)))))

(define (halve a)
  (/ a 2))

(define (double a)
  (+ a a))


(multi 4 3)