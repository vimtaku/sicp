



(define (cube x) (* x x x) )


(define (even? x)
  (if (= (remainder x 2) 0)
   #t
   #f
  )
)


(define (E k n)
    (cond ((or (= k 0) (= k n)) 1)
          ((even? k) 2)
          (else 4)
    )
)

(define (sum term a next b k n)
  (if (> a b)
      0
      (+ (* (E k n) (term a))
         (sum term (next a) next b (+ k 1) n)
      )
  )
)

(define (integral-simpson f a b n)
  (define (multi-k k) (+ k (/ (- b a) n)))
  (* (/ (multi-k 0) 3.0)
   (sum f a multi-k b 0 n)
  )
)

(display (integral-simpson cube 0 1 100) )
(newline)
(display (integral-simpson cube 0 1 1000) )
(newline)
(display (integral-simpson cube 0 1 1000000) )
;両方共 0.25 となった。
;integral と比べてはっきりと割りきれている
; 最後のやつは 0.24999999999999997
; となった。


