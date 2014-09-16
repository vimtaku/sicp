

;引数として(リストとして表現されている)木をとり, その要素が, 木のすべての葉を, 左から右の順に並べたものであるリストを返す手続き fringeを書け. 例えば



(define (fringe li)

 (define (iter li prsv)
  (cond
    ((null? li) prsv)
    ((not (pair? li)) (cons li prsv))
    (else (append (iter (car li) prsv) (iter (cdr li) prsv)))
  )
 )

 (iter li (list))
)

; (define x (list (list 1 2) (list 3 4)))
;
; (fringe x)
; (1 2 3 4)
;
; (fringe (list x x))
; (1 2 3 4 1 2 3 4)


