;;; rna-transcription.el -- RNA Transcription (exercism)

;;; Commentary:



;;; Code:

(defun to-rna (dna)
  (apply 'string
    (mapcar 'convert (string-to-list dna))))

(defun convert (stand)
  (case stand
    (?G ?C)
    (?C ?G)
    (?T ?A)
    (?A ?U)))

(provide 'rna-transcription)
;;; rna-transcription.el ends here
