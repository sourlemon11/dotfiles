(provide '_movement)

;; Movement/Motion Bindings
;; (define-key evil-normal-state-map (kbd "j")(kbd "gj"))
;; (define-key evil-normal-state-map (kbd "k")(kbd "gk"))
;; (define-key evil-normal-state-map (kbd "\S-k")(kbd "kkkkk"))
;; (define-key evil-normal-state-map (kbd "\S-j")(kbd "jjjjj"))
(define-key evil-normal-state-map (kbd "H")(kbd "^"))
(define-key evil-motion-state-map (kbd "H")(kbd "^"))
(define-key evil-normal-state-map (kbd "L")(kbd "$"))
(define-key evil-motion-state-map (kbd "L")(kbd "$"))
(define-key evil-motion-state-map (kbd "C-i") 'evil-jump-forward)

(defun user/scroll-up-lines ()
  (interactive)
  (scroll-up-line 4))

(defun user/scroll-down-lines ()
  (interactive)
  (scroll-down-line 4))

(defun user/scroll-up-other-window()
  (interactive)
  (scroll-other-window 4))

(defun user/scroll-down-other-window()
  (interactive)
  (scroll-other-window-down 4))

;; Jumping
(setq evil-jumps-cross-buffers nil)

;; Scrolling
;; no auto scroll horizontal
(setq auto-hscroll-mode nil)
(defun gcm-scroll-down ()
  (interactive)
  (scroll-up))
(defun gcm-scroll-up ()
  (interactive)
  (scroll-down))
(global-set-key (kbd "C-d") 'gcm-scroll-down)
(define-key evil-normal-state-map (kbd "C-d") 'gcm-scroll-down)
(global-set-key (kbd "C-u") 'gcm-scroll-up)
(define-key evil-normal-state-map (kbd "C-u") 'gcm-scroll-up)
(global-set-key (kbd "M-d") 'scroll-other-window)
(global-set-key (kbd "M-u") 'scroll-other-window-down)

(global-set-key (kbd "M-f") 'user/scroll-up-other-window)
(global-set-key (kbd "M-b") 'user/scroll-down-other-window)


(global-set-key (kbd "C-f") 'user/scroll-up-lines)
(define-key evil-normal-state-map (kbd "C-f") 'user/scroll-up-lines)
(global-set-key (kbd "C-b") 'user/scroll-down-lines)
(define-key evil-normal-state-map (kbd "C-b") 'user/scroll-down-lines)

;; Formatting bindings
(define-key evil-normal-state-map (kbd "C-S-n") 'evil-paste-pop-next)
(define-key evil-normal-state-map (kbd "C-n") 'newline-and-indent)
(define-key evil-normal-state-map (kbd "+") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "-") 'evil-numbers/dec-at-pt)

;; Mouse Bindings
(global-set-key [triple-mouse-6] 'image-backward-hscroll)
(global-set-key [triple-mouse-7] 'image-forward-hscroll)
(global-set-key [double-mouse-6] 'image-backward-hscroll)
(global-set-key [double-mouse-7] 'image-forward-hscroll)

;; lisp movement
;; (defun user/lisp-keys ()
;;   (define-key evil-insert-state-map (kbd "C-h") 'sp-backward-symbol)
;;   (define-key evil-insert-state-map (kbd "C-l") 'sp-forward-symbol)
;;   (define-key evil-insert-state-map (kbd "C-k") 'sp-backward-sexp)
;;   (define-key evil-insert-state-map (kbd "C-j") 'sp-forward-sexp))

;; (add-hook 'emacs-lisp-mode-hook 'user/lisp-keys)

;; Searching bindings
(define-key evil-normal-state-map (kbd "C-/") 'helm-swoop)
(define-key evil-normal-state-map (kbd "M-/") 'evil-jump-to-tag) ; Remap from C-]
(define-key evil-normal-state-map (kbd "C-*") 'spacemacs/helm-swoop-region-or-symbol)
(global-set-key (kbd "C-p") 'helm-for-files)
(define-key evil-normal-state-map (kbd "C-p") 'helm-for-files)
