











; (define (fib n)
;  (cond
;   ((= n 0) 0)
;   ((= n 1) 1)
;   (else (+ (fib (- n 1)) (fib (- n 2) ) ))
;  )
; )
;
; (define (expo x n)
;  (expo-iter x 1.0 n)
; )
;
; (define (expo-iter x sum count)
;     (cond ((= count 0) sum)
;           (else (expo-iter x (* sum x) (- count 1)))
;     )
; )
;
; (define (nearest? x integer)
;  (= (floor->exact (round x)) integer)
; )
;
; (define (lo)
;   (/ (+ 1 (sqrt 5)) 2)
; )
;
; (define (T n)
;  (/ (expo (lo) n) (sqrt 5))
; )
;
; ; 最も近い整数をTとする
; ; (display (T 4))
; ; (display (fib 4))
;
; (define (test n)
;   (nearest? (T n) (fib n))
; )
;
; (display (test 12))





