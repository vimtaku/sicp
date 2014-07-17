
(define (square x)
 (* x x)
)

(define (smallest-divisor n)
  (find-divisor n 2))


(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))


(define (divides? a b)
  (= (remainder b a) 0))


(display (smallest-divisor 19999999))

; ;
; ;199
; (display (smallest-divisor 199))
; (newline)
; ;1999
; (display (smallest-divisor 1999))
; (newline)
; ;7
; (display (smallest-divisor 19999))
; (newline)

; ; 割りきれている
; (display (/ 19999 7))


