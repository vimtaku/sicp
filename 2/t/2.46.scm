
(load "./2.46.scm")
(load "./t/testing.scm")

(define title "2.46")

(test-begin title)

    (define x 1)
    (define y 2)
    (define vect (make-vect x y))
    (test-equal x (xcor-vect vect))
    (test-equal y (ycor-vect vect))

    (test-equal (make-vect (+ x x) (+ y y)) (add-vect vect vect))
    (test-equal (make-vect (- x x) (- y y)) (sub-vect vect vect))

    (define scalar 10)
    (test-equal (make-vect (* x scalar) (* y scalar))
                (scale-vect scalar vect)
    )

(test-end title)
