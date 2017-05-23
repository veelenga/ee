;;; atbash-cipher.el --- Atbash-Cipher (exercism)

;;; Commentary:




;;; Code:

(defun encode (plaintext)
  "Encode PLAINTEXT to atbash-cipher encoding."
  (mapconcat
   (lambda (char-list) (apply 'string char-list))
   (seq-partition
    (delq nil
          (mapcar 'encode-char (string-to-list plaintext))) 5) " "))

(defun encode-char (c)
  (cond
   ((<= ?0 c ?9) c)
   ((<= ?a c ?z) (shift c))
   ((<= ?A c ?Z) (shift (downcase c)))
   (t nil)))

(defun shift(char)
  (- ?z (- char ?a)))

(provide 'atbash-cipher)
;;; atbash-cipher.el ends here
