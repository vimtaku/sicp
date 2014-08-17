
(load "./util.scm")
(load "./2.1.scm")
(load "./t/testing.scm")

(test-begin "rat-test")

(test-equal (cons 1 2) (make-rat 1 2))
(test-equal (cons -1 2) (make-rat -1 2))
(test-assert (cons -1 2) (make-rat 1 -2))
(test-assert (cons 1 2) (make-rat -1 -2))

(test-end "rat-test")

