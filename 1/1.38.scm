
; 問題 1.38
;
; 1737年, スイスの数学者 Leonhard Eulerは De Fractionibus Continuisというメモを発表した. その中にeを自然対数の底としてe - 2 の連分数展開がある. この分数ではNiはすべて1, Diは順に1, 2, 1, 1, 4, 1, 1, 6, 1, 1, 8, ... . 問題1.37のcont-fracを使い, Eulerの展開によりeを近似するプログラムを書け.


; 反復的プロセス
(define (cont-frac n d k)
  (define (iter n d k result)
    (if (= k 0)
      result
      (iter n d (- k 1) (+ (/ (n k) (+ result (d k)))))
    )
  )
  (iter n d k 0)
)


;2.71828182846
;; e-2 の近似なので cont-frac のあとに 2 たす
(display (+ (cont-frac
         (lambda (i) 1.0)
         (lambda (i)
           (cond ((= i 1) 1)
                 ((= 2 (remainder i 3)) (* 2 (/ (+ 1 i) 3)))
                 (else 1)
           )
         )
         10
        ) 2)
)

; 2:1(2*1+0)
; 5:2(2*2+1)
; 8:3(2*3+2) ( 2*(n) + (n-1))
; 11:3(2*2+2)

; 2n + n - 1
; 3(n-1) -1

; 1, 2, 3, 4, 5, 6, 7, 8 9  10 11
; 1, 2, 1, 1, 4, 1, 1, 6, 1, 1, 8, ...


