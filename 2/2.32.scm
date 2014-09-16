


; 問題 2.32
;
; 集合は相異る要素のリストで表現出来る. また, 集合のすべての部分集合の集合を, リストのリストで表現出来る. 例えば集合が(1 2 3)の時, すべての部分集合の集合は(() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))である. 集合の部分集合の集合を作り出す手続きの次の定義を完成し, なぜうまくいくか, 明快に説明せよ.


(define (subsets s)
  (if (null? s)
      (list (list))
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (sub)
                           ;(cons (car s) sub)
                           (append (list (car s)) sub)
                          )
                     rest)
        )
      )
  )
)


(display (subsets (list 1 2 3)))

; s (1 2 3), rest ()
; () に対して, ()に3 を map したものを append
; s (2 3), rest (() (3))
; ( () (3)) に対して、 ( () (3)) に 2 を map したものを append
; s (3), rest (() (3) (2) (2 3))
; (() (3) (2) (2 3)) に対して、 () に 1 を map したものを append
; s (), rest (() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))

