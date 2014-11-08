
(load "./2.62.scm")
(load "./t/testing.scm")

(define title "2.62")

(test-begin title)

    ; 両方が空
    (test-equal '() (union-set '() '()))

    ; 片方が空1
    (test-equal '(1 2 3) (union-set '(1 2 3) '()))
    ; 片方が空2
    (test-equal '(1 2 3) (union-set '() '(1 2 3)))

    (test-equal '(1 2 3) (union-set '(1 2 3) '(1 2 3)))

    (test-equal '(1 2 3 4 5 6) (union-set '(1 2 3) '(4 5 6)))
    (test-equal '(1 2 3 4 5 6) (union-set '(4 5 6) '(1 2 3) ))

(test-end)
