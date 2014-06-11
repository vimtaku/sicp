
(define (square x)
 (* x x)
)

(define (fast-expt a b n)
  (cond ((= n 1) a)
        ((and (even? n) (>= n 2)) (fast-expt (* a (square b)) b (/ n 2)))
        (else (fast-expt (* a b) b (- n 1)))
  )
)

(define (even? n)
  (= (remainder n 2) 0))

(define (expt b n)
  (fast-expt 1 b n)
)

(display (expt 10 6))

