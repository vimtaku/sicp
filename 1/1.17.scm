

(define (double x)
 (* x 2)
)
(define (halve x)
 (/ x 2)
)
(define (even? n)
  (= (remainder n 2) 0))

(define (* a b)
  (cond ((= b 0) 0)
      ((even? b) (* (double a) (halve b)) )
      (else (+ a (* a (- b 1)))))
)

;(display (* 4 3))

; 3 * 4 = 3 + 3 + 3 + 3
;       = 6 * 2

