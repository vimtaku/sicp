
(load "./util.scm")
(load "./2.33.scm")
(load "./t/testing.scm")

(define title "2.33")

(test-begin title)

    (define (square x) (* x x))
    (define (inc x) (+ 1 x))
    (display (accumulate (lambda (x y)
                          (display "x = ")
                          (display x)
                          (display ",y = ")
                          (display y)
                          (+ x y)
                          )  0 (list 1 2 3)) )

    ;(display (map square (list 1 2 3)) )
    (test-equal (list 1 4 9) (map square (list 1 2 3)))
    (test-equal (list 2 3 4) (map inc (list 1 2 3)))


    (test-equal (list 1 2 3 4) (append (list 1 2) (list 3 4)))


    (test-equal 4 (length (list 1 2 3 4)))
    (test-equal 3 (length (list 2 3 4)))
    (test-equal 2 (length (list 3 4)))
    (test-equal 1 (length (list 4)))
    (test-equal 0 (length (list)))




(test-end title)
