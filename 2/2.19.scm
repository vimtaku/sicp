


;手続きfirst-denomination, except-first-denominationおよびno-more?をリスト構造の基本的演算を使って定義せよ. リスト coin-valuesの順は, ccの答に影響があるか. なぜか.


(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))
; (define us-coins (list 1 25 5 10 50 ))
; (define uk-coins (list 20 10 5   100 2 50 1 0.5))



(define (no-more? coins)
  (null? coins)
)
(define (first-denomination coins)
  (car coins)
)
(define (except-first-denomination coins)
  (cdr coins)
)

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (except-first-denomination coin-values))
            (cc (- amount
                   (first-denomination coin-values))
                coin-values)))))

    ; 全額を 自分以外の残りのコインの全パターン
    ; + 提示額から今見ている額を引いたものの全パターン

;リスト coin-valuesの順は, ccの答に影響があるか. なぜか.
; 影響がない。使う種類の列挙が変わらないから。

