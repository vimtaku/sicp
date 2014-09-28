
; 内積は
(define (dot-product v w)
  (accumulate + 0 (map * v w))
)

; ;と定義出来る.17 他のマトリクス演算を計算する次の手続きの欠けた式を補え. (手続きaccumulate-nは問題2.36で定義してある.)

(define (matrix-*-vector m v)
   (map (lambda (y) (dot-product y v)) m)
  ; (map
  ;  (lambda (x)
  ;    (accumulate + 0 (accumulate-n * 1 (list x v)))
  ;  ) m)
)


(define (transpose mat)
  (accumulate-n cons (list) mat)
)

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (x)
           (matrix-*-vector cols x)
           ;(map (lambda (y) (dot-product x y)) cols)
         ) m)
  )
)

