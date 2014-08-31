

(define (width interval)
    (define (internal-sub a b)
      (if (> a b) (- a b)
                  (- b a)
      )
    )
  (define (half x) (/ x 2))
  (half (internal-sub (upper-bound interval) (lower-bound interval) ))
)



