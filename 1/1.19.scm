
(define (square x)
 (* x x)
)
(define (fib n)
  (fib-iter 1 0 0 1 n))

; (define (T a b p q)
;  ()
; )

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (square p) (square q))
                   (+ (* 2 p q) (square q))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))
; (display (fib 3))
; (fib-iter (+ 0 1 0) (+ 1 1) 0 1 2)
; (fib-iter 1 2 0 1 2)
; (fib-iter 1 2 0 1 1)

(display (fib 6))
; (fib-iter (+ 0 1 0) (+ 1 1) 0 1 4)
; (fib-iter 1 2 0 1 4)
; ##(fib-iter 1 2 1 2 2)
; ##(fib-iter 1 2 2 3 1)





