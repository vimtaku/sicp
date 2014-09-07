(define (last-pair li)
  (define (last-pair-iter l)
    (if (null? (cdr l))
      (list (car l))
      (last-pair-iter (cdr l))
    )
  )
  (if (null? li)
    (list)
    (last-pair-iter li)
  )
)
