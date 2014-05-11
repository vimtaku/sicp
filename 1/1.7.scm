(define (square x)
 (* x x)
)

(define (sqrt x)
 (sqrt-iter 1.0 1.0 x))

(define (good-enough? previous guess x)
 (cond ((= (- previous guess) 0) #f)
       ((< (abs (- previous guess)) 0.00001) #t)
       (else #f)
 )
)

(define (average x y)
  (/ (+ x y) 2)
)

(define (improve guess x)
 (average guess (/ x guess) )
)

(define (sqrt-iter previous guess x)
 (if (my_display "good enough?" (good-enough? previous guess x)) guess
    (sqrt-iter guess (my_display "improve guess is " (improve guess x)) x)
 )
)

(define (my_display y x)
;  (display y)
;  (display ":")
;  (display x)
;  (newline)
x)

;(display (sqrt 2) )
;(display (sqrt 90000000000000) )
;(display (sqrt 0.0001) )
(display (sqrt 0.000001) )



; gosh> (sqrt 90000000000000)
; 9486832.980505139


; 0.001
; 0.04124542607499115
;(gosh)0.03162277660168379

; 0.0001
; 0.03230844833048122
;(gosh)0.01

; 大きい数だった場合、 sqrt した結果が大きくなりすぎて
; 情報落ちしてしまい、収束しなくなっている
; 小さい数も同様




