(load "./t/testing.scm")

(define title "2.54")

(test-begin title)

    (test-equal #t (equal? '(this is a list) '(this is a list)))
    (test-equal #f (equal? '(this is a list) '(this (is a) list)))

    (test-equal #t (equal? '(this (is a) list) '(this (is a) list)))
    (test-equal #t (equal? '(this (is (a)) list) '(this (is (a)) list)))

(test-end title)
