
; (display (hash-table-put! ht "3" 10))
; (display (hash-table-get ht "3"))

(define (count-change amount)
  (cc amount 5)
)
(define ht
 (make-hash-table)
)

(define (key amount coins)
  (+ (* 100000 amount) coins)
)
(define (memo amount coins result)
 (if (hash-table-exists? ht (key amount coins))
     (my_display (hash-table-get ht (key amount coins)))
     (and (hash-table-put! ht (key amount coins) result)
     result)
 )
)

(define (my_display x)
;  (display ",x is ")
;  (display x)
;  (newline)
x)


(define (my_display2 amount coins x)
;  (display "amount2 is ")
;  (display amount)
;  (display ",coins is ")
;  (display coins)
;  (display ",x is ")
;  (display x)
;  (newline)
x)

; (display (display 3))
; ;(display (and (hash-table-put! ht 3 2) 4))
; (display (memo 3 2))
; (display (memo 3 2))
; ; (display (hash-table-get ht 3))

(define (cc amount kinds-of-coins)
  (hash-table-get ht amount
      (cond ((= amount 0) 1)
            ((or (< amount 0) (= kinds-of-coins 0)) 0)
            (else (memo amount kinds-of-coins
                     (+
                      (cc amount (- kinds-of-coins 1))
                      (cc (- amount
                            (first-denomination kinds-of-coins))
                         kinds-of-coins))
                  )
            )
      )
  )
)

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(display (count-change 400))

; 1..4 -> 1(1)
; 5 -> 2(1,5)
; 10 -> 4(1, 1*5+5, 5*5, 10)
; 
