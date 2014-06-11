
(define (expt b n)
 (if (= n 0)
     1
     (* b (expt b (- n 1)))
 )
)
;(display (expt 10 3))


(define (expt_iter total b n)
  (if (= n 0)
      total
      (expt_iter (* total b) b (- n 1))
  )
)

(define (expt b n)
  (expt_iter 1 b n)
)

(display (expt 10 2))



; (define (fast-expt b n)
;   (cond ((= n 0) 1)
;         ((even? n) (square (fast-expt b (/ n 2))))
;         (else (* b (fast-expt b (- n 1))))))
;
; (define (even? n)
;   (= (remainder n 2) 0))
;
; (display (expt 10 394182))


