
(load "./2.19.scm")
(load "./t/testing.scm")

(define title "2.19")

(test-begin title)

    (test-equal 292 (cc 100 us-coins))
    (test-equal 292 (cc 100 (reverse us-coins)))
    (test-equal 104561 (cc 100 uk-coins))
    (test-equal 104561 (cc 100 (reverse uk-coins)))

(test-end title)
