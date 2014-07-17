
; (define (product term a next b)
;   (if (> a b)
;       1
;       (* (term a)
;          (product term (next a) next b)))
; )

;; 再帰的プロセス
; (define (accumulate combiner null-value term a next b)
;   (if (> a b)
;       null-value
;       (combiner (term a)
;          (accumulate combiner null-value term (next a) next b)
;       )
;   )
; )

;; 反復的プロセス
(define (accumulate combiner null-value term a next b)
    (define (iter a result)
         (if (> a b)
             result
             (iter (next a) (combiner result (term a)))
         )
    )
    (iter a null-value)
)

(define (sum term a next b)
  (define (_sum x y) (+ x y))
  (accumulate _sum 0 term a next b)
)
(define (product term a next b)
  (define (_multi x y) (* x y))
  (accumulate _multi 1 term a next b)
)

(define (cube x) (* x x x) )
(define (inc n) (+ n 1))
(define (sum-cubes a b)
  (sum cube a inc b))
(define (identity x) x)

;36
;(display (sum-cubes 1 3))
; 3025
;(display (sum-cubes 1 10))

(define (factorial n)
    (product identity 1 inc n)
)
(display (factorial 10))

