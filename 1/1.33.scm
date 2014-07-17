
(define (square x)
 (* x x)
)
(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))





(define (filtered-accumulate combiner filter null-value term a next b)
    (define (iter a result)
         (if (> a b)
             result
             (if (filter (term a))
                 (iter (next a) (combiner result (term a)))
                 (iter (next a) result)
             )
         )
    )
    (iter a null-value)
)

(define (sum filter term a next b)
  (define (_sum x y) (+ x y))
  (filtered-accumulate _sum filter 0 term a next b)
)
(define (inc n) (+ n 1))
(define (inc2 n) (+ n 2))
(define (identity x) x)

; (display (sum identity 1 inc 10))
; (display (prime? 3))
;;;;;;;;;;;;
;;; a. 区間a, bの素数の二乗の和(prime?述語は持っていると仮定する.)
; (define (prime-filter x) (prime? x))
; (display (sum prime-filter identity 3 inc2 10))


;b. nと互いに素で, nより小さい正の整数(つまりi < nでGCD(i, n)=1なる全整数i)の積
(define (product filter term a next b)
  (define (_product x y) (* x y))
  (filtered-accumulate _product filter 1 term a next b)
)

(define (gcd-product term a next b)
    (define (_product x y) (* x y))
    (define (gcd-filter x)
      (define (iter a b)
          (if (= b 0)
            a
            (iter b (remainder a b))
          )
      )
      (= 1 (iter x b))
    )
  (filtered-accumulate _product gcd-filter 1 term a next b)
)

;(display (gcd-product identity 1 inc 10))
;(display (* 1 3 7 9 ))


; (define (gcd a b)
;   (if (= b 0)
;     a
;     (gcd b (remainder a b))))
; (display (gcd 10 10))
;    1
;    3
;    7
;    9










