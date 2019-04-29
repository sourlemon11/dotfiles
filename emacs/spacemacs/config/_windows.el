(provide '_windows)
(if (eq system-type 'gnu/linux)
    (progn
     (require 'i3 (concat (file-name-directory (or load-file-name
                                                   buffer-file-name))
                          "i3-emacs/i3.el"))
     (require 'i3-integration (concat (file-name-directory (or load-file-name
                                                               buffer-file-name))
                                      "i3-emacs/i3-integration"))
     (i3-one-window-per-frame-mode-on)))

;; (defmacro user/window-keys-in-mode-map (x-mode)
;;   "Overides C-hjkl keybindings in other modes. argument is either the mode"
;;   `(progn
;;      (define-key ,x-mode (kbd "C-j") 'evil-window-down)
;;      (define-key ,x-mode (kbd "C-h") 'evil-window-left)
;;      (define-key ,x-mode (kbd "C-k") 'evil-window-up)
;;      (define-key ,x-mode (kbd "C-l") 'evil-window-right)))

;; (defun user-config-set-hooks ()
;;   (setq org-default-notes-file "~/Dropbox/org/notes.org"))
;; (global-set-key (kbd "M-q") 'save-buffers-kill-emacs)

;; (setq user/scroll-other-window-lines 3)

;; (defun user/scroll-up-other-window-lines ()
;;   (interactive)
;;   (scroll-other-window user/scroll-other-window-lines))

;; (defun user/scroll-down-other-window-lines ()
;;   (interactive)
;;   (scroll-other-window (- user/scroll-other-window-lines)))

;; Window Bindings
;; IN PROGRESS
;; (defun eyebrowse--map--all--tabs ()
;;   (while (<= i 9)
;;     (global-set-key (mapconcat 'identity '("s" (i)) "-"))
;;     (setq i (1+ i))))

(with-eval-after-load 'golden-ratio
  (add-to-list 'golden-ratio-exclude-buffer-regexp ".*magit.*popup"))


(defun user/delete-window-and-buffer()
  (interactive)
  (spacemacs/kill-this-buffer)
  (spacemacs/delete-window))

(global-set-key (kbd "C-<tab>") 'eyebrowse-last-window-config)
(global-set-key (kbd "C-;") 'eyebrowse-prev-window-config)
(global-set-key (kbd "C-'") 'eyebrowse-next-window-config)
(global-set-key (kbd "C-1") 'eyebrowse-switch-to-window-config-1)
(global-set-key (kbd "C-2") 'eyebrowse-switch-to-window-config-2)
(global-set-key (kbd "C-3") 'eyebrowse-switch-to-window-config-3)
(global-set-key (kbd "C-4") 'eyebrowse-switch-to-window-config-4)
(global-set-key (kbd "C-5") 'eyebrowse-switch-to-window-config-5)
(global-set-key (kbd "C-6") 'eyebrowse-switch-to-window-config-6)

(global-set-key (kbd "C-.") 'other-window)
(global-set-key (kbd "C-,") 'prev-window)
(global-set-key (kbd "C-h") 'evil-window-left)
(global-set-key (kbd "C-j") 'evil-window-down)
(global-set-key (kbd "C-k") 'evil-window-up)
(global-set-key (kbd "C-l") 'evil-window-right)
;; (global-set-key (kbd "M-w") 'spacemacs/rotate-windows)
(global-set-key (kbd "C-=") 'evil-window-increase-height)
(global-set-key (kbd "C--") 'evil-window-decrease-height)
;; resize the windows
;; (define-key evil-normal-state-map (kbd "<left>"))

;; Custom Bindings From custom functions
(spacemacs/set-leader-keys "wD" 'user/delete-window-and-buffer)
