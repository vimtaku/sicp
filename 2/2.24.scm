

;式(list 1 (list 2 (list 3 4)))を評価したとしよう. 解釈系の印字する結果, 対応する箱とポインタ構造および(図2.6のような)木としての解釈を書け.


; [.][.]------>[.][/]
;  |            |
; [1]          [.][.]----->[.][/]
;               |           |
;              [2]         [.][.]->[.][/]
;                           |       |
;;;                        [3]     [4]
;
;;
;




;(define x (list 1 (list 2 (list 3 4))))
;(display (list 1 (list 2 (list 3 4))))

; (display  (cdr (cdr (car (cdr (car (cdr x)))))))
;
; (display (cdr (cons 1 '())))


