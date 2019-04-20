(provide '_latex)

(setq-default TeX-master nil)
;; Auctex Latex
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(add-hook 'doc-view-mode-hook 'auto-revert-mode)
