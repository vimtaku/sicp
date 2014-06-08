
; n < 3, f(n) = n
; n >= 3, f(n) = f(n-1) + 2*f(n-2) + 3 * f(n-3)

; n = 0, 0
; n = 1, 1
; n = 2, 2
; n = 3, f(3)= f(2) + 2*f(1) + 3*f(0) = 2 + 2*1 + 3*0 = 4
; n = 4, f(4)= f(3) + 2*f(2) + 3*f(1) = 4 + 2*2 + 3*1 = 11
; n = 5, f(5)= f(4) + 2*f(3) + 3*f(2) = 11 + 2*4 + 3*2 = 25
; n = 6, f(6)= f(5) + 2*f(4) + 3*f(3) = 25 + 2*11 + 3*4 = 59


(define (fib-iter a b c count)
 (if (<= count 2)
     a
     (fib-iter (+ a (* 2 b) (* 3 c) ) a b (- count 1))
 )
)

(define (fib n)
 (if (<= n 2) n (fib-iter 2 1 0 n))
)

(display (fib 2))






; ;--------------------
; ; n < 3, f(n) = n
; ; n >= 3, f(n) = f(n-1) + 2*f(n-2) + 3 * f(n-3)
;
; ; n = 0, 0
; ; n = 1, 1
; ; n = 2, 2
; ; n = 3, f(3)= f(2) + 2*f(1) + 3*f(0) = 2 + 2*1 + 3*0 = 4
; ; n = 4, f(4)= f(3) + 2*f(2) + 3*f(1) = 4 + 2*2 + 3*1 = 11
; ; n = 5, f(5)= f(4) + 2*f(3) + 3*f(2) = 11 + 2*4 + 3*2 = 25
; ; n = 6, f(6)= f(5) + 2*f(4) + 3*f(3) = 25 + 2*11 + 3*4 = 59
;
; ;#sum + 前のsum *2 + 前の前のsum*3が、次のsum
; ;(a + 2b + 3c)
;
; ; 反復的プロセス
; (define (f n)
;  (f-iter 2 1 0 0 n)
; )
;
; (define (f-iter a b c sum counter)
;  (cond ((<= counter 2)
;         (if (= sum 0)
;             counter
;             sum
;         )
;        )
;        (else (f-iter (+ a (* 2 b) (* 3 c)) a b  (+ a (* 2 b) (* 3 c)) (- counter 1) ))
;  )
; )
;
; (display (f 3))
;
; ; 再帰的プロセス
; ; (define (f n)
; ;  (define (_f n x)
; ;   (* x (f (- n x)))
; ;  )
; ;  (if (< n 3)
; ;      n
; ;      (+ (_f n 1) (_f n 2) (_f n 3))
; ;  )
; ; )
; ;
; ; (display (f 4))
;
