
(load "./2.65")
(load "./t/testing.scm")

(define title "2.65")

(test-begin title)

    ; 空集合 空集合

    ; 片方が空集合

    ; 同じ要素のみ

    ; 同じ要素なし


    (define set1 (list->tree (list 1 2 3 4 5)))
    (define set2 (list->tree (list 3 4 5)))

    (display (union-set set1 set2))




(test-end title)
