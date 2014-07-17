
(define (runtime)
  (use srfi-11)
  (let-values (((a b) (sys-gettimeofday)))
              (+ (* a 1000000) b)))

(define (square x)
 (* x x)
)
(define (divides? a b)
  (= (remainder b a) 0))


(define (next test-divisor)
  (if (= test-divisor 2)
      3
      (+ test-divisor 2)
  )
)

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))
        ;(else (find-divisor n (+ test-divisor 1)))
  )
)

(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))
      #f
  )
)

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time)
  #t
)




; 1000 以上の最も小さい3つの素数は, 1009, 1013, 1019
; 10000 以上の最も小さい3つの素数は, 10007, 10009, 10037
; 100000 以上の最も小さい3つの素数は100003, 100019, 100043
; 1000000 以上の最も小さい3つの素数は1000003, 1000033, 1000037
;

; (display (timed-prime-test 1009))
; (display (timed-prime-test 1013))
; (display (timed-prime-test 1019))
; 最適化前
; 1009 *** 15#t
; 1013 *** 8#t
; 1019 *** 7#t
; 最適化後
; 1009 *** 15#t
; 1013 *** 8#t
; 1019 *** 7#t

; (display (timed-prime-test 10007))
; (display (timed-prime-test 10009))
; (display (timed-prime-test 10037))
; 最適化前
; 10007 *** 35#t
; 10009 *** 39#t
; 10037 *** 33#t
; 最適化後
; 10007 *** 28#t
; 10009 *** 20#t
; 10037 *** 21#t

; (display (timed-prime-test 100003))
; (display (timed-prime-test 100019))
; (display (timed-prime-test 100043))
;最適化前
; 100003 *** 97#t
; 100019 *** 91#t
; 100043 *** 92#t
; 最適化後
; 100003 *** 82#t
; 100019 *** 59#t
; 100043 *** 59#t


(display (timed-prime-test 1000003))
; (display (timed-prime-test 1000033))
; (display (timed-prime-test 1000037))
; 最適化前
; 1000003 *** 294#t
; 1000033 *** 322#t
; 1000037 *** 287#t
; 1000003 *** 297#t
; 1000033 *** 289#t
; 1000037 *** 284#t
; 最適化後
; 1000003 *** 238#t
; 1000033 *** 228#t
; 1000037 *** 280#t
; 1000003 *** 211#t
; 1000033 *** 201#t
; 1000037 *** 183#t

; 大体 2/3 くらいになった。
; 偶数の処理がなくなったが、なくなった処理自体は
; (cond ((> (square test-divisor) n) n)
;       ((divides? test-divisor n) test-divisor)
; (devides の (= (remainder b a) 0))
; の 3ステップしかないので、もともと大きいステップがかかる処理ではなかったため。

; 推測するより計測
;




