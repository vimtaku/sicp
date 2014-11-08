
(load "./2.63.scm")
(load "./t/testing.scm")

(define title "2.63")

(test-begin title)


    (define tree1 (make-tree 7
                             (make-tree 3
                                        (make-tree 1 '() '())
                                        (make-tree 5 '() '())
                                        )
                             (make-tree 9
                                        '()
                                        (make-tree 11 '() '())
                                        )
                   )
    )

    (define tree2 (make-tree 3
                             (make-tree 1 '() '())
                             (make-tree 7
                                        (make-tree 5 '() '())
                                        (make-tree 9
                                                   '()
                                                   (make-tree 11 '() '())
                                                   )
                                        )
                   )
    )

    (define tree3 (make-tree 5
                             (make-tree 3
                                        (make-tree 1 '() '())
                                        '())
                             (make-tree 9
                                        (make-tree 7 '() '())
                                        (make-tree 11 '() '())
                                        )
                   )
    )

    (define tree4 (make-tree 5
                             (make-tree 3
                                        (make-tree 1 '() '())
                                        '())
                             '())
     )

    (define tree5 (make-tree 5
                             '()
                             (make-tree 7
                                        '()
                                        (make-tree 9 '() '())
                                        )
                             )
    )

    (define tree6 (make-tree 1 '() '()))

;     (display (tree->list-1 tree1))
;     (display (tree->list-2 tree1))
;
;     (display (tree->list-1 tree2))
;     (display (tree->list-2 tree2))
;
;     (display (tree->list-1 tree3))
;     (display (tree->list-2 tree3))
;
;     (display (tree->list-1 tree4))
;     (display (tree->list-2 tree4))
;
;     (display (tree->list-1 tree5))
;     (display (tree->list-2 tree5))
;
;     (display (tree->list-1 tree6))
;     (display (tree->list-2 tree6))

    (test-equal (tree->list-1 tree1) (tree->list-2 tree1))
    (test-equal (tree->list-1 tree2) (tree->list-2 tree2))
    (test-equal (tree->list-1 tree3) (tree->list-2 tree3))
    (test-equal (tree->list-1 tree4) (tree->list-2 tree4))
    (test-equal (tree->list-1 tree5) (tree->list-2 tree5))
    (test-equal (tree->list-1 tree6) (tree->list-2 tree6))


(test-end)
