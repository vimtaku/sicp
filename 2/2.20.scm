

; (define (flatten x)
;     (cond ((null? x) '())
;           ((not (pair? x)) (list x))
;           (else (append (flatten (car x))
;                         (flatten (cdr x))))))

(define (same-parity . li)

    (define (inner-same-party f l fltd)
      (if (null? l)
          fltd
          (if (f (car l))
              (inner-same-party f (cdr l) (append fltd (list (car l))))
              (inner-same-party f (cdr l) fltd)
          )
      )
    )

    (cond ((null? li) (list))
          ((odd? (car li)) (inner-same-party odd? li (list)))
          (else (inner-same-party even? li (list)))
    )
)


;gosh> (filter odd? (list 1 2 3 5))

; (same-parity 1 2 3 4 5 6 7)
; (1 3 5 7)
;
; (same-parity 2 3 4 5 6 7)
; (2 4 6)
