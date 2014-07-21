
(define (fizzbuzz x y)
  (cond
   ((= (remainder x 15) 0) (display "FizzBuzz"))
   ((= (remainder x 5) 0) (display "Buzz"))
   ((= (remainder x 3) 0) (display "Fizz"))
   (else (display x))
  )
  (newline)
  (if (>= x y)
    #t
    (fizzbuzz (+ x 1) y)
  )
)

(fizzbuzz 1 10000)

