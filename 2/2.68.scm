
(load "./huffman.scm")


(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                   (make-leaf 'B 2)
                   (make-code-tree (make-leaf 'D 1)
                                   (make-leaf 'C 1)))))

;与えられた木に従って与えられた記号を符号化したビットのリストを返すもの
;encode-symbolの設計では, 記号が木になければ, エラーとしなければならない.
; 出来た手続きを問題2.67で得た結果と, 例題の木を使って符号化し, 元の例題の通信文と同じかどうかを見てテストせよ.
(define (encode-symbol symbol tree)
  (define (inner tree result)
    (cond ((leaf? tree)
           ; symbol と等しければ result を返す、そうでなければ '()
           (if (equal? (symbol-leaf tree) symbol)
               result
               '()
           )
          )
          (else
            (let (
                  (left-res (inner (left-branch tree) (append result '(0))))
                  (right-res (inner (right-branch tree) (append result '(1))))
                 )
                 (cond ((not (null? left-res)) left-res)
                       ((not (null? right-res)) right-res)
                       (else '())
                 )
            )
          )
    )
  )
  (define res (inner tree '()))
  (if (not (null? res))
      res
      (error "does not found"))
)

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

