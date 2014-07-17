
(define (square x) (* x x))
(define (expmod2 base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

; (define (expmod base exp m)
;   (cond ((= exp 0) 1)
;         (remainder (* base (expmod base (- exp 1) m))
;                     m)
;         ))


(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

(define (check_exp base exp m to count)
 (if (>= count to)
     #t
     (if (= (expmod base exp m) (expmod2 base exp m))
      (check_exp base exp m to (+ count 1))
      count
     )
 )
)


; 予想通り等しい。


(define (random n)
 (+ (remainder (sys-random) n) 1)
)

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))

; 変化がないので使えると予想したが、結果は同じだった
; よって素数高速テストでも使える
; (display (fast-prime? 7 3))
; (display (fast-prime? 19 3))
; (display (fast-prime? 23 3))


(display (fast-prime? 101 3))
; (display (fast-prime? 19 3))
; (display (fast-prime? 23 3))


; (display (fermat-test 7))
; (display (fermat-test 19))
; (display (fermat-test 23))






