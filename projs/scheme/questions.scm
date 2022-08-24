(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))

;; Problem 15
;; Returns a list of two-element lists
(define (enumerate s)
  ; BEGIN PROBLEM 15
  (define (enumerate-iter s i) (
    if (null? s)
      s
      (cons
        (list i (car s))
        (enumerate-iter (cdr s) (+ i 1))
      )
  ))
  (enumerate-iter s 0)
)
  ; END PROBLEM 15

;; Problem 16

;; Merge two lists LIST1 and LIST2 according to INORDER? and return
;; the merged lists.
(define (merge inorder? list1 list2)
  ; BEGIN PROBLEM 16
  (define (merge-iter inorder? list1 list2 r) (
    cond
      ((null? list1) (append r list2))
      ((null? list2) (append r list1))
      ((inorder? (car list1) (car list2)) (
        merge-iter inorder? (cdr list1) list2 (append r (list (car list1)))
      ))
      (else (
        merge-iter inorder? list1 (cdr list2) (append r (list (car list2)))
      ))
  ))
  (merge-iter inorder? list1 list2 '())
)
  ; END PROBLEM 16


;; Optional Problem 1

;; Returns a function that checks if an expression is the special form FORM
(define (check-special form)
  (lambda (expr) (equal? form (car expr))))

(define lambda? (check-special 'lambda))
(define define? (check-special 'define))
(define quoted? (check-special 'quote))
(define let?    (check-special 'let))

;; Converts all let special forms in EXPR into equivalent forms using lambda
(define (let-to-lambda expr)
  (cond ((atom? expr)
         ; BEGIN PROBLEM 17
         expr
         ; END PROBLEM 17
         )
        ((quoted? expr)
         ; BEGIN PROBLEM 17
         expr
         ; END PROBLEM 17
         )
        ((or (lambda? expr)
             (define? expr))
         (let ((form   (car expr))
               (params (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM 17
           (cons 'lambda 
                (cons (map let-to-lambda params)
                    (map let-to-lambda body)))
           ; END PROBLEM 17
           ))
        ((let? expr)
         (let ((values (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM 17
            (define (zip lst) (
                list (map (lambda (e) (car e)) lst) (map (lambda (e) (cadr e)) lst)
            ))
            (define params (zip values))
            (cons
              (list 'lambda (car params) (let-to-lambda (car body)))
                ;; (cadr params)
                (map let-to-lambda (cadr params))
            )
           ; END PROBLEM 17
           ))
        (else
         ; BEGIN PROBLEM 17
         (map let-to-lambda expr)
         ; END PROBLEM 17
         )))



;; Problem 21 (optional)
;; Draw the hax image using turtle graphics.
(define (hax d k)
  ; BEGIN Question 21
  'replace-this-line
  )
  ; END Question 21
