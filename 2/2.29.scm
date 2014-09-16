


(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))


(define (make-mobile left right)
  (cons left right))

(define (make-branch length structure)
  (cons length structure))

;a. これに対応する選択子(モービルの枝を返す)left-branchと right-branchと, (枝の部品を返す)branch-lengthと branch-structureを書け.

;a
(define (left-branch mobile)
 (car mobile)
)
(define (right-branch mobile)
 ;(car (cdr mobile))
 ; d
 (cdr mobile)
)

(define (branch-length branch)
 (car branch)
)
(define (branch-structure branch)
 ;(car (cdr branch))
 ;d
 (cdr branch)
)


;b. この選択子を使い, モービルの全重量を返す手続きtotal-weightを定義せよ.

  (define (branch? b)
    (and (pair? b) (number? (branch-structure b)))
  )

(define (total-weight m)

 (define (iter m)
  (cond ((and (branch? (left-branch m)) (branch? (right-branch m)))
         (+ (branch-structure (left-branch m)) (branch-structure (right-branch m)))
        )
        ( (and (not (branch? (left-branch m))) (not (branch? (right-branch m))))
         (+ (iter (branch-structure (left-branch m))) (iter (branch-structure (right-branch m))))
        )
        ; 右側はモービル
        ((branch? (left-branch m))
         (+ (branch-structure (left-branch m)) (iter (branch-structure (right-branch m))))
        )
        (else
         (+ (branch-structure (right-branch m)) (iter (branch-structure (left-branch m))))
        )
  )
 )

 (iter m)
)



;c. モービルは最上段左の枝による回転力と, 最上段右の枝による回転力が等しく, (つまり左の棒の長さと棒の左にかかっている重さを掛けたものが右側の対応する積に等しく,) しかも枝にぶら下っている部分モービルのそれぞれが釣合っている時, 釣合っている(balanced)という. 二進モービルが釣合っているかどうかをテストする述語を設計せよ.


(define (inner-branch-weight m f)
  (if (branch? (f m))
               (branch-structure (f m))
               (total-weight (branch-structure (f m)))
  )
)

(define (left-branch-weight m)
  (inner-branch-weight m left-branch)
)
(define (right-branch-weight m)
  (inner-branch-weight m right-branch)
)

(define (spin-power-same? m)
 (= (* (branch-length (left-branch m)) (left-branch-weight m))
    (* (branch-length (right-branch m)) (right-branch-weight m))
 )
)



; 部分木の重さが全て等しいかチェック
(define (balanced? m)

 (define (iter m)
  (cond ((and (branch? (left-branch m)) (branch? (right-branch m)))
         (= (branch-structure (left-branch m)) (branch-structure (right-branch m)))
        )
        ; 両方モービル
        ( (and (not (branch? (left-branch m))) (not (branch? (right-branch m))))
          (and (iter (branch-structure (left-branch m)))
               (iter (branch-structure (right-branch m)))
          )
        )
        ; 右側はモービル
        ((branch? (left-branch m))
         (= (branch-structure (left-branch m))
            (right-branch-weight m)
         )
        )
        (else
         (= (branch-structure (right-branch m))
            (left-branch-weight m)
         )
        )
  )
 )

 (and (iter m) (spin-power-same? m))
)



; d. right branch の (car (cdr を (cdr にするだけ!


