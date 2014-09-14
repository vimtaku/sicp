

;引数としてリストをとり, 同じ要素の逆順のリストを返す手続き reverseを定義せよ:

(define (reverse li)
  (define (reverse-iter l rvsd)
    (if (null? (cdr l))
        (cons (car l) rvsd)
        (reverse-iter (cdr l) (cons (car l) rvsd))
    )
  )

  (if (null? li)
    (list)
    (reverse-iter li (list))
  )
)

;;; もっといい回答

(define (reverse li)
  (define (reverse-iter l rvsd)
    (if (null? l)
        rvsd
        (reverse-iter (cdr l) (cons (car l) rvsd))
    )
  )

  (reverse-iter li (list))
)

