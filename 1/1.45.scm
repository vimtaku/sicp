

(define (average x) (/ (+ x x) 2))

(define (average-damp f)
  (lambda (x) (average x (f x)))
)



;(display (log 64 2))
;(display (floor 5.2))



(display (/ 3 -4))



