(newline)

(define (log a)
  (display ""))


(define (call-the-cops a)
  (display "报警")
  (newline))

(define (make-account balance password)
  (define p password)
  (define errornum 0)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
                (display (string-append "取出" (number->string balance)))
                balance)
          "Insufficient funds"))

  (define (deposit amount)
    (set! balance (+ balance amount))
      balance)

  (define (dispatch password m)
    (if (eq? password p)
      (begin
        (set! errornum 0)
        (cond ((eq? m 'withdraw) withdraw)
              ((eq? m 'deposit) deposit)
              (else (error "Unknown request -- MAKE-ACCOUNT"
                            m))))
      (begin

        (display "Incorrect password")
        (newline)

        (set! errornum (+ errornum 1))

        (display (string-append "errornum: " (number->string errornum)))
        (newline)

        (if (>= errornum 7)
          call-the-cops
          log))))

  dispatch)

(define acc (make-account 100 '12345))

((acc 123455 'withdraw) 50)
((acc 123455 'withdraw) 50)
((acc 123455 'withdraw) 50)
((acc 123455 'withdraw) 50)
((acc 123455 'withdraw) 50)
((acc 123455 'withdraw) 50)
((acc 123455 'withdraw) 50)
((acc 123455 'withdraw) 50)
((acc 123455 'withdraw) 50)
((acc 123455 'withdraw) 50)
((acc 123455 'withdraw) 50)

; ((acc 123456 'deposit) 40)

