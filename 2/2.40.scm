
;与えられた整数nに対し, 1 ≤ j < i ≤ nの対(i, j)の並びを生成する手続き unique-pairsを定義せよ. unique-pairsを使って, 上のprime-sum-pairsの定義を簡単にせよ. 




(load "./nestmap.scm")

(define (unique-pairs n)
 (flatmap
     (lambda (i)
       (map (lambda (j) (list i j))
            (enumerate-interval 1 (- i 1))))
     (enumerate-interval 1 n)
 )
)

(define (prime-sum-pairs n)
  (map make-pair-sum
    (filter prime-sum? (unique-pairs n))
  )
)

;(display (unique-pairs 3))
(display (prime-sum-pairs 6))


