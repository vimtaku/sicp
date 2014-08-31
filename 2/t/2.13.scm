
(load "./util.scm")
(load "./2.7.scm")
(load "./2.12.scm")
(load "./t/testing.scm")

(define title "2.13")

(test-begin title)
    (define sample-interval (make-interval 10000.0 10010.0))
    (define sample-interval2 (make-interval 9000.0 9004.0))

    (define muled (mul-interval sample-interval sample-interval2))

    (display (percent sample-interval))
    (newline)
    (display (percent sample-interval2))
    (newline)
    (display (percent muled))


    (define sample-interval (make-interval 103000.0 103010.0))
    (define sample-interval2 (make-interval 800000.0 800034.0))

    (define muled (mul-interval sample-interval sample-interval2))

    (newline)

    (display (percent sample-interval))
    (newline)
    (display (percent sample-interval2))
    (newline)
    (display (percent muled))



    (define sample-interval (make-interval 803000.0 803010.0))
    (define sample-interval2 (make-interval 1800000.0 1800034.0))

    (define muled (mul-interval sample-interval sample-interval2))

    (newline)

    (display (percent sample-interval))
    (newline)
    (display (percent sample-interval2))
    (newline)
    (display (percent muled))


(test-end title)
