(newline)

(define (make-monitored f)
  (begin
    (define count 0)
    (lambda (m)
      (cond ((eq? m 'how-many-calls?) count)
            ((eq? m 'reset-count)
              (set! count 0))
            (else (begin
                    (set! count (+ count 1))
                    (f m)
                  )
            )
      )
    )
  )
)

(define s (make-monitored sqrt))
;(display s)

(display (s 100))
(newline)

(display (s 81))
(newline)

(display (s 'how-many-calls?))

(s 'reset-count)
(newline)

(display (s 'how-many-calls?))
