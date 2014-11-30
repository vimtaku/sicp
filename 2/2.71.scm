
(load "./2.68.scm")
(load "./2.69.scm")

(define (random n)
 (+ (remainder (sys-random) n) 1)
)

(define (pow x y)
    (if (= y 0)
        1
        (* x (pow x (- y 1)))))

(define (freq n) (pow 2 (- n 1)))

; n = 5
; hoge fuga
; piyo meso
; foo

(define pairs (quote
    ((hoge 1) (fuga 2) (piyo 4) (meso 8) (foo 16))
    )
)

(define huffman-tree (successive-merge (make-leaf-set pairs)))
(p huffman-tree)


(define pairs10 (quote
    (
     (hoge 1) (fuga 2) (piyo 4) (meso 8) (foo 16)
     (ho 32) (fu 64) (puyo 128) (kuso 256) (bar 512)
    )
    )
)

(define huffman-tree (successive-merge (make-leaf-set pairs10)))
(p huffman-tree)


; 最高頻度の記号を符号化するのに必要なビット数

; 最高頻度
; 0 で行けるので 1bit
; 最低頻度
; 二分木の右側の最後の枝数分なので
; n を正の自然数としたとき
; n-1 bit 必要

