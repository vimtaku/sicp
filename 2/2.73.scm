
;a. 上でやったことを説明せよ. 述語number?やvariable?がデータ主導の振分けに吸収出来ないのはなぜか.
;sum? や product? を 予めテーブル化しておき、
;(get 'deriv (operator exp)) で対応する関数を取得し、それに引数を適用するようにした。(データ手動の振り分け)

; number? や variable? は, 予めテーブル化することが出来ないから。


;b. 和と積の微分の手続きを書き, 上のプログラムで使う表に, それらを設定するのに必要な補助プログラムを書け. 

(define (p x)
  (display x)
  (newline)
)

(define false #f)
(define true #t)

(load "./table.scm")

;; copy from 2.56.scm ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))
;; 修正
(define (addend s) (car s))
(define (augend s) (cadr s))
(define (product? x)
  (and (pair? x) (eq? (car x) '*)))
(define (multiplier p) (car p))
(define (multiplicand p) (cadr p))

(define (variable? x) (symbol? x))
(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))

(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))
;; end copy from 2.56.scm ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; (define (deriv exp var)
;   (cond ((number? exp) 0)
;         ((variable? exp) (if (same-variable? exp var) 1 0))
;         ((sum? exp)
;          (make-sum (deriv (addend exp) var)
;                    (deriv (augend exp) var)))
;         ((product? exp)
;          (make-sum
;            (make-product (multiplier exp)
;                          (deriv (multiplicand exp) var))
;            (make-product (deriv (multiplier exp) var)
;                          (multiplicand exp))))
;         (else (error "unknown expression type -- DERIV" exp))))

(define (deriv exp var)
   (cond ((number? exp) 0)
         ((variable? exp) (if (same-variable? exp var) 1 0))
         ;(else ((get 'deriv (operator exp)) (operands exp)
         (else ((get (operator exp) 'deriv) (operands exp)
                                            var))))
(define (operator exp) (car exp))
(define (operands exp) (cdr exp))

; insert table data
;(put 'deriv '+
(put '+ 'deriv
     (lambda (exp var)
       (make-sum (deriv (addend exp) var)
       (deriv (augend exp) var)))
     )
;(put 'deriv '*
(put '* 'deriv
     (lambda (exp var)
         (make-sum
           (make-product (multiplier exp)
                         (deriv (multiplicand exp) var))
           (make-product (deriv (multiplier exp) var)
                             (multiplicand exp))))
     )
; c

(define (base p) (car p))
(define (exponentiation p) (cadr p))
(define (make-exponentiation b e)
  (cond ((=number? e 0) 1)
        ((=number? e 1) b)
        (else (list '** b e))
  )
)
;(put 'deriv '**
(put '** 'deriv
     (lambda (exp var)
       (make-product
         ; nu^(n-1)
         (make-product
           (exponentiation exp)
           (make-exponentiation (base exp) (- (exponentiation exp) 1))
         )
         ; (du/dx)
         (deriv (base exp) var)
       )
      ))

; (display (put "hoge" "fuga" "piyo"))
;(display (get 'deriv '+))

; (p (deriv '(+ x 3) 'x))
; (p (deriv '(* x y) 'x))
(p (deriv '(** x 3) 'x) )
;(* 3 (** x 2))

; d
; put を書き換えるだけでよし。


