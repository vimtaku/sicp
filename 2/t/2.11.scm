
(load "./util.scm")
(load "./2.7.scm")
(load "./2.11.scm")
(load "./t/testing.scm")

(define title "2.11")

(test-begin title)

    (define sample-interval++ (make-interval 10 20))
    (define sample-interval-+ (make-interval -10 20))
    (define sample-interval+- (make-interval 10 -20))
    (define sample-interval-- (make-interval -10 -20))

    (define sample-interval2++ (make-interval 40 50))
    (define sample-interval2-+ (make-interval -40 50))
    (define sample-interval2+- (make-interval 40 -50))
    (define sample-interval2-- (make-interval -40 -50))

    (test-begin "plus?")

    (test-assert (plus? (upper-bound sample-interval++)))
    (test-assert (plus? (lower-bound sample-interval++)))

    (test-assert (plus? (upper-bound sample-interval-+)))
    (test-assert (not (plus? (lower-bound sample-interval-+))))

    (test-assert (plus? (upper-bound sample-interval+-)))
    (test-assert (not (plus? (lower-bound sample-interval+-))))

    (test-assert (not (plus? (upper-bound sample-interval--))))
    (test-assert (not (plus? (lower-bound sample-interval--))))

    (test-end "plus?")


    (test-begin "minus?")

    (test-assert (not (minus? (upper-bound sample-interval++))))
    (test-assert (not (minus? (lower-bound sample-interval++))))

    (test-assert (not (minus? (upper-bound sample-interval-+))))
    (test-assert (minus? (lower-bound sample-interval-+)))

    (test-assert (not (minus? (upper-bound sample-interval+-))))
    (test-assert (minus? (lower-bound sample-interval+-)))

    (test-assert (minus? (upper-bound sample-interval--)))
    (test-assert (minus? (lower-bound sample-interval--)))

    (test-end "minus?")

    (test-begin "mul-interval++++,----")
    (define expect-interlval (make-interval 100 400))
    (test-equal expect-interlval (mul-interval sample-interval++ sample-interval++))
    (test-equal expect-interlval (mul-interval sample-interval-- sample-interval--))
    (test-end "mul-interval++++,----")

    (test-begin "mul-interval++--,--++")
    (define expect-interlval (make-interval -1000 -400))
    (test-equal expect-interlval (mul-interval sample-interval++ sample-interval2--))
    (test-equal expect-interlval (mul-interval sample-interval-- sample-interval2++))
    (test-end "mul-interval++--,--++")

    (test-begin "mul-interval++-+,-+++")
    (define expect-interlval (make-interval -800 1000))
    (test-equal expect-interlval (mul-interval sample-interval++ sample-interval2-+))
    (define expect-interlval (make-interval -500 1000))
    (test-equal expect-interlval (mul-interval sample-interval-+ sample-interval2++))
    (test-end "mul-interval++-+,-+++")

    (test-begin "mul-interval-+--,---+")
    (define expect-interlval (make-interval -1000 500))
    (test-equal expect-interlval (mul-interval sample-interval-+ sample-interval2--))
    (define expect-interlval (make-interval -1000 800))
    (test-equal expect-interlval (mul-interval sample-interval-- sample-interval2-+))
    (test-end "mul-interval-+--,---+")

    (test-begin "mul-interval-+-+")
    (define expect-interlval (make-interval -800 1000))
    (test-equal expect-interlval (mul-interval sample-interval-+ sample-interval2-+))
    (test-end "mul-interval-+-+")

    (test-begin "mul-interval2-+-+")
    (define sample-interval-+ (make-interval -100 20))
    (define sample-interval2-+ (make-interval -40 50))
    (define expect-interlval (make-interval -5000 4000))
    (test-equal expect-interlval (mul-interval sample-interval-+ sample-interval2-+))
    (test-end "mul-interval2-+-+")

    (test-begin "mul-interval3-+-+")
    (define sample-interval-+ (make-interval -10 200))
    (define sample-interval2-+ (make-interval -40 50))
    (define expect-interlval (make-interval -8000 10000))
    (test-equal expect-interlval (mul-interval sample-interval-+ sample-interval2-+))
    (test-end "mul-interval3-+-+")

    (test-begin "mul-interval4-+-+")
    (define sample-interval-+ (make-interval -10 20))
    (define sample-interval2-+ (make-interval -400 50))
    (define expect-interlval (make-interval -8000 4000))
    (test-equal expect-interlval (mul-interval sample-interval-+ sample-interval2-+))
    (test-end "mul-interval4-+-+")

    (test-begin "mul-interval5-+-+")
    (define sample-interval-+ (make-interval -10 20))
    (define sample-interval2-+ (make-interval -40 500))
    (define expect-interlval (make-interval -5000 10000))
    (test-equal expect-interlval (mul-interval sample-interval-+ sample-interval2-+))
    (test-end "mul-interval5-+-+")







(test-end title)
