
(load "./2.67")
(load "./2.68")
(load "./t/testing.scm")

(define title "2.68")

(test-begin title)

    (define sample-tree
      (make-code-tree (make-leaf 'A 4)
                      (make-code-tree
                       (make-leaf 'B 2)
                       (make-code-tree (make-leaf 'D 1)
                                       (make-leaf 'C 1)))))

    (define symbols '(A D A B B C A))

(display sample-tree)

    (test-begin "encode-symbol")
    (test-equal (encode-symbol 'A sample-tree) (list 0)     )
    (test-equal (encode-symbol 'B sample-tree) (list 1 0)   )
    (test-equal (encode-symbol 'C sample-tree) (list 1 1 1) )
    (test-equal (encode-symbol 'D sample-tree) (list 1 1 0) )
    (test-end "encode-symbol")

    (define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))
    (test-equal sample-message (encode symbols sample-tree))


(test-end title)
