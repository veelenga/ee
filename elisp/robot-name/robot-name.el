;;; robot-name.el --- Robot Name (exercism)

;;; Commentary:
;;
;; Build a robot with a name like AA000, that can be reset
;; to a new name. Instructions are in README.md
;;

;;; Code:

(defun build-robot ()
  (list (new-robot-name)))

(defun robot-name (robot)
  (car robot))

(defun reset-robot (robot)
  (setf (nth 0 robot) (new-robot-name)))

(defun random-digit ()
  (int-to-string (random 10)))

(defun random-upcase-char ()
  (char-to-string (+ ?A (random (- ?Z ?A)))))

(defun new-robot-name ()
  (concat
   (random-upcase-char)
   (random-upcase-char)
   (random-digit)
   (random-digit)
   (random-digit)))

(provide 'robot-name)
;;; robot-name.el ends here
