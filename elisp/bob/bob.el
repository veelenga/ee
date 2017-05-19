;;; bob.el --- Bob exercise (exercism)

;;; Commentary:

;;; Code:

(defun response-for (phrase)
  (cond ((shout phrase) "Whoa, chill out!")
        ((question phrase) "Sure.")
        ((string-blank-p phrase) "Fine. Be that way!")
        (t "Whatever.")))

(defun question (s)
  (string-suffix-p "?" s))

(defun shout (s)
  (and (string-match "[A-Z]" s)
       (string= (upcase s) s)))

(provide 'bob)
;;; bob.el ends here
