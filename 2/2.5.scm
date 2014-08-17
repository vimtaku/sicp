

(define (cons a b)
 (* (expt 2 a) (expt 3 b))
)

(define (pair z base)
  (define (iter z n)
    (if (= (remainder z base) 0)
        (iter (/ z base) (+ n 1))
        n))
  (iter z 0)
)

(define (car x)
  (pair x 2)
)
(define (cdr x)
  (pair x 3)
)

(display (cdr (cons 2 8)))

