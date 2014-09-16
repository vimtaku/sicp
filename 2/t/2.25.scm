
(load "./2.25.scm")
(load "./t/testing.scm")

(define title "2.25")

(test-begin title)

    (define x (list 1 3 (list 5 7) 9))
    (define y (list (list 7)))
    (define z (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))

    ; (display x)
    ; (display y)
    ; (display z)

    ; x
    (test-equal 7  (car (cdr (car (cdr (cdr x)))))  )

    ; y
    (test-equal 7  (car (car y)))

    ; z
    (test-equal 7  (car(cdr (car(cdr (car(cdr (car(cdr  (car(cdr (car(cdr z)))))))))))) )


(test-end title)
