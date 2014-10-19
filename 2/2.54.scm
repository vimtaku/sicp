
(define (p x)
  (display x)
  (newline)
)

;考え方
;言われたとおりに書けば良い

(define (equal? f-list s-list)
  (cond ((and (not (pair? f-list)) (not (pair? s-list)) (eq? f-list s-list)) #t)
        ((and (equal? (car a) (car b)) (equal? (cdr a) (cdr b))) #t)
        (else #f)
  )
)

