#lang scheme

#| Exercise 1.4 |#

(define (a-plus-abs-b a b)
  ((if (> b 0) + -)
   a b))


;; The (> b 0) condition tests whether b is +ve.
;; When b is +ve the if form returns the + operator
;; Else the if form returns the - operator
;; Neverthless we get a + |b|