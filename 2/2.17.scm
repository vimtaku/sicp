; (define (last-pair li)
;   (define (last-pair-iter l)
;     (if (null? (cdr l))
;       ;(list (car l))
;       l
;       (last-pair-iter (cdr l))
;     )
;   )
;   (if (null? li)
;     (list)
;     (last-pair-iter li)
;   )
; )
; ;;; これよく見たら内側意味ないし、空は与えられないので
; (define (last-pair l)
;     (if (null? (cdr l))
;       l
;       (last-pair (cdr l))
;     )
; )
;

;;; head と tail を渡すと持っと綺麗に書ける by kato
(define (last-pair li)
  (define (last-pair-iter head tail)
    (if (null? tail)
      head
      (last-pair-iter (car tail) (cdr tail))
    )
  )
  (if (null? li)
    (list)
    (list (last-pair-iter (car li) (cdr li)))
  )
)
