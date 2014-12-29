
(load "./myutil.scm")
(load "./table.scm")


(define (put-coercion type1 type2 proc)
  (put 'coercion (list type1 type2) proc)
  )

(define (get-coercion type1 type2)
  (get 'coercion (list type1 type2))
  )

(put 'type-tree 'trees
  ; 追加するときは塔の優先順位にしたがって追加する。
  (reverse (list 'complex 'real-number 'rational 'scheme-number)))

(define (index li tgt)
  (define (inner i li)
      (cond ((null? li) 0)
            ((eq? (car li) tgt) i)
            (else (inner (+ i 1) (cdr li)))))
  (inner 0 li)
)

(define (raise x) (apply-generic 'raise x))

; copy and edit from http://community.schemewiki.org/?sicp-ex-2.82
(define (install-coercion-package)
  (define (scheme-number->complex n)
    (make-complex-from-real-imag (contents n) 0))
  ; (define (scheme-number->rational n)
  ;   (make-rational (contents n) 1))
  ; (put-coercion 'scheme-number 'rational scheme-number->rational)
  ; (put-coercion 'scheme-number 'complex scheme-number->complex)


  (define (scheme-number->scheme-number n) n)
  (define (complex->complex z) z)
  (put-coercion 'scheme-number 'scheme-number scheme-number->scheme-number)
  (put-coercion 'complex 'complex complex->complex)

  ; s -> c
  (put-coercion 'scheme-number 'complex scheme-number->complex)


  'done)
(install-coercion-package)


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


; '(scheme-number complex takakkei)
; scheme-number->complex

(define (apply-man type-tags)
  (define (inner remain type-tags)
    (if (null? type-tags)
        false
        ; type-tags がまだ入ってる時
        (let ( (target (car type-tags)))
          (if (every (lambda (x)
                     (if (eq? target x)
                         true
                         (get-coercion target x))
                     )
                     (append remain type-tags)
                     )
              ; 見つかったらその関数を返す
              (get-coercion target
                  (find
                    (lambda (x)
                        (if (eq? target x) false (get-coercion target x))
                     )
                    (append remain type-tags))
                  )
              ; 見つからなかったら次へ
              (inner (append remain (list target)) (cdr type-tags))
          )
        )
      )
  )
  (inner '() type-tags)
)

;2.83 まで
(define (apply-generic op . args)
  (apply-generic 'drop
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (if (and (pair? type-tags) (>= (length type-tags) 2))
              (let ((type1 (car type-tags))
                    (type2 (cadr type-tags))
                    (a1 (car args))
                    (a2 (cadr args))
                   )
              (cond ((eq? type1 type2)
                     (apply apply-generic op (apply-generic op a1 a2) (cddr args))
                    )
                    (else
                        (let ((t1->t2 (get-coercion type1 type2))
                              (t2->t1 (get-coercion type2 type1))
                              (proc2 (apply-man type-tags))
                              )
                             (if proc2
                                 (if (eq? proc2 t1->t2)
                                     (apply apply-generic op (apply-generic op (t1->t2 a1) a2) (cddr args))
                                     (apply apply-generic op (apply-generic op a1 (t2->t1 a2)) (cddr args))
                                 )
                                 ; なかった
                                 (error "No method for these types" (list op type-tags))
                              )
                        )
                    )
                    )
              )
              ;引数の数が1以下
              (car args)
          )
          )))
  )
  )




;2.84
(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (if (and (pair? type-tags) (>= (length type-tags) 2))
              (let ((type1 (car type-tags))
                    (type2 (cadr type-tags))
                    (a1 (car args))
                    (a2 (cadr args))
                   )
              (cond ((eq? type1 type2)
                     (apply apply-generic op (apply-generic op a1 a2) (cddr args))
                    )
                    (else
                      (if (< (apply-generic 'tag-number a1)
                             (apply-generic 'tag-number a2))
                          (apply apply-generic op (append (list (raise a1)) (cdr args)))
                          (apply apply-generic op
                             (append (list a1) (list (raise a2)) (cddr args))))
                    ))
              )
              ;引数の数が1以下
              (car args)
          )
          ))))



; 2.85 apply-generic
; (define (apply-generic op . args)
;   (let ((type-tags (map type-tag args)))
;     (let ((proc (get op type-tags)))
;       (if proc
;           (apply proc (map contents args))
;           (if (and (pair? type-tags) (>= (length type-tags) 2))
;               (let ((type1 (car type-tags))
;                     (type2 (cadr type-tags))
;                     (a1 (car args))
;                     (a2 (cadr args))
;                    )
;               (cond ((eq? type1 type2)
;                      (apply apply-generic op (apply-generic op a1 a2) (cddr args))
;                     )
;                     (else
;                       (if (< (apply-generic 'tag-number a1)
;                              (apply-generic 'tag-number a2))
;                           (apply apply-generic op (append (list (raise a1)) (cdr args)))
;                           (apply apply-generic op
;                              (append (list a1) (list (raise a2)) (cddr args))))
;                     ))
;               )
;               ;引数の数が1以下
;               (car args)
;           )
;           )))
;
;   )



(define (add x y) (apply-generic 'add x y))
(define (sub x y) (apply-generic 'sub x y))
(define (mul x y) (apply-generic 'mul x y))
(define (div x y) (apply-generic 'div x y))
(define (exp x y) (apply-generic 'exp x y))

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
  ; 2.83 scheme -> rational
  (put 'raise '(scheme-number)
       (lambda (x) (make-rational x 1)))
  (put 'exp '(scheme-number scheme-number)
     (lambda (x y) (tag (expt x y))))

  ; tag-number
  (put 'tag-number '(scheme-number)
    (lambda (x)
      (index (get 'type-tree 'trees) 'scheme-number)
        ))
  (put 'project '(scheme-number)
    (lambda (x) x))
  (put 'drop '(scheme-number)
    (lambda (x) x)
       )

  'done)
(install-scheme-number-package)

(define (make-scheme-number n)
  ((get 'make 'scheme-number) n))

(define (install-rational-package)
   ;; 内部手続き
  (define (numer x) (car x)) ;分子
  (define (denom x) (cdr x)) ;分母
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
    (and (eq? (numer x) (numer y)) (eq? (denom x) (denom y)))
    )
  (define (nan? x) (not (= x x)))
  (define (=zero? x)
    (or (nan? (numer x)) (nan? (denom x)))
    )
  (define (project x)
    (make-scheme-number (round (/ (numer x) (denom x))))
      )

  (define (droppable? x)
    (let ((start x)
          (res (raise (project x)))
         )
         (apply-generic 'equ? (tag start) res)
    ))

  (define (drop x)
    (if (droppable? x)
        (apply-generic 'drop (project x))
        (tag x)))

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
  (put 'raise '(rational)
       (lambda (x) (make-real-number (/ (numer x) (denom x))))
       )
  ; tag-number
  (put 'tag-number '(rational)
    (lambda (x)
      (index (get 'type-tree 'trees) 'rational)
        ))
  (put 'project '(rational) project)
  (put 'drop '(rational) drop)

  'done)
(install-rational-package)

(define (make-rational n d)
  ((get 'make 'rational) n d))


; 実数
(define (install-real-number-package)

  (define (project x) (round x))

  (define (droppable? x)
    (let ((start x)
          (res (raise (project x))))
         (apply-generic 'equ? res start)
    ))

  ; for drop
  (define (down x)
    (make-rational x 1))

  (define (drop x)
    (if (droppable? x)
        (apply-generic 'drop (down x))
        x))

   ;; システムの他の部分とのインターフェース
  (define (tag x) (attach-tag 'real-number x))
  (put 'add '(real-number real-number)
       (lambda (x y) (tag (+ x y))))
  (put 'sub '(real-number real-number)
       (lambda (x y) (tag (- x y))))
  (put 'mul '(real-number real-number)
       (lambda (x y) (tag (* x y))))
  (put 'div '(real-number real-number)
       (lambda (x y) (tag (/ x y))))
  (put 'make 'real-number
       (lambda (x) (tag (/ x 1.0))))
  (put 'equ? '(real-number real-number)
       (lambda (x y) (= x y)))
  (put '=zero? '(real-number)
       (lambda (x) (= 0 x)))
  (put 'raise '(real-number)
       (lambda (x)
         (make-complex-from-real-imag x 0)))

  ; tag-number
  (put 'tag-number '(real-number)
    (lambda (x)
      (index (get 'type-tree 'trees) 'real-number)
        ))

  (put 'project '(real-number) project)
  (put 'drop '(real-number) drop)

  'done)
; 無いので実行
(install-real-number-package)

(define (make-real-number x)
  ((get 'make 'real-number) x))



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
  (define (project x)
    (make-real-number (real-part x)))

  (define (droppable? x)
    (let ((start (tag x))
          (res (raise (project (tag x)))))
         (apply-generic 'equ? res start)
    ))

  ; for drop
  (define (down x)
    (make-real-number (real-part x))
    )

  (define (drop x)
    (if (droppable? x)
        (apply-generic 'drop (project x))
        (tag x)))

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

  ; tag-number
  (put 'tag-number '(complex)
    (lambda (x)
      (index (get 'type-tree 'trees) 'complex)
        ))

  (put 'project '(complex) project)
  (put 'drop '(complex) drop)


  'done)
(install-complex-package)

(define (make-complex-from-real-imag x y)
  ((get 'make-from-real-imag 'complex) x y))

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

;a. Louisの強制型変換手続きが設定されると, apply-genericが型scheme-numberの二つの引数や型complexの二つの引数で, これらの型で表に見つからない手続きに対して呼び出されると, 何が起きるか. 例えば汎用べき乗演算: 
; 無限ループする?
; 正解した

(define (exp x y) (apply-generic 'exp x y))
; まず scheme number の exp から
;(p (exp 3 4))
; 81

; 無限ループ
;(p (exp z z))
; コード見ればわかるが、
;(apply-generic op (t1->t2 a1) a2))
; ここで、何も変わらないので無限ループする

; b
; 同じ型での変換はそもそも不要であるし、無限ループしているのでやめたほうが良い

; c
; 単純に cond の最初に追加してやった



;;;; 2.82
; テーブルに a->b, b->c の変換があって
; (apply-generic a c) などとした場合に
; 本当は a-> c で変換、対応して欲しいが、それがこの形だと出来ない。

;(p (apply-generic 'add (make-complex-from-real-imag 5 2) (make-complex-from-real-imag 5 2) 5) )
; 12

;(p (apply-generic 'add 3 z 5))
; 12

; (define somereal  (make-complex-from-real-imag 5 2))
; (p (add somereal somereal))
; ;(complex rectangular 10 . 4)
; (p (apply-generic 'add somereal 3 5 somereal))
; ;(complex rectangular 18 . 4)


; (p (make-real-number 5))
; (p (raise 5))
; (p (raise (raise 5)))
; (p (raise (raise (raise 5))))

; ; ; どちらも
; ; ; (real-number . 5.0)
; ; ; (real-number . 5.0)
; ;
; ;
; ; ;;;;;;;;;;; 2.84 ;;;;;;;;;;;;;;;;
; ; ; tag-number を用意して比較できるようにする
; ; ; 実装方針は タワーの配列を持っておいて、それが現れるのが速いほうが
; ; ; 大きいものとする
; ;
; (define (tag-number x) (apply-generic 'tag-number x))
; (p (tag-number 5)) ; 0
; (p (tag-number (raise 5))) ;1
; (p (tag-number (raise (raise 5)))) ;2
; (p (tag-number (raise (raise (raise 5))))) ;3
; (p (apply-generic 'add 5 (make-complex-from-real-imag 3 0)))


;
;
; ;;;;;;;;;;;;; 2.85
; まず各パッケージに project を定義する。
; project して raise した結果が、それを入れる状態と等しいなら droppable として
; dropし、そうでなければそのまま帰す。

; 複素数3+2i は drop 出来ない
(define start (make-complex-from-real-imag 3 2))
(p start)
(define res (raise (apply-generic 'project start)) )
(p res)
(p (eq? #f (apply-generic 'equ? start res)))

; ; 複素数3+0i は drop 出来る
(define start2 (make-complex-from-real-imag 3 0))
(p start2)
(define res2 (raise (apply-generic 'project start2)) )
(p res2)
(p (eq? #t (apply-generic 'equ? start2 res2)))
(p (apply-generic 'drop start2))

; ; start は drop しても 同じ。
(p (eq? #t (apply-generic 'equ? start (apply-generic 'drop start))))
; ; start2 は drop すると scheme number までいく
(p (eq? #t (apply-generic 'equ? 3.0 (apply-generic 'drop start2))))

(p (apply-generic 'drop (make-real-number 3.0)))
(p (apply-generic 'drop (make-real-number 3.0)))

;(define (drop x) (apply-generic 'drop x))

