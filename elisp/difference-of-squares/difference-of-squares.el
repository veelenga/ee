;;; difference-of-squares.el --- Difference of Squares (exercism)

;;; Commentary:

;;; Code:

(eval-when-compile (require 'cl))

(defun square-of-sums (num)
  (expt (/ (* num (+ num 1)) 2) 2))

(defun sum-of-squares (num)
  (reduce #'+ (mapcar #'(lambda (i) (expt i 2)) (number-sequence 1 num))))

(defun difference (num)
  (- (square-of-sums num) (sum-of-squares num)))


(provide 'difference-of-squares)
;;; difference-of-squares.el ends here
