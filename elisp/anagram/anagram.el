;;; anagram.el --- Anagram (exercism)

;;; Commentary:

;;; Code:

(require 'cl)

(defun anagrams-for (word dict)
  (let ((origin (footprint word))
        (anagram? (lambda (actual)
                   (and (not (string= word actual))
                        (equal origin (footprint actual))))))
    (remove-if-not anagram? dict)))

(defun footprint (string)
  (cl-sort (downcase string) '<))

(provide 'anagram)
;;; anagram.el ends here
