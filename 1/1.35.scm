

(define (square x) (* x x))
(define tolerance 0.00001)

(define (close-enough? x y)
  (< (abs (- x y)) 0.001))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)

    ; (display "v1 is")
    ; (display v1)
    ; (newline)
    ; (display "v2 is")
    ; (display v2)
    ; (newline)
    ; (display "abs is")
    ; (display (abs (- v1 v2)))

    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess)
)

(define (average x y)
 (/ (+ x y) 2.0)
)


;(1.2.2節の)黄金比φが変換x 1 + 1/xの不動点であることを示し, この事実を使いfixed-point手続きにより&\phi;を計算せよ.
; 変換x= 1 + 1/xの不動点であることを示す。
; 両辺に x をかけると x^2= x + 1となる
; 整理すると x^2 -x -1 = 0 となる
; これは ax^2 + bx + c = 0 で
; 解の公式 (-b +-√b^2-4ac) / 2a を当てはめると
; (1+- √5 /2) となる。これで x = phiが 求められた。
; よって x -> 1 + 1/x の不動点は phiである。

;; Q.この事実を使いfixed-point手続きにより&\phi;を計算せよ.
;; A.そのままでは収束しない ので x-> 1 + 1/x を変換して
;; 両辺に x を足して
;; (x^2+1)/2x + 1/2 とした。

(display (fixed-point
  (lambda (x) (+ 1 (/ 1 x))) 1.0)

  ; (lambda (x) (+ (/ (+ 1 (square x)) (* 2 x)) 0.5 ))
  ; 1
  ; )
)
;; 結果: 1.6180311591702674
;; 桁数を上げればもっと近似する。

; ファイは
;1.61803398875
;なのでほぼ等しい。



