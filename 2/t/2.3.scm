
(load "./util.scm")
(load "./2.2.scm")
(load "./2.3.scm")
(load "./t/testing.scm")

(define title "2.3.rectangle")

(test-begin title)

    (define x 0)
    (define y 0)
    (define sample-point (make-point x y))

    (define x2 0)
    (define y2 10)
    (define sample-point2 (make-point x2 y2))

    (define x3 10)
    (define y3 0)
    (define sample-point3 (make-point x3 y3))

    (define sample-vertical-line (make-segment sample-point sample-point2))
    (define sample-horizontal-line (make-segment sample-point sample-point3))

    (define sample-rectangle
        (make-rectangle sample-vertical-line sample-horizontal-line)
    )

    (test-begin "make-rectangle")
    (test-assert (make-rectangle sample-vertical-line sample-horizontal-line))
    (test-equal sample-rectangle (make-rectangle sample-vertical-line sample-horizontal-line))
    (test-end "make-rectangle")


    (test-begin "height-segment")
    (test-equal y2 (height-segment sample-vertical-line) )
    (test-equal x2 (height-segment sample-horizontal-line) )
    (test-end "height-segment")


    (test-begin "width-segment")
    (test-equal y3 (width-segment sample-vertical-line) )
    (test-equal x3 (width-segment sample-horizontal-line) )
    (test-end "width-segment")

    (test-begin "height-rectangle")
    (test-assert 10 (height-rectangle sample-rectangle) )
    (test-end "height-rectangle")

    (test-begin "width-rectangle")
    (test-assert 10 (width-rectangle sample-rectangle) )
    (test-end "width-rectangle")

    (test-begin "perimeter")
    (test-assert 40 (perimeter sample-rectangle) )
    (test-end "perimeter")

    (test-begin "area")
    (test-assert 100 (area sample-rectangle) )
    (test-end "area")


(test-end title)
