(provide '_git)

(setq  git-gutter-fr+-side 'left-fringe
       git-gutter+-modified-sign "~"
       git-gutter+-added-sign "+"    ;; multiple character is OK
       git-gutter+-deleted-sign "-"
       left-fringe-width 10
       user/magit-log-arguments '("--graph" "--color"))

(spacemacs/set-leader-keys "gg" 'magit-dispatch-popup)

(defun user/magit-setup ()
  ;; (async-shell-command '(st -e 'tig'))
  (start-process "tig-log" nil "st" "-e" "tig"))
;; (interactive)
;; (magit-log-current (magit-log-read-revs t) '("--graph" "--color"))
;; (evil-window-move-far-right)
;; (evil-window-split)
;; (magit-status)
;; (evil-window-left 1)
;; (golden-ratio)

;; (add-hook 'projectile-find-file-hook 'user/magit-setup)

;; (defun user/magit-set-keybindings ()
;;   (let 'magit-log-mode-map 'magit-status-mode-map))
;; (add-hook 'magit-log-mode-hook ')

;; Magit
(setq magit-log-margin '(t age-abbreviated magit-log-margin-width nil 10)
      magit-log-select-margin '(t age-abbreviated magit-log-margin-width nil 10))


