
(load "./myutil.scm")
(load "./table.scm")


; 2.78 修正前
; (define (attach-tag type-tag contents)
;   (cons type-tag contents))
;
; (define (type-tag datum)
;   (if (pair? datum)
;       (car datum)
;       (error "Bad tagged datum -- TYPE-TAG" datum)))
;
; (define (contents datum)
;   (if (pair? datum)
;       (cdr datum)
;       (error "Bad tagged datum -- CONTENTS" datum)))

; 2.78 修正後
(define (attach-tag type-tag contents)
  (if (eq? type-tag 'scheme-number)
      contents
      (cons type-tag contents)))

(define (type-tag datum)
  (if (pair? datum)
      (car datum)
      (if (number? datum)
          'scheme-number
          (error "Bad tagged datum -- TYPE-TAG" datum))))

(define (contents datum)
  (if (pair? datum)
      (cdr datum)
      (if (number? datum)
          datum
          (error "Bad tagged datum -- CONTENTS" datum))))




(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (error
            "No method for these types -- APPLY-GENERIC"
            (list op type-tags)))
      ))
  )

(define (add x y) (apply-generic 'add x y))
(define (sub x y) (apply-generic 'sub x y))
(define (mul x y) (apply-generic 'mul x y))
(define (div x y) (apply-generic 'div x y))

(define (install-scheme-number-package)
  (define (tag x)
    (attach-tag 'scheme-number x))
  (put 'add '(scheme-number scheme-number)
       (lambda (x y) (tag (+ x y))))
  (put 'sub '(scheme-number scheme-number)
       (lambda (x y) (tag (- x y))))
  (put 'mul '(scheme-number scheme-number)
       (lambda (x y) (tag (* x y))))
  (put 'div '(scheme-number scheme-number)
       (lambda (x y) (tag (/ x y))))
  (put 'make 'scheme-number
       (lambda (x) (tag x)))
  (put 'equ? '(scheme-number scheme-number)
       (lambda (x y) (= x y)))
  (put '=zero? '(scheme-number)
       (lambda (x) (= 0 x)))


  'done)
(install-scheme-number-package)

(define (make-scheme-number n)
  ((get 'make 'scheme-number) n))

(define (install-rational-package)
   ;; 内部手続き
  (define (numer x) (car x))
  (define (denom x) (cdr x))
  (define (make-rat n d)
    (let ((g (gcd n d)))
      (cons (/ n g) (/ d g))))
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
  (define (equ? x y)
    (and (= (numer x) (numer y)) (= (denom x) (denom y)))
    )
  (define (nan? x) (not (= x x)))
  (define (=zero? x)
    ;(or (nan? (numer x)) (nan? (denom x)))
    (= 0 (numer x))
    ;(or (nan? (numer x)) (nan? (denom x)))
    )

   ;; システムの他の部分へのインターフェース
  (define (tag x) (attach-tag 'rational x))
  (put 'add '(rational rational)
       (lambda (x y) (tag (add-rat x y))))
  (put 'sub '(rational rational)
       (lambda (x y) (tag (sub-rat x y))))
  (put 'mul '(rational rational)
       (lambda (x y) (tag (mul-rat x y))))
  (put 'div '(rational rational)
       (lambda (x y) (tag (div-rat x y))))

  (put 'make 'rational
       (lambda (n d) (tag (make-rat n d))))

  (put 'equ? '(rational rational)
      (lambda (x y) (equ? x y)))
  (put '=zero? '(rational) =zero?)

  'done)
(install-rational-package)

(define (make-rational n d)
  ((get 'make 'rational) n d))



(define (install-rectangular-package)
   ;; 内部手続き
  (define (real-part z)
    (car z))
  (define (imag-part z) (cdr z))
  (define (make-from-real-imag x y) (cons x y))
  (define (magnitude z)
    (sqrt (+ (square (real-part z))
             (square (imag-part z)))))
  (define (angle z)
    (atan (imag-part z) (real-part z)))
  (define (make-from-mag-ang r a) 
    (cons (* r (cos a)) (* r (sin a))))

   ;; システムの他の部分とのインターフェース
  (define (tag x) (attach-tag 'rectangular x))
  (put 'real-part '(rectangular) real-part)
  (put 'imag-part '(rectangular) imag-part)
  (put 'magnitude '(rectangular) magnitude)
  (put 'angle '(rectangular) angle)
  (put 'make-from-real-imag 'rectangular
       (lambda (x y) (tag (make-from-real-imag x y))))
  (put 'make-from-mag-ang 'rectangular
       (lambda (r a) (tag (make-from-mag-ang r a))))
  'done)
; 無いので実行
(install-rectangular-package)

(define (install-polar-package)
   ;; 内部手続き
  (define (magnitude z) (car z))
  (define (angle z) (cdr z))
  (define (make-from-mag-ang r a) (cons r a))
  (define (real-part z)
    (* (magnitude z) (cos (angle z))))
  (define (imag-part z)
    (* (magnitude z) (sin (angle z))))
  (define (make-from-real-imag x y) 
    (cons (sqrt (+ (square x) (square y)))
          (atan y x)))

   ;; システムの他の部分とのインターフェース
  (define (tag x) (attach-tag 'polar x))
  (put 'real-part '(polar) real-part)
  (put 'imag-part '(polar) imag-part)
  (put 'magnitude '(polar) magnitude)
  (put 'angle '(polar) angle)
  (put 'make-from-real-imag 'polar
       (lambda (x y) (tag (make-from-real-imag x y))))
  (put 'make-from-mag-ang 'polar 
       (lambda (r a) (tag (make-from-mag-ang r a))))
  'done)
(install-polar-package)


(define (install-complex-package)
   ;; 直交座標と極座標パッケージから取り入れた手続き
  (define (make-from-real-imag x y)
    ((get 'make-from-real-imag 'rectangular) x y))
  (define (make-from-mag-ang r a)
    ((get 'make-from-mag-ang 'polar) r a))

(define (real-part z) (apply-generic 'real-part z))
(define (imag-part z) (apply-generic 'imag-part z))
(define (magnitude z) (apply-generic 'magnitude z))
(define (angle z) (apply-generic 'angle z))

   ;; 内部手続き
  (define (add-complex z1 z2)
    (make-from-real-imag (+ (real-part z1) (real-part z2))
                         (+ (imag-part z1) (imag-part z2)))
    )
  (define (sub-complex z1 z2)
    (make-from-real-imag (- (real-part z1) (real-part z2))
                         (- (imag-part z1) (imag-part z2))))
  (define (mul-complex z1 z2)
    (make-from-mag-ang (* (magnitude z1) (magnitude z2))
                       (+ (angle z1) (angle z2))))
  (define (div-complex z1 z2)
    (make-from-mag-ang (/ (magnitude z1) (magnitude z2))
                       (- (angle z1) (angle z2))))
  (define (equ? z1 z2)
    (and (= (real-part z1) (real-part z2))
         (= (imag-part z1) (imag-part z2))))

  (define (=zero? z)
    (= 0 (magnitude z)))

   ;; システムの他の部分へのインターフェース
  (define (tag z) (attach-tag 'complex z))
  (put 'add '(complex complex)
       (lambda (z1 z2) (tag (add-complex z1 z2))))
  (put 'sub '(complex complex)
       (lambda (z1 z2) (tag (sub-complex z1 z2))))
  (put 'mul '(complex complex)
       (lambda (z1 z2) (tag (mul-complex z1 z2))))
  (put 'div '(complex complex)
       (lambda (z1 z2) (tag (div-complex z1 z2))))
  (put 'equ? '(complex complex)
       (lambda (z1 z2) (equ? z1 z2)))
  (put '=zero? '(complex) =zero?)

  (put 'make-from-real-imag 'complex
       ; complex, 'rectangular
       (lambda (x y) (tag (make-from-real-imag x y))))
  (put 'make-from-mag-ang 'complex
       (lambda (r a) (tag (make-from-mag-ang r a))))

(put 'real-part '(complex) real-part)
(put 'imag-part '(complex) imag-part)
(put 'magnitude '(complex) magnitude)
(put 'angle '(complex) angle)


  'done)
(install-complex-package)

(define (make-complex-from-real-imag x y)
  ((get 'make-from-real-imag 'complex) x y)
  )

(define (make-complex-from-mag-ang r a)
  ((get 'make-from-mag-ang 'complex) r a))


; (p (make-scheme-number 3))
; (p (make-scheme-number 3))
;(p (make-complex-from-real-imag 3 4))
;(p (add (make-scheme-number 3) (make-scheme-number 3)))


(define a (make-scheme-number 3))
(define z (make-complex-from-real-imag 3 4))

(define (real-part z) (apply-generic 'real-part z))
(define (imag-part z) (apply-generic 'imag-part z))
(define (magnitude z) (apply-generic 'magnitude z))
(define (angle z) (apply-generic 'angle z))



; ; Louis Reasonerはzを図2.24に示すオブジェクトとして, 式(magnitude z)を評価しようとした. 驚いたことに答の5の代りに, 型(complex)には演算magnitudeは対応する手続きはないというapply-genericのエラーメッセージを得た. この対話をAlyssa P. Hackerに見せると, 彼女は「complex数に対して複素数の選択子は定義されていず, polarとrectangularだけ定義されているのが問題である. これが働くようにするには, complexパッケージに次のものを追加しなければならない」という:
;
; (put 'real-part '(complex) real-part)
; (put 'imag-part '(complex) imag-part)
; (put 'magnitude '(complex) magnitude)
; (put 'angle '(complex) angle)
;
; どうしてこれが働くか詳しく述べよ.
;A. これだけでは動かない。
; (define (add x y) (apply-generic 'add x y))
; 等と同様に generic で使用する手続きを用意し、
; complex パッケージに public, および private な real-part, imag-part... を用意する必要がある。

;(magnitude z)
; apply z
; (magnitude (make-complex-from-real-imag 3 4))
; eval make-complex-from-real-imag
; (magnitude (((get 'make-from-real-imag 'complex) 3 4)))
; eval get
; (define get (operation-table 'lookup-proc))
; (magnitude (((get 'make-from-real-imag 'complex) 3 4)))
;(apply-generic 'magnitude (make-complex-from-real-imag 3 4)))

; 2回呼び出される。 一番外の magnitude と install-complex-package の private な magnitude .
;(magnitude z)


; 問題 2.78
; scheme-numberパッケージの内部手続きは, 実質的には基本手続き+, -などを呼び出すだけである. 言語の基本手続きを直接呼び出すのは, 型タグシステムでは各データオブジェクトに型をつける必要があるので不可能である. しかし実際のところ, Lispの実装は, 内部的に使う型つきシステムになっている. 基本手続きsymbol?やnumber?などは, データオブジェクトがある型であるかどうかを決定する. 2.4.2節のtype-tag, contentsおよびattach-tagを修正し, この汎用システムがSchemeの内部型システムの利点が使えるようにせよ. つまり通常の数は, そのcarが記号scheme-numberである対ではなく, Schemeの数として表現されている点の他は, システムは前の通り働く.

(p (add 3 4))


; 問題 2.79
;
; 二つの数の等価をテストする等価述語equ?を定義し, 汎用算術演算パッケージに設定せよ. この演算は通常の数, 有理数および複素数に対して働くものとする.

(define (equ? x y) (apply-generic 'equ? x y))

; f
;(p (equ? 1 2))
; 5
;(p (equ? 1 1))
(p (equ? (make-rational 1.0 1.0) (make-rational 1.0 1.0)))
; true

(p (equ? z z))
; true
(p (equ? z (make-complex-from-real-imag 3 5)))
; false


; 問題 2.80
;引数が零かどうかテストする 汎用述語 =zero?を定義し, 汎用算術演算パッケージに設定せよ. この演算は通常の数, 有理数および複素数に対して働くものとする. 
(define (=zero? x) (apply-generic '=zero? x))
(p "(=zero? 0)")
(p (=zero? 0))
; true
(p "(=zero? 3)")
(p (=zero? 3))
; false

; 有理数
(p "有理数")
(p "(=zero? (make-rational 0 2))")
(p (=zero? (make-rational 0 2)))
; true

(p "(=zero? (make-rational 1.0 1.0))")
(p (=zero? (make-rational 1.0 1.0)))
; false

; (/ 0.0 0.0) だと nan


(p "複素数")
(p (=zero? z))
; false
(p (=zero? z))
(p "(=zero? (make-complex-from-real-imag 0 0))")
(p (=zero? (make-complex-from-real-imag 0 0)))
(p "(=zero? (make-complex-from-mag-ang 0 320))")
(p (=zero? (make-complex-from-mag-ang 0 320)))
; true


