#lang scheme

#| Exercise 1.34 |#

(require racket/trace)

(define (f g)
  (g 2))

(define (square x)
  (* x x))

(f square)

(f (lambda (z) (* z (+ z 1))))


#|

When (f f) is evaluated. The second f which is the argument is a procedure. When this second f
gets applied in place of (g 2) -> (f 2) then it gives (2 2) but this can't be evaluated so will give
an error. The first 2 is not a procedure.

|#