
(define (square x)
 (* x x)
)
(define (triple x)
 (* (square x) x)
)

(define (good-enough? previous guess x)
 (cond ((= (- previous guess) 0) #f)
       ((< (abs (- previous guess) ) 0.00001) #t)
       (else #f)
 )
)

(define (double x)
 (* 2 x)
)

(define (improve_cubic guess x)
 (/ (+ (/ x (square guess)) (double guess)) 3)
)

(define (cubic_root previous guess x)
  (if (good-enough? previous guess x) guess
    (cubic_root guess (improve_cubic guess x) x)
  )
)

(define (cbrt x)
 (cubic_root 1.0 1.0 x)
)

(display (cbrt 27))
(display (cbrt 128))

