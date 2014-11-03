
; 問題 2.58
;
; 微分プログラムを修正し, 前置演算子でなく+や*が中置きになっている通常の数学の式に動作させたいと思う. 微分のプログラムは抽象データを使って定義してあるので, 微分プログラムが操作する代数式の表現を定義する述語, 選択子, 構成子だけを変更するだけで, 式の別の表現形で動作するように出来る.
;
; a. (x + (3 * (x + (y + 2))))のような中置き表現の代数式を微分するにはどうしたらよいかを示せ. 作業を単純にするため, +や*は常に二つの項をとり, 式は完全にかっこで囲まれていると仮定せよ.



(define (p x)
  (display x)
  (newline)
)

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
           (make-product (multiplier exp)
                         (deriv (multiplicand exp) var))
           (make-product (deriv (multiplier exp) var)
                         (multiplicand exp))))
        (else
         (error "unknown expression type -- DERIV" exp))))

(define (variable? x) (symbol? x))
(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))
(define (sum? x)
  (and (pair? x) (eq? (cadr x) '+)))
(define (addend s) (car s))
(define (augend s) (caddr s))
(define (product? x)
  (and (pair? x) (eq? (cadr x) '*)))
(define (multiplier p) (car p))
(define (multiplicand p) (caddr p))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list a1 '+ a2))))

(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list m1 '* m2))))


; a
; データの取り方と、 make-product の 最後に返す形を変えれば良い

; (p (deriv '(* x y) 'x))
; (p (deriv '(* (* x y) (+ x 3)) 'x))
; (p (deriv '(x + 3) 'x))
;(p (deriv '(x + (3 * (x + (y + 2)))) 'x))
;(p (deriv '(x * y) 'x))

; (p (deriv '((x * y) * (x + 3)) 'x))
; (p (deriv '((x * y) * (x + 3)) 'x))

;(p (deriv '(x * y) 'x))

(p (deriv '((x * 2) + 3) 'x))

(p (deriv '(x + (3 * (x + (y + 2)))) 'x) )

