
(load "./2.47.scm")
(load "./t/testing.scm")

(define title "2.47")

(test-begin title)

    (define origin 10)
    (define edge1 20)
    (define edge2 30)
    (define frame (make-frame origin edge1 edge2))

    (test-equal origin (origin-frame frame))
    (test-equal edge1 (edge1-frame frame))
    (test-equal edge2 (edge2-frame frame))




(test-end title)
