
(load "./util.scm")
(load "./2.7.scm")
(load "./t/testing.scm")

(define title "2.7")


(test-begin title)

    (define sample-interval (make-interval 2 5))
    (define sample-inverse-interval (make-interval 5 2))

    (test-begin "upper-bound")
    (test-equal (upper-bound sample-interval) 5)
    (test-equal (upper-bound sample-inverse-interval) 5)
    (test-end "upper-bound")

    (test-begin "lower-bound")
    (test-equal (lower-bound sample-interval) 2)
    (test-equal (lower-bound sample-inverse-interval) 2)
    (test-end "lower-bound")


(test-end title)
