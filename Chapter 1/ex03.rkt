#lang scheme

#| Exercise 1.3 |#

(define sum-of-square-larger
  (lambda (a b c)
    (cond ((and (<= c b) (<= c a))
           (+ (* a a) (* b b)))
          ((and (<= b a) (<= b c))
           (+ (* a a) (* c c)))
          (else (+ (* c c) (* b b))))))

