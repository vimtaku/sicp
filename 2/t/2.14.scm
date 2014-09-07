
(load "./util.scm")
(load "./2.7.scm")
(load "./2.12.scm")
(load "./2.14.scm")
(load "./t/testing.scm")

(define title "2.14")

(test-begin title)
    (define sample-interval (make-interval 10 20))
    (define sample-interval2 (make-interval 30 40))

    (display (par1 sample-interval sample-interval2))
    ;   (5.0 . 20.0)
    (newline)
    (display (par2 sample-interval sample-interval2))
    ; (7.5 . 13.333333333333332)
    (newline)

    ; A/A
    (display (div-interval sample-interval sample-interval))
    ; (0.5 . 2.0)
    (newline)

    (define sample-interval-big (make-interval 10000 10020))
    (define sample-interval-big2 (make-interval 20000 20020))

    ; A/A
    (display (div-interval sample-interval-big sample-interval-big))
    ;   (0.998003992015968 . 1.002)
    (newline)
    (display "A/A percent is ")
    (display (percent (div-interval sample-interval-big sample-interval-big)))
    (newline)
    ; A/B
    (display "mogeeee")
    (newline)
    (display (div-interval sample-interval-big sample-interval-big2))
    (newline)
    (display "A/B percent is ")
    (display (percent (div-interval sample-interval-big sample-interval-big2)))

    ;   (0.4995004995004995 . 0.501)


    (newline)
    (display "par1 center is ")
    (display (center (par1 sample-interval sample-interval2)))
    (newline)
    (display (percent (par1 sample-interval sample-interval2)))
    (newline)
    (display "par2 center is ")
    (display (center (par2 sample-interval sample-interval2)))
    (newline)
    (display (percent (par2 sample-interval sample-interval2)))


    (newline)
    (define sample-interval-big (make-interval 10000 10020))
    (define sample-interval-big2 (make-interval 20000 20020))

    (display "par1 center is ")
    (display (center (par1 sample-interval-big sample-interval-big2)))
    (newline)
    (display (percent (par1 sample-interval-big sample-interval-big2)))
    (newline)
    (display "par2 center is ")
    (display (center (par2 sample-interval-big sample-interval-big2)))
    (newline)
    (display (percent (par2 sample-interval-big sample-interval-big2)))


(test-end title)
