


;1 逆順になるのは逆順につないでいるように書いてるから。
; [.][.]->[.][.]->[.][.]->[/][/]
;  |       |       |
; [9]     [4]     [1]


(define (square x) (* x x))




; 書き直すとこうできるがこれは反復的プロセスでない
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (cons (square (car things)) (iter (cdr things) answer))
    )
  )
  (iter items '()))


; append 使うとこうなるけど..
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things) (append answer (list (square (car things)))))
    )
  )
  (iter items '()))


;(display (append '(1 2) '(3)))
(display (square-list '(1 2 3)))


;1 ()
;4 to1
;9 to4

