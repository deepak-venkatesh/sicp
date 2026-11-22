#lang scheme

#| Exercise 1.9 |#

(require racket/trace)

(define (my-add a b)
  (if (= a 0)
      b
      (inc (my-add (dec a) b))))

(define (my-add-2 a b)
  (if (= a 0)
      b
      (my-add-2 (dec a) (inc b))))

(define inc
  (lambda (x)
    (+ x 1)))

(define decs
  (lambda (x)
    (- x 1)))

(trace my-add)

(trace my-add-2)


#|

> (my-add 4 6)
>(my-add 4 6)
> (my-add 3 6)
> >(my-add 2 6)
> > (my-add 1 6)
> > >(my-add 0 6)
< < <6
< < 7
< <8
< 9
<10
10

> (my-add-2 4 6)
>(my-add-2 4 6)
>(my-add-2 3 7)
>(my-add-2 2 8)
>(my-add-2 1 9)
>(my-add-2 0 10)
<10
10

The my-add is a linear recursive process as we can see in the trace that for every subsequent
call the function keeps adding to the stack a new function to process

In case of my-add-2 there is no growth in terms of recursive calls, it is simply an iteration.

Space complexity for my-add-2 will be 1 but for my-add it will be n

|#