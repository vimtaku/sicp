




(define (minus x) (- 0 (abs x)))

(define (height-segment s)
 (abs (- (y-point (start-segment s)) (y-point (end-segment s)) ))
)
(define (width-segment s)
 (abs (- (x-point (start-segment s)) (x-point (end-segment s)) ))
)


(define (make-rectangle ab bc) (cons ab bc))
(define (height-rectangle rect) (height-segment (car rect)))
(define (width-rectangle rect) (width-segment (cdr rect)))

(define (twice x) (* 2 x))
(define (perimeter r)
    (+ (twice (height-rectangle r))
       (twice (width-rectangle r))
    )
)

(define (area r)
    (* (height-rectangle r) (width-rectangle r))
)

