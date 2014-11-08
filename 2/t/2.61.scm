

(load "./2.61.scm")
(load "./t/testing.scm")

(define title "2.61")

(test-begin title)


(test-begin "adjoin-set")

; set が空集合
    (test-equal '(1) (adjoin-set 1 '()))

    (test-equal '(1) (adjoin-set 1 '(1)))

    (test-equal '(1 2 3) (adjoin-set 1 '(1 2 3)))
    (test-equal '(0 1 2 3) (adjoin-set 0 '(1 2 3)))

    (test-equal '(1 2 3 4) (adjoin-set 3 '(1 2 4)))
    (test-equal '(1 2 3 4) (adjoin-set 4 '(1 2 3)))

(test-end "adjoin-set")


(test-end)
