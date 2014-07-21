
(define (f g)
 (display g)
  (g 2)
)

; (define (m h)
;   (h 2)
; )

;(define (square x) (* x x))

;(display (f square))
;(display (f (lambda (z) (* z (+ z 1)))))


(display (f f))
;gosh: "error": invalid application: (2 2)
; gosh では実行時エラーとなった。
; まず (f g)に入り、 g は closure f となっていた。
; そして closure f に 2 を作用するとき (2 2) となりエラーとなった。
; これは f g と m h という同じ動作の別名関数を作るとわかりやすい。
; 結局 (m h) の h は 2 として評価され、先ほどと同様のエラーになる。
; また、 (display g) を挟んでもわかりやすい。
; 一度目の (display g) では closure であるが、 (g 2) で、 closure に 2 を引数として作用した結果、二度目の (display g) に到達し、2 が表示されている.


