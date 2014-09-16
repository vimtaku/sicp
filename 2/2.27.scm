


;問題2.18の手続きreverseを修正し, 引数としてリストをとり, 要素を逆順にし, 更に部分木も奥まで逆順にする手続き deep-reverseを作れ. 例えば



; (define (reverse li)
;   (define (reverse-iter l rvsd)
;     (if (null? l)
;         rvsd
;         (reverse-iter (cdr l) (cons (car l) rvsd))
;     )
;   )
;
;   (reverse-iter li (list))
; )

(define (deep-reverse li)

  (define (reverse-iter l rvsd)
    (cond ((null? l) rvsd)
          ((not (pair? l)) l)
          (else (reverse-iter (cdr l) (cons (reverse-iter (car l) (list)) rvsd)))
    )
  )

  (reverse-iter li (list))
)


