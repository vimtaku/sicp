

;50セント, 25セント, 10セント, 5 セント, 1セントがあるとして1ドル
;

;1ドル = 100 セント


(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

;(define uk-coins (list 100 50 20 10 5 2 1 0.5))
; uk
; (define (first-denomination kinds-of-coins)
;   (cond ((= kinds-of-coins 1) 0.5)
;         ((= kinds-of-coins 2) 1)
;         ((= kinds-of-coins 3) 2)
;         ((= kinds-of-coins 4) 5)
;         ((= kinds-of-coins 5) 10)
;         ((= kinds-of-coins 6) 20)
;         ((= kinds-of-coins 7) 50)
;         ((= kinds-of-coins 8) 100)
;         )
;   )


(display (count-change 100))
