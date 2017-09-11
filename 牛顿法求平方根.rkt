#lang racket

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
  ;(new-if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                  x)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (square x)
  (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-test num test-times)
  (begin (display (* num num))
    (newline)
    (display num)
    (newline)
    (display (sqrt (* num num)))
    (newline)
    (newline)
    (if (> test-times 0)
      (sqrt-test (* num num) (- test-times 1))
      num)))

; (sqrt (+ 100 37))

;(display (good-enough? 2.9 3))

;(square 2)

(sqrt-test 0.1 5)