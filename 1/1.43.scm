
; 問題 1.43
;
; fを数値関数, nを正の整数とすると, xでの値がf(f(... (f(x)) ... ))であるfのn回作用関数が定義出来る. 例えばfを関数x x + 1とすると, fのn回作用は関数x x + nである. fが数を二乗する演算なら, fのn回作用は引数を2n乗する関数である. 入力としてfを計算する手続きと, 正の整数nをとり, fのn回作用を計算する手続きを書け. その手続きは:
;
; ((repeated square 2) 5)
; 625
;
; のように使えなければならない. ヒント:問題1.42のcomposeを使うと便利である.

(define (compose f g)
  (lambda (x) (f (g x)))
)
(define (square x) (* x x))

(define (repeated f n)
  (define (iter f count result)
    (if (= count 1)
        result
        (iter f (- count 1) (compose f result))
    )
  )
  (iter f n f)
)

(display ((repeated square 1) 5))

;(display ((repeated square 4) 5))
;152587890625
;(display (square (square (square (square 5)))))
;152587890625







