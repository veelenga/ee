;;; perfect-numbers.el --- perfect-numbers Exercise (exercism)

;;; Commentary:

;;; Code:


(defun perfect-numbers (n)
  (remove-if-not
   (lambda (x) (perfect-number? x)) (number-sequence 2 n)))

(defun perfect-number? (n)
  (= n (apply '+ (factors-of n))))

(defun factors-of (n)
  (loop with factors = (list)
        for i in (number-sequence 2 (1+ (isqrt n)))
        do
        (when (zerop (% n i))
          (push i factors)
          (let ((d (/ n i))) (when (not (= i d)) (push d factors))))
        finally return (-uniq (push 1 factors))))

(provide 'perfect-numbers)
;;; perfect-numbers.el ends here
