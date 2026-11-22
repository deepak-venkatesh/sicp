#lang scheme

#| Exercise 1.7 |#


#|

The python code plots the changes in the algorithm to generate more accurate square roots.

Large-number experiment

The original procedure has several visible percentage-error spikes. The improved procedure remains at or extremely close to zero on your plotted scale.


Small-number experiment

The original procedure exhibits errors ranging from small fractions of a percent to hundreds of thousands of percent. Your improved procedure remains extremely close to the reference results.
The improvement is dramatic.

|#

(define sqrt-iter
  (lambda (guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x))))

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

(define my-sqrt
  (lambda (x)
    (sqrt-iter 1.0 x)))

(define percent-diff
  (lambda (x)
    (* (/ (abs (- (my-sqrt x) (sqrt x))) (sqrt x)) 100))) ;; ideally use let for (sqrt x) to reduce the repetitive calculation

(define percent-diff-let
  (lambda (x)
    (let ((y (sqrt x)))
      (* (/ (abs (- (my-sqrt x) y)) y) 100)))) ;; using let in this procedure

(define percent-diff-improved
  (lambda (x)
    (let ((y (sqrt x)))
      (* (/ (abs (- (my-sqrt-improved x) y)) y) 100))))


;; Improving the accuracy

(define sqrt-iter-improved
  (lambda (old-guess x)
    (let ((new-guess (improve old-guess x)))
      (if (good-enough-improved? old-guess new-guess)
          new-guess
          (sqrt-iter-improved new-guess x)))))

(define good-enough-improved?
  (lambda (old-guess new-guess)
    (< (/ (abs (- old-guess new-guess)) old-guess) 0.0000001)))

(define my-sqrt-improved
  (lambda (x)
    (sqrt-iter-improved 1.0 x)))


;; generate CSV files for plotting in Python

(define (generate-csv filename numbers)
  (call-with-output-file filename
    (lambda (out)
      (displayln "x,original_error,improved_error" out)

      (for-each
       (lambda (x)
         (fprintf out "~a,~a,~a\n"
                  x
                  (percent-diff-let x)
                  (percent-diff-improved x)))
       numbers))
    #:exists 'replace))


#|

A. Data Sets for small and large numbers put into a csv file for the non improved procedures

> (generate-csv
 "sqrt-test.csv"
 '(2 3 4 5 10 100 1000 12371378 72367896526 2936978657651876578177882))

> (generate-csv
 "sqrt-test.csv"
 '(0.1 0.01 0.001 0.0001 0.0000276153 0.00000002734672864 0.00000000002734627346))


B. Data Sets for small and large numbers put into a csv file for the improved procedures

> (generate-csv
 "sqrt-test.csv"
 '(2 3 4 5 10 100 1000 12371378 72367896526 2936978657651876578177882))

> (generate-csv
 "sqrt-test.csv"
 '(0.1 0.01 0.001 0.0001 0.0000276153 0.00000002734672864 0.00000000002734627346))

|#