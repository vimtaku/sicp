
; Lambertの式に基づいて正接関数の近似値を計算する手続き(tan-cf x k) を定義せよ. kは問題1.37と同様, 計算する項数を指定する. 


; 反復的プロセス
(define (cont-frac operator n d k)
  (define (iter n d k result)
    (if (= k 0)
      result
      (iter n d (- k 1) (operator (/ (n k) (operator result (d k)))))
    )
  )
  (iter n d k 0)
)

;; まず + を cont-frac を修正して 連分数の operator を取れるようにする
;; 問題なく使える
;2.7182818284590455
; (display (+ (cont-frac +
;          (lambda (i) 1.0)
;          (lambda (i)
;            (cond ((= i 1) 1)
;                  ((= 2 (remainder i 3)) (* 2 (/ (+ 1 i) 3)))
;                  (else 1)
;            )
;          )
;          1000
;         ) 2)
; )


(define (square x) (* x x))
(define (tan-cf x k)
 (cont-frac -
          (lambda (i) (if (= i 1)
                          x
                          (square x)
                      ))
          (lambda (i) (+ 1 (* (- i 1) 2)))
 k)
)

;; 同じになった
(display (tan-cf 1.0 1000) )
(newline)
(display (tan 1.0))

