
(load "./2.24.scm")
(load "./t/testing.scm")

(define title "2.24")

(test-begin title)

    (define x (list 1 (list 2 (list 3 4))))

    (test-equal 1 (car x))
    (test-assert (not (pair? (car x))))

    (test-assert (pair? (car (cdr x))))
    (test-assert (null? (cdr (cdr x))))

    (test-equal 2 (car (car (cdr x))))
    (test-assert (not (pair? (car (car (cdr x))))))

    (test-assert (pair? (cdr (car (cdr x)))))
    (test-assert (null? (cdr (cdr (car (cdr x))))))

    (test-equal 3 (car (car (cdr (car (cdr x))))))
    (test-assert (not (pair? (car (car (cdr (car (cdr x))))))))

    (test-assert (pair? (cdr (car (cdr (car (cdr x)))))))
    (test-equal 4 (car (cdr (car (cdr (car (cdr x)))))))
    (test-assert (null? (cdr (cdr (car (cdr (car (cdr x))))))))




(test-end title)
