

(define (repeated f n)
  (define (iter f count result)
    (if (= count 1)
        result
        (iter f (- count 1) (compose f result))
    )
  )
  (iter f n f)
)

(define dx 0.00001)

(define (smooth f)
 (lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3))
)

(define (n-foldsmoothed n)
 (repeated smooth n)
)

(define (square x) (* x x))

;(display ((smooth (lambda (x) (* x x))) 1) )

;(display (((n-foldsmoothed 2) (lambda (x) (* x x))) 1) )
(display (((n-foldsmoothed 2) square) 2) )

;(display ((smooth 2) 2.0))



