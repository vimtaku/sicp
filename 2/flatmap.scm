
(define nil (list))
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))
  )
)

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))


; (display (flatmap (lambda (y) (map (lambda (x) (+ x 1)) y))
;           (list (list 1 2) (list 3 4))))

