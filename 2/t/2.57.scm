
(load "./2.57.scm")
(load "./t/testing.scm")

(define title "2.57")

(test-begin title)

    (define exp '(+ x 3 4))
    (define exp2 '(+ x 3 4 x))

    (test-equal 1 (deriv exp 'x))
    (test-equal 2 (deriv exp2 'x))

 ;(p (deriv '(* x y) 'x) )
;(p (deriv '(* (* x y) (+ x 3)) 'x))

; (p (deriv '(* x y (+ x 3)) 'x) )
; (+ (* x y) (* y (+ x 3)))

;(p (deriv '(* x y z (+ x 3)) 'x) )
;(+ (* x (* y z)) (* y z (+ x 3)))

; (p (deriv '(* x y z (+ x 3)) 'x) )
;


(p (deriv '(+ x y (+ x 3) ) 'x))



(test-end)
