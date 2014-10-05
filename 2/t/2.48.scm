
(load "./2.46.scm")
(load "./2.48.scm")
(load "./t/testing.scm")

(define title "2.48")

(test-begin title)

    (define start-vect (make-vect 0.0 0.0))
    (define end-vect (make-vect 0.1 0.2))

    (define segment (make-segment start-vect end-vect))

    (test-equal start-vect (start-segment segment))
    (test-equal end-vect (end-segment segment))

(test-end title)
