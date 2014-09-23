
;reverse(問題2.18)の, 問題2.38のfold-rightとfold-left を使った, 次の定義を完成せよ:

(define (reverse sequence)
 ; x に sequence の値が一つづつ入ってくる(逆から)。 yは保存変数
 (fold-right (lambda (x y)
              ; (display x)
              ; (display y)
              (append y (list x)) ) (list) sequence))


(define (reverse sequence)
 ; y に sequence の値が一つづつ入ってくる(順に)。 x は保存変数
  (fold-left (lambda (x y)
              (display x)
              (display y)
              (cons y x) ) (list) sequence))

