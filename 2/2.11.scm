
; 以前の mul interval
; (define (mul-interval x y)
;   (let ((p1 (* (lower-bound x) (lower-bound y)))
;         (p2 (* (lower-bound x) (upper-bound y)))
;         (p3 (* (upper-bound x) (lower-bound y)))
;         (p4 (* (upper-bound x) (upper-bound y))))
;     (make-interval (min p1 p2 p3 p4)
;                    (max p1 p2 p3 p4))))


(define (plus? bound)
  (>= bound 0)
)
(define (minus? bound)
 (not (plus? bound))
)


; Interval (x or y) (lower or upper)
; 9通り(Ixl Ixu Iyl Iyu)
; ;++++
; ;++-+
; ;++--
; ;-+++
; -+-+
; ;-+--
; ;--++
; ;---+
; ;----
; の 9通り


(define (mul-interval x y)
 (cond
       ; ++++ or ----
       (
        (or
            (and
            (and (plus? (lower-bound x)) (plus? (upper-bound x)) )
            (and (plus? (lower-bound y)) (plus? (upper-bound y)) )
            )
            (and
            (and (minus? (lower-bound x)) (minus? (upper-bound x)))
            (and (minus? (lower-bound y)) (minus? (upper-bound y)))
            )
        )
        (let (
              (bound1 (* (lower-bound x) (lower-bound y)))
              (bound2 (* (upper-bound x) (upper-bound y)))
              )
          (
           if (> bound1 bound2) (make-interval bound2 bound1)
                                 (make-interval bound1 bound2)
          )
        )
       )
       ; ++-- or --++
       (
        (or
            (and
            (and (plus? (lower-bound x)) (plus? (upper-bound x)) )
            (and (minus? (lower-bound y)) (minus? (upper-bound y)) )
            )
            (and
            (and (minus? (lower-bound x)) (minus? (upper-bound x)) )
            (and (plus? (lower-bound y)) (plus? (upper-bound y)) )
            )
        )
        (let (
              (bound1 (* (lower-bound x) (upper-bound y)))
              (bound2 (* (upper-bound x) (lower-bound y)))
              )
          (
           if (> bound1 bound2) (make-interval bound2 bound1)
                                 (make-interval bound1 bound2)
          )
        )
       )

       ; ++-+
       ; 両方プラスの方の大が2回使われる
       (
        (and
         (and (plus? (lower-bound x)) (plus? (upper-bound x)) )
         (and (minus? (lower-bound y)) (plus? (upper-bound y)) )
        )
        (let (
              (bound1 (* (upper-bound x) (lower-bound y)))
              (bound2 (* (upper-bound x) (upper-bound y)))
              )
          (
           if (> bound1 bound2) (make-interval bound2 bound1)
                                (make-interval bound1 bound2)
          )
        )
       )

       ; -+++
       ; 両方プラスの方の大が2回使われる
       (
        (and
         (and (minus? (lower-bound x)) (plus? (upper-bound x)) )
         (and (plus? (lower-bound y)) (plus? (upper-bound y)) )
        )
        (let (
              (bound1 (* (lower-bound x) (upper-bound y)))
              (bound2 (* (upper-bound x) (upper-bound y)))
              )
          (
           if (> bound1 bound2) (make-interval bound2 bound1)
                                (make-interval bound1 bound2)
          )
        )
       )

       ; -+--
       ; 両方マイナスの方の小さい方が2回使われる
       (
        (and
         (and (minus? (lower-bound x)) (plus? (upper-bound x)) )
         (and (minus? (lower-bound y)) (minus? (upper-bound y)) )
        )
        (let (
              (bound1 (* (lower-bound x) (lower-bound y)))
              (bound2 (* (upper-bound x) (lower-bound y)))
              )
          (
           if (> bound1 bound2) (make-interval bound2 bound1)
                                (make-interval bound1 bound2)
          )
        )
       )
       ; ---+
       ; 両方マイナスの方の小さい方が2回使われる
       (
        (and
         (and (minus? (lower-bound x)) (minus? (upper-bound x)) )
         (and (minus? (lower-bound y)) (plus? (upper-bound y)) )
        )
        (let (
              (bound1 (* (lower-bound x) (lower-bound y)))
              (bound2 (* (lower-bound x) (upper-bound y)))
              )
          (
           if (> bound1 bound2) (make-interval bound2 bound1)
                                (make-interval bound1 bound2)
          )
        )
       )
       ; -+-+
       ; 乗算が二階使われるやつ
       (
        (and
         (and (minus? (lower-bound x)) (plus? (upper-bound x)) )
         (and (minus? (lower-bound y)) (plus? (upper-bound y)) )
        )
        (let (
              (bound1 (* (upper-bound x) (upper-bound y))); ++
              (bound2 (* (lower-bound x) (lower-bound y))); --
              (bound3 (* (lower-bound x) (upper-bound y))); -+
              (bound4 (* (upper-bound x) (lower-bound y))); +-
             )
          (cond ((and (> bound1 bound2) (< bound3 bound4))
                     (if (> bound1 bound3) (make-interval bound3 bound1)
                                          (make-interval bound1 bound3)
                     )
                 )
                 ((and (> bound1 bound2) (> bound3 bound4))
                     (if (> bound1 bound4) (make-interval bound4 bound1)
                     )
                 )
                 ((and (< bound1 bound2) (< bound3 bound4))
                     (if (> bound2 bound3) (make-interval bound3 bound2)
                                          (make-interval bound2 bound3)
                     )
                 )
                 (else
                     (if (> bound2 bound4) (make-interval bound4 bound2)
                                          (make-interval bound2 bound4)
                     )
                 )
          )
        )
       )
       (else (display "it will not be happend. Check argument."))
 )

)

