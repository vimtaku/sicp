
(load "./util.scm")
(load "./t/testing.scm")
(load "./2.4.scm")

(define title "2.4")

(test-begin title)


    (test-begin "car")

    (define x 2)
    (define y 3)

    ;; 最終的に引数の p q を引数にとり、 p を返すlambdaが渡るので
    ;; x y が渡されて x がかえる
    (test-equal x (car (cons x y)))

    (test-end "car")


    (test-begin "cdr")

    (test-equal y (cdr (cons x y)))

    (test-end "cdr")

(test-end title)
