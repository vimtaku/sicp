

;; 差の計算法
;; 差の最小値は、(Yu - Xl) - (Yl - Xu)
;; 差の最大値は、二点の上限値のうち、大きいものか小さいものを引いたもの
;; とする


; (define (sub-interval x y)
;   (make-interval (- (upper-bound x) (lower-bound y))
;                  (- (lower-bound x) (upper-bound y))
;   )
; )


(define (sub-interval x y)
  (let ((p1 (- (lower-bound x) (lower-bound y)))
        (p2 (- (lower-bound x) (upper-bound y)))
        (p3 (- (upper-bound x) (lower-bound y)))
        (p4 (- (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

