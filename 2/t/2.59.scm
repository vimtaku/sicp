
(load "./2.59.scm")
(load "./t/testing.scm")

(define title "2.59")

(test-begin title)

; (display (intersection-set '(1 2 3) '(4 2)))
; (display (union-set '(1 2 3) '(4 2)))

    ; 両方が空
    (test-equal '() (union-set '() '()))

    ; 片方が空1
    (test-equal '(1 2 3) (union-set '(1 2 3) '()))
    ; 片方が空2
    (test-equal '(1 2 3) (union-set '() '(1 2 3)))

    ; すべて同じ要素
    (test-equal '(1 2 3) (union-set '(1 2 3) '(1 2 3)))

    ; それぞれ違う要素が入る
    (test-equal '(1 2 3 4 5 6) (union-set '(1 2 3) '(4 5 6)))

(test-end)
