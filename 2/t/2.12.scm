
(load "./util.scm")
(load "./2.7.scm")
(load "./2.12.scm")
(load "./t/testing.scm")

(define title "2.12")

(test-begin title)
    (define sample-interval (make-interval 10 20))

    (test-equal (make-interval 0 30)
         (make-center-percent (center sample-interval) 100)
    )

    (test-equal (make-interval (- 15 1.5) (+ 15 1.5))
         (make-center-percent (center sample-interval) 10.0)
    )

    (test-equal (make-interval (- 15 0.15) (+ 15 0.15))
         (make-center-percent (center sample-interval) 1.0)
    )

    ; 1％
    ;(display (percent (make-interval (- 15 0.15) (+ 15 0.15))))
    (test-equal 1.0
        (floor (percent (make-interval (- 15 0.15) (+ 15 0.15))))
    )

    ;10%
    ;(display (percent (make-interval (- 15 0.15) (+ 15 0.15))))
    (test-equal 10.0
        (floor (percent (make-interval (- 15 1.5) (+ 15 1.5))))
    )

    ;100%
    (test-equal 100
        (percent (make-interval (- 15 15) (+ 15 15)))
    )


(test-end title)
