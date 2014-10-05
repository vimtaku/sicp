

(define (split fsplit ssplit)
  (lambda (painter n)
      (if (= n 0)
          painter
          (let (
                (smaller ((split fsplit ssplit) painter (- n 1)))
               )
              (fsplit painter (ssplit smaller smaller))
          )
      )
  )
)
