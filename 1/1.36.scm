
(define (square x) (* x x))
(define tolerance 0.00001)

(define (close-enough? x y)
  (< (abs (- x y)) 0.001))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (display "abs is " )
    (display (abs (- v1 v2)))
    (newline)

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

(display (fixed-point
 (lambda (x) (/(log 1000) (log x)))
 10
 )
)

; 初期予測値を 10 としたとき
; 答えは 4.555532257016376
; abs の数は 33 になった。
; 初期予測値を 100 としたとき
; 答えは 4.555539351985717
; abs の数は 36 になった。





(display (fixed-point
 (lambda (x) (/ (+ (* x (log x)) (log 1000)) (* 2 (log x))) )
 100
 )
)

; 初期予測値を 10 としたとき
; 答えは 4.555536206185039
; abs の数は 10 になった。
; 初期予測値を 100 としたとき
; 答えは 4.555537256371144
; abs の数は 13 になった。

;2つを比べた時、平均をとったほうが1/3 程度の計算量になっている。





