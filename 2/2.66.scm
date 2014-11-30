
;レコードの集合がキーの数値で順序づけられている二進木で構造化されている場合のlookup手続きを実装せよ．

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (entry set)) true)
        ((< x (entry set))
         (element-of-set? x (left-branch set)))
        ((> x (entry set))
         (element-of-set? x (right-branch set)))))





(define tree1 (make-tree (list 7 "vimtaku")
                     (list 4 "tsutsumida")
                     (list 8 "tsutsumida"))
)


(display tree1)

