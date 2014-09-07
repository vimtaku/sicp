
(load "./2.17.scm")
(load "./t/testing.scm")

(define title "2.17")

(test-begin title)

    ;(display (last-pair (list)))
    ;(test-equal (list) (last-pair (list)))
    (test-equal (list 34) (last-pair (list 23 72 149 34)))
    (test-equal (list 149) (last-pair (list 23 72 149)))
    (test-equal (list 72) (last-pair (list 23 72)))
    (test-equal (list 23) (last-pair (list 23)))
    (test-equal (list) (last-pair (list)))

(test-end title)
