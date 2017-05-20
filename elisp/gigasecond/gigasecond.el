;;; gigasecond.el --- Gigasecond exercise (exercism)

;;; Commentary:
;; Calculate the date one gigasecond (10^9 seconds) from the
;; given date.
;;
;; NB: Pay attention to  Emacs' handling of time zones and dst
;; in the encode-time and decode-time functions.

;;; Code:


(defun from (seconds minutes hours days months years)
  (let ((gigasecond (seconds-to-time (expt 10 9)))
        (date (encode-time seconds minutes hours days months years t)))
    (set-time-zone-rule t)
    (let ((result-date (decode-time(time-add date gigasecond))))
      (butlast result-date (- (length result-date) 6)))))

(provide 'gigasecond)
;;; gigasecond.el ends here
