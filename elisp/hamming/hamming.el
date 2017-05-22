;;; hamming.el --- Hamming (exercism)

;;; Commentary:

;;; Code:

(require 'cl)

(defun hamming-distance (dna1 dna2)
  (when (not (= (length dna1) (length dna2))) (error))
  (count nil (mapcar* 'char-equal dna1 dna2))
)


(provide 'hamming)
;;; hamming.el ends here
