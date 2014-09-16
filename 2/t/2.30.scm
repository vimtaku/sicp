
(load "./2.30.scm")
(load "./t/testing.scm")

(define title "2.30")

(test-begin title)


    (define li (list 1 (list 2 (list 3 4) 5) (list 6 7)))

    (test-equal (list 1 (list 4 (list 9 16) 25) (list 36 49)) (square-tree li))



(test-end title)
