

;aは左上、bは左下、cは右下とする
(define (make-rectangle a b c)
   (cons b (cons a c))
)

(define (height-rectangle rect)
    (abs (- (y-point (car rect)) (y-point (car (cdr rect)))))
)
(define (width-rectangle rect)
    (abs (- (x-point (car rect)) (x-point (cdr (cdr rect)))))
)

