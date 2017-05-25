;;; roman-numerals.el --- roman-numerals Exercise (exercism)

;;; Commentary:

;;; Code:

(defvar *romans*
  '((1000 "M" )
    ( 900 "CM")
    ( 500 "D" )
    ( 400 "CD")
    ( 100 "C" )
    (  90 "XC")
    (  50 "L" )
    (  40 "XL")
    (  10 "X" )
    (   9 "IX")
    (   5 "V" )
    (   4 "IV")
    (   1 "I" )))

(defun to-roman (n)
  (if (<= n 0) ""
      (let ((e (nearest n)))
        (concat (second e) (to-roman (- n (first e)))))))

(defun nearest (n)
  (find-if (lambda (x) (>= n (first x))) *romans*))

(provide 'roman-numerals)
;;; roman-numerals.el ends here
