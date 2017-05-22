;;; binary.el --- Binary exercise (exercism)

;;; Commentary:

;;; Code:

(defun to-decimal (binary-string)
  (-reduce-from
   (lambda (x y) (+ (* x 2) (if (eq y ?1) 1 0)))
   0 (string-to-list binary-string)))

;; Or just
;;   (string-to-number binary-string 2)

(provide 'binary)
;;; binary.el ends here
