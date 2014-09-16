

;xとyをリストとして定義したとしよう:

(define x (list 1 2 3))

(define y (list 4 5 6))

;次の式のそれぞれの評価に応じて, 解釈系が印字する結果は何か:

;(append x y)
; 予想
; (1 2 3 4 5 6)
(display (append x y))
; gosh (1 2 3 4 5 6)

; (cons x y)
; 予想
; ((1 2 3) 4 5 6)
(display (cons x y))
;gosh ((1 2 3) 4 5 6)

;(list x y)
; 予想
; ((1 2 3) (4 5 6))
(display (list x y))
; gosh ((1 2 3) (4 5 6))


