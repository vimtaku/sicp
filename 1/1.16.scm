

(define (square x)
 (* x x)
)

(define (even? n)
  (= (remainder n 2) 0))

(define (expt_iter a b n)
  (cond ((= n 0) a)
        ((even? n) (expt_iter a (square b) (/ n 2)))
        (else (expt_iter (* a b) b (- n 1)))
  )
)

(define (expt b n)
  (expt_iter 1 b n)
)

(display (expt 10 2))


;(display (map (lambda (x) (expt 10 x)) (iota 5) ))



; (define (square x)
;  (* x x)
; )
;
; (define (fast-expt a b n)
;   (cond ((= n 1) a)
;         ((and (even? n) (>= n 2)) (fast-expt (* a b) b (/ n 2)))
;         (else (fast-expt (* a b) b (- n 1)))
;   )
; )
;
; (define (even? n)
;   (= (remainder n 2) 0))
;
; (define (expt b n)
;   (fast-expt 1 b n)
; )
;
; (display (expt 10 2))
;
