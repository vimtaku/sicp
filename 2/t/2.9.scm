
(load "./util.scm")
(load "./2.7.scm")
(load "./2.8.scm")
(load "./2.9.scm")
(load "./t/testing.scm")

(define title "2.9")

(test-begin title)

    (define sample-interval (make-interval 2 6))
    (define sample-inverse-interval (make-interval 6 2))

    (define sample-interval2 (make-interval 10 20))
    (define sample-interval3 (make-interval 40 80))

    (test-begin "width")
    (test-equal 2 (width sample-interval))
    (test-equal 2 (width sample-inverse-interval))
    (test-equal 5 (width sample-interval2))
    (test-equal 20 (width sample-interval3))
    (test-end "width")

    ;二つの区間の和(または差)の幅は, 足されるべき(または引かれるべき)区間の幅だけの関数であることを示

    (test-begin "add-interval")

    (test-equal
      ; 足した結果の幅
      (width (add-interval sample-interval sample-inverse-interval))
      ; 引数のそれぞれの幅の和
      (+ (width sample-interval) (width sample-inverse-interval))
    )

    (test-equal
      ; 足した結果の幅
      (width (add-interval sample-interval2 sample-interval3))
      ; 引数のそれぞれの幅の和
      (+ (width sample-interval2) (width sample-interval3))
    )
    (test-end "add-interval")


    (test-begin "sub-interval")

    (test-equal (width (sub-interval sample-interval2 sample-interval3))
     (+ (width sample-interval2) (width sample-interval3))
    )

    (test-end "sub-interval")


    (test-begin "div-interval")

    (display (width (div-interval sample-interval2 sample-interval3)))
    (newline)
    (display (width sample-interval2) )
    (newline)
    (display (width sample-interval3) )
    ; 0.1875
    ; 5
    ; 20
    ; これら(5, 20)では 0.1875 は導けない

    (test-end "div-interval")

    (newline)

    (test-begin "mul-interval")


    (display (width (mul-interval sample-interval2 sample-interval3)))
    (newline)
    (display (width sample-interval2) )
    (newline)
    (display (width sample-interval3) )
    ; 600
    ; 5
    ; 20
    ; これら(5, 20)では 0.1875 は導けない

    (test-end "mul-interval")

(test-end title)
