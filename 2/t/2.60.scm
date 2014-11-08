
(load "./2.60.scm")
(load "./t/testing.scm")

(define title "2.60")

(test-begin title)


(test-begin "element-of-set?")

; set が空集合
    (test-equal #f (element-of-set? 1 '()))
; set に x が含まれる
    (test-equal #t (element-of-set? 1 '(1 2 3)))
; set に x が含まれない
    (test-equal #f (element-of-set? 0 '(1 2 3)))

; 重複あり
; set に x が含まれる
    (test-equal #t (element-of-set? 1 '(3 1 1 2 3)))
; set に x が含まれない
    (test-equal #f (element-of-set? 0 '(1 2 1 2 3)))

(test-end "element-of-set?")


(test-begin "adjoin-set")

; set が空集合
    (test-equal '(1) (adjoin-set 1 '()))
; set に x が含まれる(最適化出来そう)
    (test-equal '(1 1 2 3) (adjoin-set 1 '(1 2 3)))
; set に x が含まれない
    (test-equal '(0 1 2 3) (adjoin-set 0 '(1 2 3)))

(test-end "adjoin-set")


(test-begin "union-set")

    ; 両方が空
    (test-equal '() (union-set '() '()))

    ; 片方が空1
    (test-equal '(1 2 3) (union-set '(1 2 3) '()))
    ; 片方が空2
    (test-equal '(1 2 3) (union-set '() '(1 2 3)))

    ; すべて同じ要素(最適化出来そう)
    (test-equal '(1 2 3 1 2 3) (union-set '(1 2 3) '(1 2 3)))

    (test-equal '(1 2 3 4 5 6) (union-set '(1 2 3) '(4 5 6)))

(test-end "union-set")


(test-begin "intersection-set")

    ; 両方が空
    (test-equal '() (intersection-set '() '()))

    ; 片方が空1
    (test-equal '() (intersection-set '(1 2 3) '()))
    ; 片方が空2
    (test-equal '() (intersection-set '() '(1 2 3)))

    (test-equal '(1 2 3) (intersection-set '(1 2 3) '(1 2 3)))

    (test-equal '() (intersection-set '(1 2 3) '(4 5 6)))

(test-end "intersection-set")





(test-end)
