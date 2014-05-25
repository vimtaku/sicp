
(define (square x)
 (* x x)
)
(define (triple x)
 (* (square x) x)
)

(define (good-enough? guess x)
 (cond ((= (improve_cubic guess x) guess) #t)
       (else #f)
 )
)

(define (double x)
 (* 2 x)
)

(define (improve_cubic guess x)
 (/ (+ (/ x (square guess)) (double guess)) 3)
)

(define (cubic_root guess x)
  (if (good-enough? guess x)
       guess
      (cubic_root (improve_cubic guess x) x)
  )
)

(define (cbrt x)
 (cubic_root 1.0 x)
)

;(display (cbrt 27))
(display (cbrt 64))
;(display (cbrt 128))

