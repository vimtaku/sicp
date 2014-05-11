(define (triple x)
 (* x x x)
)

; (define (cubic_root x)
;  (sqrt-iter 1.0 1.0 x))
;
; (define (sqrt-iter previous guess x)
;  (if (my_display "good enough?" (good-enough? previous guess x)) guess
;     (sqrt-iter guess (my_display "improve guess is " (improve guess x)) x)
;  )
; )
;
