;;; allergies.el --- Allergies Exercise (exercism)

;;; Commentary:

;;; Code:
(require 'cl)

(defvar *allergen-scores*
  '(("eggs" 1)
    ("peanuts" 2)
    ("shellfish" 4)
    ("strawberries" 8)
    ("tomatoes" 16)
    ("chocolate" 32)
    ("pollen" 64)
    ("cats" 128)))

(defun allergen (allergen-score)
  (first allergen-score))

(defun score (allergen-score)
  (second allergen-score))

(defun flagged? (flags allergen-score)
  (> (logand flags (score allergen-score)) 0))

(defun allergen-list (flags)
  (mapcar 
    (lambda (allergen-score) (allergen allergen-score))
    (remove-if-not
      (lambda (allergen-score) (flagged? flags allergen-score))
      *allergen-scores*)))

(defun allergic-to-p (n allergen)
  (member allergen (allergen-list n)))

(provide 'allergies)
;;; allergies.el ends here
