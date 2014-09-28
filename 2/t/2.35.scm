
(load "./util.scm")
(load "./2.35.scm")
(load "./t/testing.scm")

(define title "2.35")

(test-begin title)


    (define tree (list 1 2 (list 3 4 (list 8 9) ) (list 5 6) 7))
    (display (map enumerate-tree tree))
    (test-equal 9 (count-leaves tree))

    (define tree (list 1))
    (test-equal 1 (count-leaves tree))

    (define tree (list))
    (test-equal 0 (count-leaves tree))

    (define tree (list 1 2 9 (list 3 4 8) (list) (list 10 5 6) 7))
    (test-equal 10 (count-leaves tree))


(test-end title)
