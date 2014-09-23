
(load "./util.scm")
(load "./2.36.scm")
(load "./2.37.scm")
(load "./t/testing.scm")

(define title "2.37")

(test-begin title)

    (define matrix (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))

    (define matrix (list (list 1 3 5) (list 4 -2 -1)))

    (define vec (list 1 1 1 1))

    ;(display (dot-product (list 1 3 -5) (list 4 -2 -1) ) )
    (test-equal 3  (dot-product (list 1 3 -5) (list 4 -2 -1) ) )


    ; matrix * vector
    ;[a b] [e]    [ae + bf]
    ;[c d] [f]   =[ce + df]

    ; [1 2] [5]   [1*5 + 2*6] = [17]
    ; [3 4] [6] = [3*5 + 4*6]   [39]

    (define matrix2 (list (list 1 2) (list 3 4)))
    (define vec2 (list 5 6))
    ;(display (matrix-*-vector matrix2 vec2))
    (test-equal (list 17 39) (matrix-*-vector matrix2 vec2) )


    ; [1 2 3] = [1 4]
    ; [4 5 6]   [2 5]
    ;           [3 6]

    (define matrix_t (list (list 1 2 3) (list 4 5 6)))
    (test-equal (list (list 1 4) (list 2 5) (list 3 6)) (transpose matrix_t))


    ; matrix * matrix
    ; [1 2 3] [7 8]
    ; [4 5 6] [9 10] = [58(1*7+2*9+3*11) 64]
    ;         [11 12]  [139 154]
    (define matrix3 (list (list 1 2 3) (list 4 5 6)))
    (define matrix4 (list (list 7 8) (list 9 10) (list 11 12)))

    ;(display (matrix-*-matrix matrix3 matrix4))
    (test-equal (list (list 58 64) (list 139 154)) (matrix-*-matrix matrix3 matrix4))



(test-end title)
