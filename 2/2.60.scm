
; 同じ
(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((equal? x (car set)) #t)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (cons x set)
)

(define (union-set set1 set2)
  (append set1 set2)
)

; 同じ
(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1)
               (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

;重複なし表現の対応する手続きと比べて効率はどうなるか. 重複なし表現よりこの表現の方が使いたくなる応用はあるだろうか.

; element-of-set? は同じ
; adjoin-set は n -> 1
; union-set は θ(n^2) -> θ(n) (append のオーダーは cons で作るとすると n)
; intersection-set は同じ

; 使いたくなる場面は 両方に含まれているものを取らない場面か、追加に時間を食いたくない場面、追加のほうが多い場面。

