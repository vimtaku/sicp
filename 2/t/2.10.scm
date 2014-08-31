
(load "./util.scm")
(load "./2.7.scm")
(load "./2.10.scm")
(load "./t/testing.scm")

(define title "2.10")

(test-begin title)

    (define sample-interval1 (make-interval -5 10))
    (define sample-interval2 (make-interval 10 20))
    (define sample-interval3 (make-interval 40 80))

    (display (div-interval sample-interval2 sample-interval1))
    ;(display (div-interval sample-interval2 sample-interval3))
    ;(display (div-interval 2 sample-interval3))


(test-end title)
