
(define (double x)
 (* x 2)
)
(define (halve x)
 (/ x 2)
)
(define (even? n)
  (= (remainder n 2) 0))

(define (multiply_iter a b total)
  (cond ((= b 0) total)
      ((even? b) (multiply_iter (double a) (halve b) total) )
      (else (multiply_iter a (- b 1) (+ total a)) )
  )
)

; 3 * 14 = 3 + 3 + 3 + 3 + 3...
;        = 6 * 7
;        = (6 * 6) + 6
;        = (12 * 3) + 6
;        = (12 * 2) + 18
;        = (24 * 1) + 18
;


(define (* a b)
 (multiply_iter a b 0)
)

(display (* 4 32898))


