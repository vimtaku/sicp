
(define (make-segment o-s-vec s-e-vec)
  (cons o-s-vec s-e-vec)
)

(define (start-segment segment)
  (car segment)
)
(define (end-segment segment)
  (cdr segment)
)
