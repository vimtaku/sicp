
(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))

(define (my_display x)
 (display x)
 (newline)
x)

(define (sine angle)
   (if (not (> (abs angle) 0.1))
       angle
       (my_display (p (sine (/ angle 3.0))))
   )
)


;(display (sine 12.15))
; 5回
;(display (sine 22.0))

;使用する記憶領域を
;5 -> 4
;20 -> 5
;50 -> 6
;60 -> 6
;180 -> 7
;360 -> 8
;
;
;log n














;;
