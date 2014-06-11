
(define (my_display3 amount minus coins x)
 (display "amount3 is ")
 (display amount)
 (display "minus is ")
 (display minus)
 (display ",coins is ")
 (display coins)
 (display ",x is ")
 (display x)
 (newline)
x)

(define (my_display2 amount coins x)
 (display "amount2 is ")
 (display amount)
 (display ",coins is ")
 (display coins)
 (display ",x is ")
 (display x)
 (newline)
x)

(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
 (display amount)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (my_display2 amount kinds-of-coins (cc amount
                     (- kinds-of-coins 1)))
                 (my_display3 amount (- amount
                        (first-denomination kinds-of-coins)) kinds-of-coins (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins))))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(display (count-change 11))

; 節の数54, 両替通り数 4
; 木の深さは 15 -> ほぼ n






;n quickrun 行数
;1 10
;2 14
;5 20
;10 40
;11 54
;20 150
;25 250
;30 400
;40 838
;49 1494
;50 1572
;51 1706
;52 1806
;53 1906
;60 2752
;75 5686
;100 15500
;200 229590
;320000000000

;300 1292592


;計算量 n^2のオーダー


