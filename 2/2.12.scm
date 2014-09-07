

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))


(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))


(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))


;3.5, +- 0.1だとすると
; percent は 3とか。

; 100:p = c:n
; n = pc/100
(define (make-center-percent c p)
  (let (
        (n (/ (abs (* c p)) 100))
       )
  (make-interval (- c n) (+ c n))
  )
)


; pc = 100n
; p = n*100 /c
(define (percent i)
 (let (
       (c (center i))
       (n (width i))
      )
  (abs (/ (* n 100) c))
 )
)


; 3.5
; 100:3.5
; 10:0.35
; 1:0.035

