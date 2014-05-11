
(define (square x)
 (* x x)
)

(define (sqrt x)
 (sqrt-iter 1.0 x))

(define (good-enough? guess x)
 (< (abs (- (square guess) x)) 0.001))

(define (average x y)
  (/ (+ x y) 2)
)

(define (improve guess x)
 (average guess (/ x guess) )
)

(define (sqrt-iter guess x)
 (if (good-enough? guess x) guess
     (sqrt-iter (improve guess x) x)
 )
)


;(display (sqrt 9) )
; #3.00009155413138

;(display (sqrt (+ 100 37) ))
;11.704699917758145

; (display (sqrt (+ (sqrt 2) (sqrt 3))))

(display (square (sqrt 1000)) )



