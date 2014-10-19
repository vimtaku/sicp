
(define border
  (let ((len 0.9))
      (segments->painter (list
        (make-segment (make-vect 0.0 0.0) (make-vect 0.0 len))
        (make-segment (make-vect 0.0 len) (make-vect len len))
        (make-segment (make-vect len len) (make-vect len 0.0))
        (make-segment (make-vect len 0.0) (make-vect 0.0 0.0))
        ))
  )
)

(define cross
  (let ((len 0.9))
      (segments->painter (list
        (make-segment (make-vect 0.0 0.0) (make-vect len len))
        (make-segment (make-vect 0.0 len) (make-vect len 0.0))
        ))
  )
)

(define diamond
  (let ((len 0.99)
        (half 0.50)
       )
      (segments->painter (list
        (make-segment (make-vect 0.01 half) (make-vect half len))
        (make-segment (make-vect half len) (make-vect len half))
        (make-segment (make-vect len half) (make-vect half 0.01))
        (make-segment (make-vect half 0.01) (make-vect 0.01 half))
        ))
  )
)

;copy and pasted
(define wave (segments->painter
(list
(make-segment (make-vect 0.00 0.65) (make-vect 0.15 0.40))
(make-segment (make-vect 0.15 0.40) (make-vect 0.30 0.60))
(make-segment (make-vect 0.30 0.60) (make-vect 0.35 0.55))
(make-segment (make-vect 0.35 0.55) (make-vect 0.25 0.00))
(make-segment (make-vect 0.40 0.00) (make-vect 0.50 0.30))
(make-segment (make-vect 0.50 0.30) (make-vect 0.60 0.00))
(make-segment (make-vect 0.75 0.00) (make-vect 0.60 0.50))
(make-segment (make-vect 0.60 0.50) (make-vect 1.00 0.15))
(make-segment (make-vect 1.00 0.35) (make-vect 0.75 0.65))
(make-segment (make-vect 0.75 0.65) (make-vect 0.60 0.65))
(make-segment (make-vect 0.60 0.65) (make-vect 0.65 0.85))
(make-segment (make-vect 0.65 0.85) (make-vect 0.60 1.00))
(make-segment (make-vect 0.40 1.00) (make-vect 0.35 0.85))
(make-segment (make-vect 0.35 0.85) (make-vect 0.40 0.65))
(make-segment (make-vect 0.40 0.65) (make-vect 0.30 0.65))
(make-segment (make-vect 0.30 0.65) (make-vect 0.15 0.60))
(make-segment (make-vect 0.15 0.60) (make-vect 0.00 0.85)))))

