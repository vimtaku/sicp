


(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))
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

(define (runtime)
  (use srfi-11)
  (let-values (((a b) (sys-gettimeofday)))
              (+ (* a 1000000) b)))

(define (square x)
 (* x x)
)

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 10)
      (report-prime (- (runtime) start-time))
      #f
  )
)

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time)
  #t
)



(define (search-for-primes n)
  (display " *** start ***")
  (search-for-primes-iter 0 n)
)

(define (search-for-primes-iter found n)
  (if (>= found 3)
      #t
      (cond ((timed-prime-test n)
             (search-for-primes-iter (+ 1 found) (+ n 1)))
             (else (search-for-primes-iter found (+ n 1)))
      )
  )
)


; 1000 以上の最も小さい3つの素数は, 1009, 1013, 1019
; 10000 以上の最も小さい3つの素数は, 10007, 10009, 10037
; 100000 以上の最も小さい3つの素数は100003, 100019, 100043
; 1000000 以上の最も小さい3つの素数は1000003, 1000033, 1000037

; (display (timed-prime-test 1009))
; (display (timed-prime-test 1013))
; (display (timed-prime-test 1019))
; ; 1009 *** 70#t
; ; 1013 *** 76#t
; ; 1019 *** 69#t

; (display (timed-prime-test 10007))
; (display (timed-prime-test 10009))
; (display (timed-prime-test 10037))
; 10007 *** 80#t
; 10009 *** 72#t
; 10037 *** 71#t

; (display (timed-prime-test 100003))
; (display (timed-prime-test 100019))
; (display (timed-prime-test 100043))
; 100003 *** 91#t
; 100019 *** 84#t
; 100043 *** 86#t


; (display (timed-prime-test 1000003))
; (display (timed-prime-test 1000033))
; (display (timed-prime-test 1000037))
; 1000003 *** 175#t
; 1000033 *** 152#t
; 1000037 *** 96#t
; 1000003 *** 116#t
; 1000033 *** 118#t
; 1000037 *** 107#t

; おおよそ log 10 = n  となるので、
; 1000 は 3, 1000_000 は6なので、倍程度と予想する
; 予想通りだった。

; (display (timed-prime-test 1000003))
; (display (timed-prime-test 1000000000039))







