
(load "./2.18.scm")
(load "./t/testing.scm")

(define title "2.18")

(test-begin title)

    (test-equal (list 25 16 9 4 1) (reverse (list 1 4 9 16 25)))
    (test-equal (list 25 16 9 4) (reverse (list 4 9 16 25)))
    (test-equal (list 25 16 9) (reverse (list 9 16 25)))
    (test-equal (list 25 16) (reverse (list 16 25)))
    (test-equal (list 25) (reverse (list 25)))
    (test-equal (list ) (reverse (list )))

(test-end title)
