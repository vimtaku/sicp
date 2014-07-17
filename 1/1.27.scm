
(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1))))
)

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))

(define (check_carmichael n)
  (cond ((n >= 100000000) #t)
        ( (check_carmichael n)
  )
)


