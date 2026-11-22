#lang scheme

(require racket/trace)

#| Exercise 1.6 |#

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))




;; from the prog-square-root file

(define improve
  (lambda (guess x)
    (average guess (/ x guess))))

(define average
  (lambda (x y)
    (/ (+ x y) 2)))

(define good-enough?
  (lambda (guess x)
    (< (abs (- (square guess) x)) 0.001)))

(define square
  (lambda (x)
    (* x x)))

(define sqrt
  (lambda (x)
    (sqrt-iter 1.0 x)))


(trace sqrt-iter)

(sqrt 9)


#|

The new-if will never return since all expressions in it are evaluated.
The trace shows the same which never terminates. Numerically the procedures
converge to the answer but the recursion never terminates.

>(sqrt-iter 1.0 9)
> (sqrt-iter 5.0 9)
> >(sqrt-iter 3.4 9)
> > (sqrt-iter 3.023529411764706 9)
> > >(sqrt-iter 3.00009155413138 9)
> > > (sqrt-iter 3.000000001396984 9)
> > > >(sqrt-iter 3.0 9)
> > > > (sqrt-iter 3.0 9)
> > > > >(sqrt-iter 3.0 9)
> > > > > (sqrt-iter 3.0 9)
> > > >[10] (sqrt-iter 3.0 9)
> > > >[11] (sqrt-iter 3.0 9)
> > > >[12] (sqrt-iter 3.0 9)
> > > >[13] (sqrt-iter 3.0 9)
> > > >[14] (sqrt-iter 3.0 9)
> > > >[15] (sqrt-iter 3.0 9)
> > > >[16] (sqrt-iter 3.0 9)
.........

|#
