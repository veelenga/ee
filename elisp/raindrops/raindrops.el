;;; raindrops.el --- raindrops (exercism)

;;; commentary:

;;; code:

(require 'cl)

(defun convert (n)
  "convert integer n to its raindrops string."
  (let ((s (concat
           (if (rem n 3) "Pling" "")
           (if (rem n 5) "Plang" "")
           (if (rem n 7) "Plong" ""))))
    (if (s-blank? s) (int-to-string n) s)))

(defun rem (n m)
  (zerop (% n m)))

(provide 'raindrops)
;;; raindrops.el ends here
