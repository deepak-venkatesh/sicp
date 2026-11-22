#lang scheme

#| Exercise 1.8 |#

(define cube-iter
  (lambda (guess x)
    (if (good-enough? guess x)
        guess
        (cube-iter (improve guess x) x))))

(define improve
  (lambda (guess x)
    (/ (+ (/ x (square guess)) (* 2 guess)) 3)))

(define good-enough?
  (lambda (guess x)
    (< (abs (- (cube guess) x)) 0.001)))

(define square
  (lambda (x)
    (* x x)))

(define cube
  (lambda (x)
    (* x x x)))

(define cube-root
  (lambda (x)
    (cube-iter 1.0 x)))

