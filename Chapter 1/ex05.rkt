#lang scheme

#| Exercise 1.5 |#

(define (p)
  (p))

(define (test x y)
  (if (= x 0) 0 y))

;; My current interpreter which I believe is doing applicative order evaluation
;; Because for the else condition which is calling procedure y in the if clause
;; This p is getting evaluated even before the test begins
;; The p gets called on itself indefinitely
;; Thus under applicative order evaluation we will never terminate the call to (test 0 (p))


;; If it were normal order evlauation it would substitute all values first
;; This would lead to (if (= 0 0) 0 (p))
;; Now we would reduce and the predicate (= 0 0) will lead to 0 as the option in the then clause
;; Therefore we will get 0 as the answer


;; As an exercise I could write an interpreter or some method in which I can force my procedures to be evaluated via normal order evaluation
;; But I do not know how to do it at the moment