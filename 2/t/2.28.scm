
(load "./2.28.scm")
(load "./t/testing.scm")

(define title "2.28")

(test-begin title)

    (define x (list (list 1 2) (list 3 4)))
    (define y (list (list 1 2 (list 5 6)) (list 3 4)))

    (test-equal (list 1 2 3 4) (fringe x) )
    (test-equal (list 1 2 3 4 1 2 3 4) (fringe (list x x)) )
    (test-equal (list 1 2 5 6 3 4) (fringe y) )

(test-end title)
