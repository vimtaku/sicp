
(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

;(add-1 zero)
; わかりにくいので zero の 引数 f を f0, x を x0 とする
;(add-1 (lambda (f0) (lambda (x0) x0)))
;(lambda (f) (lambda (x) (f (((lambda (f0) (lambda (x0) x0) f) x)))))
;(lambda (f) (lambda (x) (f (_____________ (lambda (x0) x0) __ x_))))
;(lambda (f) (lambda (x) (f ((lambda (x0) x0)  x) )))
;(lambda (f) (lambda (x) (f __________________ x _ )))
;(lambda (f) (lambda (x) (f x)))
;
; これが 1
;(lambda (f) (lambda (x) (f x)))


(define one
  (lambda (f) (lambda (x) (f (x))))
)

;; one に add-1 すると two が導ける

;(add-1 one)
;(add-1 (lambda (f) (lambda (x) (f x))))
;(add-1 (lambda (f1) (lambda (x1) (f1 x1))))
;(add-1 (lambda (f1) (lambda (x1) (f1 x1))))
; (lambda (f) (lambda (x) (f (((lambda (f1) (lambda (x1) (f1 x1))) f) x))))
; わかりやすいように寄せてみる
; (lambda (f) (lambda (x) (f (   ((lambda (f1) (lambda (x1) (f1 x1))) f)   x))))
; (lambda (f) (lambda (x) (f (    (lambda (x1) (f x1))    x))))
; わかりやすいように寄せてみる
; (lambda (f) (lambda (x) (f   ((lambda (x1) (f x1))  x)  )))
;
; (lambda (f) (lambda (x) (f   _____________ (f x)_____  )))
;
; (lambda (f) (lambda (x) (f (f x) )))


(define two
  (lambda (f) (lambda (x) (f (f (x)) )))
)



(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x))))
)



;; 思考過程
(define (moge a b)
 ( (lambda (x y) (+ x (y))) a b)
)

(display (moge 1 (lambda () 2) ) )





