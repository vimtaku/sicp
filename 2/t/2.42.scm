
(load "./util.scm")
(load "./2.42.scm")
(load "./t/testing.scm")

(define title "2.42")

(test-begin title)

;   (test-equal (list (list (list 2 2) (list 1 1) (list))
;                     (list (list 1 2) (list 2 1) (list)) )
;               (queens 2)
;   )
;
;   (display (queens 2))
  ;(display (length (queens 7)))
  (display (queens 0))
  (newline)
  (display (queens 1))
  (newline)
  (display (queens 2))
  (newline)
  (display (queens 3))


(test-end title)
