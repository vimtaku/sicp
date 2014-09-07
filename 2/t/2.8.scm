
(load "./util.scm")
(load "./2.7.scm")
(load "./2.8.scm")
(load "./t/testing.scm")

(define title "2.8")

(test-begin title)

    (define sample-interval (make-interval 2 5))
    (define sample-inverse-interval (make-interval 5 2))

    (define sample-interval2 (make-interval 10 20))
    (define sample-interval3 (make-interval 40 80))


    (test-begin "sub-interval")

    (display (sub-interval sample-interval2 sample-interval3 ))

    ;(test-equal (make-interval 70 20) (sub-interval sample-interval2 sample-interval3 ))

    (test-end "sub-interval")

(test-end title)
