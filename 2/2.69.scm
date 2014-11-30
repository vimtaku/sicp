


(load "./huffman.scm")

(define (successive-merge leafs)

  (cond ((>= 1 (length leafs)) (car leafs))
        (else
          (successive-merge (adjoin-set (make-code-tree (car leafs) (cadr leafs))
                                        (cddr leafs)))
              )
        )
)

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

;(define pairs '((A 4) (B 2) (C 1) (D 1)))
(define pairs '((A 4) (B 2) (C 1) (D 1)))
;(define pairs '((A 8)  (B 3)  (C 1)  (D 1)  (E 1)  (F 1)  (G 1)  (H 1)))
;(p (generate-huffman-tree pairs))


;(p (make-leaf-set pairs))
;(p moge)
(p (adjoin-set (make-leaf 'B 8) (list (make-leaf 'A 3))))

;(p (make-leaf-set pairs))
;(p (successive-merge (make-leaf-set pairs)))

