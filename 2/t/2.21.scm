
(load "./2.21.scm")
(load "./t/testing.scm")

(define title "2.21")

(test-begin title)

    (test-equal (list 1 4 9 16) (square-list (list 1 2 3 4)))

(test-end title)
