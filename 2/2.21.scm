
;ここにsquare-listの二つの定義がある. 欠けている式を補い, それぞれを完成せよ:

(define (square x) (* x x))

(define (square-list items)
  (if (null? items)
      '()
      (cons (square (car items)) (square-list (cdr items)))
  )
)

(define (square-list items)
  (map square items)
)

