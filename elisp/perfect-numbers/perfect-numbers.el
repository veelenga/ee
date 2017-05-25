;;; perfect-numbers.el --- perfect-numbers Exercise (exercism)

;;; Commentary:

;;; Code:


(defun perfect-numbers (n)
  (remove-if-not
   (lambda (x) (perfect-number? x)) (number-sequence 1 n)))

(defun perfect-number? (n)
  (= n (apply '+ (factors-of n))))

(defun factors-of (n)
  (remove-if-not
   (lambda (x) (zerop (% n x)))(number-sequence 1 (/ n 2))))

(provide 'perfect-numbers)
;;; perfect-numbers.el ends here
