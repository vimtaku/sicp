

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define succ
  (let ((x 0))
      (lambda ()
        (set! x (+ x 1))
      )
  )
)

(define (partial-tree elts n)
  (succ)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
           ;1) left size: 1
           ;2) left size: 0
        (let ((left-result (partial-tree elts left-size)))
             ; 2) (() 1 3 2 4 5)
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  (right-result (partial-tree (cdr non-left-elts)
                                              right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts (cdr right-result)))
                (cons (make-tree this-entry left-tree right-tree)
                      remaining-elts))))))))

(display (partial-tree (list 1 3 2 4 5) 3))

;a. partial-treeがどう働くか, 出来るだけ明快な短い説明を書け. list->treeがリスト(1 3 5 7 9 11)に対して作る木を描け.
;elts から n 個の要素を引数にとって、それを 木構造にして返す


;b.
;(display (succ))
; θ(n) で増える


(define (range x)
  (if (> x 0)
      (cons x (range (- x 1)))
      '()
  )
)

