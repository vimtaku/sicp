
(define (p x)
  (display x)
  (newline)
)

(p (list 'a 'b 'c) )
;(a b c)

(p (list (list 'george)))
; e) ((george))
; ((george))

(p (cdr '((x1 x2) (y1 y2))) )
; e) ((y1 y2))
; ((y1 y2))

(p (cadr '((x1 x2) (y1 y2))) )
; e) (y1 y2)
; (y1 y2)

(p (pair? (car '(a short list))) )
; e) false
; #f

(p (memq 'red '((red shoes) (blue socks))))
; e) false
; #f

(p (memq 'red '(red shoes blue socks)))
; e) (shoes blue socks)
; 含むんだった..
; (red shoes blue socks)




