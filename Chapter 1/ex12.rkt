#lang scheme

#| Exercise 1.12 |#

;; Have made three sub exercises
;; 1) Compute exact coefficient of the binomial expansion
;; 2) Show all the coeffiecients of a specific binomial expansion
;; 3) Draw the Pascal's triangle (needed help for display from chatgpt)

;; Exact coefficient for the specific term in the binomial expansion
(define (pascal-coeff row col)
  (cond ((= (+ row 1) col) 1)
	((= col 1) 1)
	(else (+ (pascal-coeff (- row 1) (- col 1))
		 (pascal-coeff (- row 1) col)))))


;; List of coefficients
(define (pascal-binomial n)
  (define (build-row col)
    (cond ((> col (+ n 1)) '())
	  (else (cons (pascal-coeff n col)
		      (build-row (+ col 1))))))
  
  (build-row 1))


;; Print n spaces
(define (print-spaces n)
  (cond ((= n 0) 'done)
        (else
         (display " ")
         (print-spaces (- n 1)))))

;; Print the elements of a list without parentheses
(define (print-elements lst)
  (cond ((null? lst) 'done)
        (else
         (display (car lst))
         (display " ")
         (print-elements (cdr lst)))))

;; Print Pascal's triangle
(define (print-pascal n)
  (define (print-row row)
    (cond ((> row n) (void))
          (else
           (print-spaces (- n row))
           (print-elements (pascal-binomial row))
           (newline)
           (print-row (+ row 1)))))

  (print-row 0))