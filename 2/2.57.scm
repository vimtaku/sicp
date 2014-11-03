
(define (p x)
  (display x)
  (newline)
)

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
           (make-product (multiplier exp)
                         (deriv (multiplicand exp) var))
           (make-product (deriv (multiplier exp) var)
                         (multiplicand exp))))
        ((exponentiation? exp)
           (make-product
             ; nu^(n-1)
             (make-product
               (exponentiation exp)
               (make-exponentiation (base exp) (- (exponentiation exp) 1))
             )
             ; (du/dx)
             (deriv (base exp) var)
           )
        )
        (else
         (error "unknown expression type -- DERIV" exp))))

(define (variable? x) (symbol? x))
(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))
(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))

(define (addend s)
  (cond ((not (pair? s)) 0)
        ((and (pair? s) (= 1 (length s)) (variable? (car s))) 0)
        (else (cadr s) )
  )
)

(define (augend s)
  (cond ((not (pair? s)) 0)
        ((and (pair? s) (= 1 (length s)) (variable? (car s))) 0)
        (else (append '(+) (cddr s)) )
  )
)

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

(define (multiplier p)
  (cond ((not (pair? p)) 1)
        ((and (pair? p) (= 1 (length p)) (variable? (car p))) 1)
        (else (cadr p) )
  )
)
(define (multiplicand p)
  (cond ((not (pair? p)) 1)
        ((and (pair? p) (= 1 (length p)) (variable? (car p))) 1)
        (else (append '(*) (cddr p)) )
  )
)

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))

(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        ((and (product? m1) (= (length m1) 1)) m2)
        ((and (product? m2) (= (length m2) 1)) m1)
        (else (list '* m1 m2))))

; (p (deriv '(+ x 3) 'x))
; (p (deriv '(* x y) 'x))
; (p (deriv '(* (* x y) (+ x 3)) 'x))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (exponentiation? x)
  (and (pair? x) (eq? (car x) '**))
)

(define (make-exponentiation b e)
  (cond ((=number? e 0) 1)
        ((=number? e 1) b)
        (else (list '** b e))
  )
)
(define (base p) (cadr p))
(define (exponentiation p) (caddr p))

; (p (deriv '(** x 3) 'x) )
; (p (deriv '(** x 2) 'x) )

