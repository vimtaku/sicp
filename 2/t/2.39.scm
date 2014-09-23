
(load "./2.36.scm")
(load "./2.38.scm")
(load "./2.39.scm")
(load "./t/testing.scm")

(define title "2.39")

(test-begin title)

    (display (reverse (list 1 2 3)))
    ;(test-equal (list 3 2 1) (reverse (list 1 2 3)))

(test-end title)
