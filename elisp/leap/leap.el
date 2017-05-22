;;; leap.el --- Leap exercise (exercism)

;;; Commentary:

;;; Code:

(defun divisible? (n by)
  (zerop (mod n by)))

(defun leap-year-p (year)
  (and (divisible? year 4)
       (or (divisible? year 400)
           (not (divisible? year 100)))))

(provide 'leap)
;;; leap.el ends here
