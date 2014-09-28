
(load "./util.scm")
(load "./2.41.scm")
(load "./t/testing.scm")

(define title "2.41")

(test-begin title)


    ; unique-trios
    (test-equal (list '(3 2 1)) (unique-trios 3))
    (test-equal (list '(3 2 1) '(4 2 1) '(4 3 1) '(4 3 2)) (unique-trios 4))

    ; trio-sum?
    (test-equal #t (trio-sum? (list 1 2 3) 6))
    (test-equal #f (trio-sum? (list 1 2 3) 5))

    ; find-trios-sum-list
    (test-equal (list '(4 3 1)) (find-trios-sum-list 4 8))

(test-end title)
