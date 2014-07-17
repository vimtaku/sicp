

(define (cube x) (* x x x) )
; (define (sum term a next b)
;   (if (> a b)
;       0
;       (+ (term a)
;          (sum term (next a) next b))))


(define (my_disp a)
 a
)

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (my_disp (term a))))
    )
  )
  (iter a 0)
)

(define (identity x) x)
(define (inc n) (+ n 1))
(define (sum-integers a b)
  (sum identity a inc b))

; (display (sum-integers 1 10))
; (newline)

(define (pi-sum a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum pi-term a pi-next b)
)

; (display (* 8 (pi-sum 1 1000)))
; (newline)

; なぜ違う.. きいてみよう
;3.139592655589783
;3.139592655589782


(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

;(display (integral cube 0 1 0.01))
; (newline)
;(display (integral cube 0 1 0.001))
(newline)
(display (integral cube 0 1 0.000001))


; 0.24998750000000042
; 0.249999875000001
; 0.2500000000014447
;
; 3.139592655589783
; 0.24998750000000042
; 0.249999875000001
; 0.2500000000014447
; 0.2500000000014414


