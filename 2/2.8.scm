

;; 差の計算法
;; 差の最小値は、(Yu - Xl) - (Yl - Xu)
;; 差の最大値は、二点の上限値のうち、大きいものか小さいものを引いたもの
;; とする


(define (sub-interval x y)
  (make-interval (- (upper-bound y) (lower-bound x))
                 (- (lower-bound y) (upper-bound x))
  )
)

