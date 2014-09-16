
(load "./2.29.scm")
(load "./t/testing.scm")

(define title "2.29")

(test-begin title)

    (define b4 (make-branch 4 400))
    (define b3 (make-branch 2 200))
    (define m2 (make-mobile b3 b4))
    (define b2 (make-branch 3 m2))
    (define b1 (make-branch 4 100))
    (define m1 (make-mobile b1 b2))

    (test-equal b1 (left-branch m1))
    (test-equal b2 (right-branch m1))
    (test-equal b3 (left-branch m2))
    (test-equal b4 (right-branch m2))

    ;(display (right-branch m2) )

    (test-equal 4 (branch-length b1))
    (test-equal 3 (branch-length b2))
    (test-equal 2 (branch-length b3))
    (test-equal 4 (branch-length b4))

    (test-equal 100 (branch-structure b1))
    ;(test-equal 3 (branch-length b2))
    (test-equal 200 (branch-structure b3))
    (test-equal 400 (branch-structure b4))


    (display (total-weight m2))
    (test-equal 600 (total-weight m2))
    (test-equal 700 (total-weight m1))

    ;TODO write test both mobile



;     (display (total-weight m1))
;
    (define b4 (make-branch 1 100))
    (define b3 (make-branch 1 100))
    (define m2 (make-mobile b3 b4))
    (define b2 (make-branch 1 m2))
    (define b1 (make-branch 4 50))
    (define m1 (make-mobile b1 b2))


    (test-assert (spin-power-same? m1))
    (test-assert (spin-power-same? m2))

    (test-assert (balanced? m2))
    (test-assert (not (balanced? m1)))



    (define b6 (make-branch 5 100))
    (define b5 (make-branch 5 100))
    (define b4 (make-branch 5 100))
    (define b3 (make-branch 5 100))
    (define m3 (make-mobile b5 b6))
    (define b2 (make-branch 5 m3))
    (define b1 (make-branch 5 m2))
    (define m2 (make-mobile b3 b4))
    (define m1 (make-mobile b1 b2))

    (test-assert (balanced? m1))







(test-end title)
