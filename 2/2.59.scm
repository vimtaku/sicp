
(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((equal? x (car set)) #t)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1)
               (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))


(define (union-set set1 set2)
  (cond ((null? set2) set1)
        ((null? set1) set2)
        ; もしset1 の先頭要素が集合set2の中に存在した場合
        ; 入れないで次へ
        ((element-of-set? (car set1) set2) (union-set (cdr set1) set2))
        ;存在しなかった場合は無条件で足して次へ
        (else (cons (car set1) (union-set (cdr set1) set2)))
        )
)

