(newline)

(define (make-accumulactor num)
  (lambda (a)
    (begin
      (set! num (+ num a))
        num)))

(define A (make-accumulactor 5))

(display (A 10))
(newline)

(display (A 10))
(newline)
