(provide '_dash)

;; Documentation of other languages in emacs aka dash
(defun dash-doc-buffer (doc)
  (interactive)
  (setq-local helm-dash-docsets '(doc)))
(add-hook 'js2-mode-hook '(dash-doc-buffer("JavaScript")))
;; (setq helm-dash-common-docsets '("Python" "Javascript" "C") dash-enable-fontlock t)
;; (setq helm-dash-common-docsets "Python 3")
