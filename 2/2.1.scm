

(define (minus x) (- 0 (abs x)))

(define (make-rat n d)
  (cond ((or (and (positive? n) (positive? d))
             (and (negative? n) (negative? d))
         ) (cons (abs n) (abs d)))
        ((or (negative? n) (negative? d)) (cons (minus n) (abs d)))
  )
)
