; (define x (cons 1 2))
; (display (cdr x))


; (define x (cons 1 2))
;
; (define y (cons 3 4))
;
; (define z (cons x y))
;
; (display  (cdr (car z)) )
; (car (cdr z))

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))


(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))


(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))


(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))


(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

(define (make-rat n d) (cons n d))

(define (numer x) (car x))

(define (denom x) (cdr x))


(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))


;(print-rat (add-rat (make-rat 2 3) (make-rat 2 3)))

(display (cdr '(hoge fuga piyo)))

