
(load "./util.scm")
(load "./2.2.scm")
(load "./t/testing.scm")

(define title "2.2.senbun")

(test-begin title)

    (test-begin "make-point")
    (test-equal (cons 1 1) (make-point 1 1))
    (test-end "make-point")

    (define x 0)
    (define y 0)
    (define sample-point (make-point x y))

    (define x2 10)
    (define y2 10)
    (define sample-point2 (make-point x2 y2))

    (define sample-point-mid (make-point 5 5))

    (test-begin "x-point")
    (test-equal x (x-point sample-point))
    (test-end "x-point")

    (test-begin "y-point")
    (test-equal y (y-point sample-point))
    (test-end "y-point")

    (define (sample-segment) (cons sample-point sample-point2))

    (test-begin "make-segment")
    (test-assert (make-segment sample-point sample-point2))
    (test-equal (sample-segment) (make-segment sample-point sample-point2))
    (test-end "make-segment")

    (test-begin "start-segment")
    (test-equal sample-point (start-segment (sample-segment)))
    (test-end "start-segment")

    (test-begin "end-segment")
    (test-equal sample-point2 (end-segment (sample-segment)))
    (test-end "end-segment")

    (test-begin "midpoint-segment")
    (test-equal sample-point-mid (midpoint-segment (sample-segment)))
    (test-end "midpoint-segment")

(test-end title)

