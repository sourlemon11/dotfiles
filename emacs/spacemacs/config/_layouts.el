(provide '_layouts)

;; layout bindings
(global-set-key (kbd "s-[") 'persp-prev)
(global-set-key (kbd "s-]") 'persp-next)
;; (global-set-key (kbd "M-<tab>") 'spacemacs/jump-to-last-layout)

;; Custom Layouts
(spacemacs|define-custom-layout "learn-elisp"
  :binding "l"
  :body
  ;; (stuff to be done in the persp activating)
  ;; (a major mode like twittering-mode or whatever)
  (interactive)
  (find-file "~/.spacemacs")
  (split-window-below-and-focus)
  (find-file "~/programming/learnxinyminutes-docs/elisp.html.markdown")
  (emacs-lisp-mode))
(spacemacs|define-custom-layout "mu4e"
  :binding "m"
  :body
  (interactive)
  (mu4e))
(spacemacs|define-custom-layout "feed"
  :binding "f"
  :body
  (interactive)
  (elfeed)
  (switch-to-buffer "*elfeed-search*"))
(spacemacs|define-custom-layout "notes"
  :binding "n"
  :body
  (interactive)
  (find-file "~/Dropbox/org/index.org"))
