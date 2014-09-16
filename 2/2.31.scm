

; 問題2.30の答を抽象化し, square-treeが
;
; (define (square-tree tree) (tree-map square tree))
;
; と定義出来るように, 手続き tree-mapを作れ.
;


(define (tree-map f tree)
 (map (lambda (sub-tree)
       (if (pair? sub-tree)
           (tree-map f sub-tree)
           (f sub-tree)
       )
      )
 tree)
)

(define (square-tree tree) (tree-map square tree))



