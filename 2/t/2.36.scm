
(load "./util.scm")
(load "./2.36.scm")
(load "./t/testing.scm")

(define title "2.36")

(test-begin title)

    (define s (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))
    (test-equal (list 22 26 30) (accumulate-n + 0 s))


(test-end title)
