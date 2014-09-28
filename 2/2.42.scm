
(load "./nestmap.scm")
(load "./2.41.scm")

(define empty-board
  (list (list))
)

(define (row-or-col-same? pair pairb)
  (if (null? pairb)
      #f
      (or (= (car pair) (car pairb)) (= (cadr pair) (cadr pairb)))
  )
)

(define (safe? k positions)
  (define (find-same new li)
    (cond ((null? li) #t)
          ((row-or-col-same? new (car li)) #f)
          (else (find-same new (cdr li)))
    )
  )

  (let ((new (car positions))
        (rest (cdr positions))
       )
       (find-same new rest)
  )
)



(define (adjoin-position new-row k rest-of-queens)
  (append (list (list new-row k)) rest-of-queens)
)


(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens)
                 )
                 (enumerate-interval 1 board-size)
            )
          )
          (queen-cols (- k 1)))
        )
     )
  )
  (queen-cols board-size)
)


