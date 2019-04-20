(provide '_python)

;; movements
(defun user/python-movement()
  (define-key python-mode-map (kbd "C-j") 'evil-window-down)
  (define-key python-mode-map (kbd "C-h") 'evil-window-left)
  (define-key python-mode-map (kbd "C-k") 'evil-window-up)
  (define-key python-mode-map (kbd "C-l") 'evil-window-right)
  (define-key inferior-python-mode-map (kbd "C-j") 'evil-window-down)
  (define-key inferior-python-mode-map (kbd "C-h") 'evil-window-left)
  (define-key inferior-python-mode-map (kbd "C-k") 'evil-window-up)
  (define-key inferior-python-mode-map (kbd "C-l") 'evil-window-right))


(add-hook 'python-mode-hook 'user/python-movement)
