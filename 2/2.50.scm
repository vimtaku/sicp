
(define (flip-horiz painter)
  (transform-painter painter
                     (make-vect 1.0 0.0)   ; 新しいorigin
                     (make-vect 0.0 0.0)   ;edge1の新しい端点
                     (make-vect 1.0 1.0))) ;edge2の新しい端点

(define (rotate180 painter)
  (transform-painter painter
                     (make-vect 1.0 1.0)
                     (make-vect 0.0 1.0)
                     (make-vect 1.0 0.0)))

(define (rotate270 painter)
  (transform-painter painter
                     (make-vect 0.0 1.0)
                     (make-vect 0.0 0.0)
                     (make-vect 1.0 1.0)))
