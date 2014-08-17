



(define (make-point x y) (cons x y))

(define (x-point s) (car s))
(define (y-point s) (cdr s))

(define (midpoint-segment s)
    (define (average2 a b) (/ (+ a b) 2))
    (define (mid-point-num s point)
        (average2 (point (start-segment s)) (point (end-segment s)))
    )
    (make-point (mid-point-num s x-point) (mid-point-num s y-point))
)

(define (make-segment ps pe) (cons ps pe))
(define (start-segment s) (car s))
(define (end-segment s) (cdr s))


(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

