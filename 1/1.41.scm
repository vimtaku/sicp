


(define (inc x) (+ x 1))
(define (double f)
 (lambda (x) (f (f x) ))
)

(define (square x) (* x x))

;(display ((double inc) 4))

;(display ((double square) 3))


;; 21
(display (((double (double double)) inc) 5) )

