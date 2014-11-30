
(load "./2.68.scm")
(load "./2.69.scm")

(define pairs '((a 2) (na 16) (boom  1) (Sha   3) (Get   2) (yip   9) (job   2) (Wah   1)))

(define message
'(Get a job
Sha na na na na na na na na
Get a job
Sha na na na na na na na na
Wah yip yip yip yip yip yip yip yip yip
Sha boom)
)

(define huffman-tree (successive-merge (make-leaf-set pairs)))
(define encode-res (encode message huffman-tree))


;(p encode-res)
; (p (decode encode-res  huffman-tree))
; ;符号化に何ビット必要か. 八記号アルファベットの固定長符号を使うとこの歌を符号化するのに
; ;必要な最小ビット数はいくらか.
; (p (length encode-res))
; 符号化に84bit 必要

; 最小
;(p (length message))
; 36
; 数は 36 である。 8個なので 固定長の場合 3bit ですべて表せる.
; よって 36 * 3 = 108 bit

