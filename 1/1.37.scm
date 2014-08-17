

; ; 再帰的プロセス
; (define (cont-frac n d k)
;   (if (= k 0)
;     0
;     (/ (n k) (+ (d k) (cont-frac n d (- k 1))))
;   )
; )


; 反復的プロセス
(define (cont-frac n d k)
  (define (iter n d k result)
    (if (= k 0)
      result
      (iter n d (- k 1) (+ (/ (n k) (+ result (d k)))))
    )
  )
  (iter n d k 0)
)


;(display (cont-frac 1.0 1.0 2))

(display (cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           11))

;; 10:   0.6179775280898876
;; 11:   0.6180555555555556
;; 12:   0.6180257510729613
;; 15:   0.6180344478216819
;; 20:   0.6180339850173578
;; 25:   0.6180339887802426
;; 50:   0.6180339887498948
;; 100:  0.6180339887498948
;; 1000: 0.6180339887498948

; 4桁の制度に必要な k は 11



