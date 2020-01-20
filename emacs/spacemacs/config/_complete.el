(provide '_complete)

(setq-default
 auto-fill-function 'do-auto-fill)

;; yasnippets
(add-to-list 'yas-snippet-dirs "~/.emacs.d/private/snippets/yasnippet-snippets")
;; todo
;; (sp-local-pair 'csharp-mode "{" "}")
