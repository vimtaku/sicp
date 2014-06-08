

    ;       1 1 = 1
    ;    2 1 = 1    2 2 = 1
    ; 3 1 = 1,  3 2 = 2, 3 3 = 1
; 4 1 = 1, 4 2 = 3, 4 3 = 3, 4 4 = 1


(define (pascal_triangle n w)
 (define (decr x) (- x 1))
 (cond ((= w 1) 1)
       ((= (- n w) 0) 1)
       (else
           (+ (pascal_triangle (decr n) (decr w))
              (pascal_triangle (decr n) w)
           )
       )
 )
)

;(display (pascal_triangle 1 1))
;(display (pascal_triangle 3 2))
;(display (pascal_triangle 4 1))
; (display (pascal_triangle 4 2)) ; 3
;(display (pascal_triangle 4 3)) ; 3
;(display (pascal_triangle 4 4)) ; 1
(display (pascal_triangle 5 3)) ; 6



; (define (pascal n)
;   (pascal n) + (pascal n)
; )
;
; (define (pascal-iter count)
;   (if (= 1 count) )
;
; )
;
;
;
