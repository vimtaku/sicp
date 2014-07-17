
;a

; 再帰的
; (define (product term a next b)
;   (if (> a b)
;       1
;       (* (term a)
;          (product term (next a) next b)))
; )


(define (runtime)
  (use srfi-11)
  (let-values (((a b) (sys-gettimeofday)))
              (+ (* a 1000000) b)))

(define (timed_exec f n)
  (let ((start_time (runtime)))
   (display "**start**")
   (newline)
   (display (f n))
   (newline)
   (display "**end**")
   (newline)
   (display (- (runtime) start_time))
  )
)


; 反復的
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))
    )
  )
  (iter a 1)
)


(define (identity x) x)
(define (inc n) (+ n 1))

(define (factorial n)
    (product identity 1 inc n)
)

;3628800
;(display (factorial 10))

(define (bunbo x)
(+ (* 2 (+ 1 (floor (/ x 2.0)))) 1)
)
(define (bunsi x)
 (if (= x 0)
     2
     (if (even? x)
         (- (bunbo x) 1)
         (+ (bunbo x) 1)
     )
 )
)
(define (bunsi2 x y)
 (if (= x 0)
     2
     (if (even? x)
         (- y 1)
         (+ y 1)
     )
 )
)

(define (pi-mul n)
  (define (pi-term k)
    ;(exact->inexact (/ (bunsi k) (bunbo k)))
    (let ((_bunbo (bunbo k)))
        (exact->inexact (/ (bunsi2 k _bunbo) _bunbo))
    )
  )
  (* 4 (product pi-term 0 inc n))
)

(timed_exec pi-mul 1000000)


