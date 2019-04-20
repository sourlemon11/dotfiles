(provide '_buffers)

;; Buffer Bindings
(global-set-key (kbd "M-[") 'previous-buffer)
(global-set-key (kbd "M-]") 'next-buffer)
(define-key evil-normal-state-map (kbd "M-]") 'next-buffer)
(define-key evil-normal-state-map (kbd "M-[") 'previous-buffer)

;; Buffer Bindings
(spacemacs/set-leader-keys (kbd "bo") 'spacemacs/kill-other-buffers)
(spacemacs/set-leader-keys (kbd "bm") nil) ; unset previous leader key

;; Hooks
(defun my-save-if-bufferfilename ()
  (if (buffer-file-name)
      (progn
        (save-buffer))
    (message "no file is associated to this buffer: do nothing")))
(add-hook 'evil-insert-state-exit-hook 'my-save-if-bufferfilename)
