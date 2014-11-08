(load "./2.64.scm")
(load "./t/testing.scm")

(define title "2.64")

(test-begin title)

    (define expect-tree
         (make-tree 5
             (make-tree 1 '()
                 (make-tree 3 '() '())
                        )
             (make-tree 9
                 (make-tree 7 '() '())
                 (make-tree 11 '() '())
             ))
    )

;     (define li (list 1 3 5 7 9 11))
;     (test-equal expect-tree (list->tree li))
;
;     (display (succ))
;     ; 6 要素 -> 14 step


    ; (define li (list 12 12 12 12 12 12 12 12 12 12))
    ; (test-equal expect-tree (list->tree li))
    ; (display (- succ 1))
    ; 10 要素 -> 21 step

    ;(display (list->tree (range 100)))
;     ; 100 要素 -> 201 step
    ;(display (succ))
;
; (define li (....)); 1000 elements
;

    ;(display (list->tree (range 1000)))
    (display (length (range 1000)))
    (display (succ))
    ; 1000 -> 2002






(test-end)
