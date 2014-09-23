
(load "./2.36.scm")
(load "./2.38.scm")
(load "./t/testing.scm")

(define title "2.38")

(test-begin title)

   (test-equal (/ 3 2) (fold-right / 1 (list 1 2 3)))
   (test-equal (/ 1 6) (fold-left / 1 (list 1 2 3)))

   (test-equal (list 1 (list 2 (list 3 (list)))) (fold-right list (list) (list 1 2 3)))

   (test-equal (list (list (list (list (list) 1) 2) 3))
    (list (fold-left list (list) (list 1 2 3)))
   )


   ; 可換性を持ってれば おなじになる
   (test-equal 6 (fold-right * 1 (list 1 2 3)))
   (test-equal 6 (fold-left * 1 (list 1 2 3)))
   (test-equal 7 (fold-right + 1 (list 1 2 3)))
   (test-equal 7 (fold-left + 1 (list 1 2 3)))
   (test-equal 1 (fold-right - 1 (list 1 2 3)))
   (test-equal -5 (fold-left - 1 (list 1 2 3)))

(test-end title)
