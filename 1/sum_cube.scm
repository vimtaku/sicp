


(define (my_disp a)
 (display a)
 (newline)
)
(define (sum term a next b)
  (if (> a b)
      0
      (+ (my_disp (term a))
         (sum term (next a) next b))))

(define (cube x) (* x x x) )

(define (inc n) (+ n 1))

(define (sum-cubes a b)
  (sum cube a inc b))


;36
;(display (sum-cubes 1 3))
; 3025
;(display (sum-cubes 1 10))


(define (identity x) x)

(define (sum-integers a b)
  (sum identity a inc b))

;(display (sum-integers 1 10))


(define (pi-sum a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum pi-term a pi-next b)
)

;(display (* 8 (pi-sum 1 1000)))


; (define (sum term a next b)
;   (if (> a b)
;       0
;       (+ (term a)
;          (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

; (newline)
; (display (integral cube 0 1 0.01))
(newline)
(display (integral cube 0 1 0.001))
; (newline)
; (display (integral cube 0 1 0.000001))



