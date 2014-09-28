
(load "./nestmap.scm")

(define (fold-right op initial sequence)
  (accumulate op initial sequence)
)

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
      result
      (iter (op result (car rest))
            (cdr rest))))
  (iter initial sequence)
)

(define (trio-sum? li n)
  (= (fold-right + 0 li) n)
)

(define (permutations s)
  (if (null? s)                    ; 空集合?
      (list nil)                   ; 空集合を含むリスト
      (flatmap (lambda (x)
                 (map (lambda (p) (cons x p))
                      (permutations (remove x s))))
               s)))

(define (remove item sequence)
  (filter (lambda (x) (not (= x item)))
          sequence))

(define (unique-pairs n)
 (flatmap
     (lambda (i)
       (map (lambda (j) (list i j))
            (enumerate-interval 1 (- i 1))))
     (enumerate-interval 1 n)
 )
)

(define (unique-trios n)
  (flatmap (lambda (pair)
         (map
          (lambda (i)
            (append (list i) pair)
          )
          ; pair の先頭より大きい物が必要
          (enumerate-interval (+ 1 (car pair)) n)
       )
       )
      (unique-pairs (- n 1))
  )

)

(define (find-trios-sum-list n s)
 (filter
  (lambda (x) (trio-sum? x s))
  (unique-trios n)
 )
)

