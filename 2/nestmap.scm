
(define (divides? a b)
  (= (remainder b a) 0))


(define (next test-divisor)
  (if (= test-divisor 2)
      3
      (+ test-divisor 2)
  )
)

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))
  )
)

(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

(define nil (list))
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))
  )
)

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

; (accumulate append
;             nil
;             (map (lambda (i)
;                    (map (lambda (j) (list i j))
;                         (enumerate-interval 1 (- i 1))))
;                  (enumerate-interval 1 n)))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (flatmap
                (lambda (i)
                  (map (lambda (j) (list i j))
                       (enumerate-interval 1 (- i 1))))
                (enumerate-interval 1 n)))))


(define (remove item sequence)
  (filter (lambda (x) (not (= x item)))
          sequence)
)

