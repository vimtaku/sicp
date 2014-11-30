
; 符号化木と例題の通信文を定義する:
;
; (define sample-tree
;   (make-code-tree (make-leaf 'A 4)
;                   (make-code-tree
;                    (make-leaf 'B 2)
;                    (make-code-tree (make-leaf 'D 1)
;                                    (make-leaf 'C 1)))))
;
; (define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))
;
; 通信文を復号化するのにdecode手続きを使い, 結果を示せ.
;

(load "./huffman.scm")

(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                   (make-leaf 'B 2)
                   (make-code-tree (make-leaf 'D 1)
                                   (make-leaf 'C 1)))))

(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))
;(define sample-message '(1 1 1))

(p (decode sample-message sample-tree))
;(p sample-tree)
; (p (leaf? sample-tree))
; (p (leaf? (make-leaf 'D 1)))
;(A D A B B C A)
