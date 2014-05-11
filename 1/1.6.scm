
(define (square x)
 (* x x)
)

(define (sqrt x)
 (sqrt-iter 1.0 x))

(define (good-enough? guess x)
 ;(< (my_display (abs (- (square guess) x))) 0.001))
 (< (abs (- (square guess) x)) 0.001))

(define (average x y)
  (/ (+ x y) 2)
)

(define (improve guess x)
 (average guess (/ x guess) )
)

(define (sqrt-iter guess x)
 ;(if (my_display (good-enough? guess x)) (my_display guess)
 (new-if (my_display 1 (good-enough? guess x))
         (my_display 2 guess)
         (my_display 3 (my_display 5 (sqrt-iter (my_display 4 (improve guess x)) x)) )
 )
)



(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))


(define (my_display y x)
 (display y)
 (display ":")
 (display x)
 (newline)
x)
(define (_my_display x)
x)


;(display (sqrt 3))
(sqrt 3)


回答)
new-if は意図から見ると、 predicate が false の時に評価しないつもりであるが、
実際には new-if が operator のときに predicate, then-clause, else-clause の順に
評価されてしまう。
その証拠に、以下の実行結果の2行目では, 2:1.0 が出力されていることから
guess が評価されてしまっていることがわかる。




; /Users/mac/sicp/1% gosh 1.6.scm
; 1:#f
; 4:2.0
; 1:#f
; 4:1.75
; 1:#f
; 4:1.7321428571428572
; 1:#t
; 2:1.7321428571428572
; 5:1.7321428571428572
; 3:1.7321428571428572
; 5:1.7321428571428572
; 3:1.7321428571428572
; 5:1.7321428571428572
; 3:1.7321428571428572
; /Users/mac/sicp/1%  
; /Users/mac/sicp/1% gosh 1.6.scm
; 1:#f
; 2:1.0
; 4:2.0
; 1:#f
; 2:2.0
; 4:1.75
; 1:#f
; 2:1.75
; 4:1.7321428571428572
; 1:#t
; 2:1.7321428571428572
; 4:1.7320508100147274
; 1:#t
; 2:1.7320508100147274
