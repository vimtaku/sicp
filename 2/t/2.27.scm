

(load "./2.27.scm")
(load "./t/testing.scm")

(define title "2.27")

(test-begin title)

    (define x (list (list 1 2) (list 3 4)))
    (define y (list (list 1 2 (list 5 6)) (list 3 4)))

;    (display (deep-reverse x))

    (test-equal (list (list 4 3) (list 2 1)) (deep-reverse x))

    (test-equal (list (list 4 3) (list (list 6 5) 2 1)) (deep-reverse y))

    ; (newline)
    ; (display (deep-reverse y))


(test-end title)
