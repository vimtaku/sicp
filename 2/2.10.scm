
(define (f x y)
  (let ((a (+ 1 (* x y)))
        (b (- 1 y)))
    (+ (* x (square a))
       (* y b)
       (* a b))))


(define (div-interval x y)

  (let ( (check-division-zero
          (lambda (z)
           (if (<= z 0) (raise "division zero") z)
          ))
       )

      (mul-interval x
        (make-interval
          (/ 1.0 (check-division-zero (upper-bound y)))
          (/ 1.0 (check-division-zero (lower-bound y)))
        )
      )
  )

)

