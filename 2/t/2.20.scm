

(load "./2.20.scm")
(load "./t/testing.scm")

(define title "2.20")

(test-begin title)

    (test-equal (list 1 3 5 7) (same-parity 1 2 3 4 5 6 7))
    (test-equal (list 2 4 6) (same-parity 2 3 4 5 6 7))

(test-end title)
