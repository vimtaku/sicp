
(load "./util.scm")
(load "./2.34.scm")
(load "./t/testing.scm")

(define title "2.34")

(test-begin title)

    ; x=2, 1 + 3x = 7
    (test-equal 7 (horner-eval 2 (list 1 3)) )
    (test-equal 79 (horner-eval 2 (list 1 3 0 5 0 1)) )
    ;例えばx=2で, 1+3x+5x3+x5の計算は
    ; 1 + 3.2 + 5.8 + 32
    ; = 1 + 6 + 40 + 32 = 79

(test-end title)
