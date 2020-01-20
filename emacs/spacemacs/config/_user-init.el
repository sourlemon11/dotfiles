(provide '_user-init) ; ~/.config/spacemacs/_user-init.el
(when (string-equal (window-system) "x") (require '_user-data))

;; to fix random freezes (find issue inside ~/.emacs.d/.cache/savehist)
(setq history-length 75)
(put 'minibuffer-history 'history-length 50)
(put 'evil-ex-history 'history-length 50)
(put 'kill-ring 'history-length 25)

(setq
 confirm-kill-processes nil
 frame-title-format "%b"
 evil-escape-delay 0.1
 evil-escape-unordered-key-sequence "fd"
 sh-shell "/bin/bash"
 paradox-github-token t
 ;; Evil
 evil-shift-round nil
 evil-move-cursor-back nil
 evil-search-highlight-persist nil
 dotspacemacs-visual-line-move-text t ; move visual line with J/K
 ;; scroll one line at a time (less "jumpy" than defaults)
 mouse-wheel-scroll-amount '(1 ((shift) . 1)) ;; one line at a time
 mouse-wheel-progressive-speed nil ;; don't accelerate scrolling
 scroll-step 1
 ;; Whitespace mode
 whitespace-style '(face tabs tab-mark indentation tab-mark)
 whitespace-display-mappings
 '((newline-mark 10 [172 10])
   (tab-mark 9 [9655 9]))

 ;; Evil jump
 ;; doesn't work
 ;; (add-hook 'evil-jumps-post-hook 'evil-scroll-line-to-center)
 ;; (add-hook 'evil-jumps-pre-hook 'evil-scroll-line-to-center)
 ;; Avy
 avy-all-windows 'all-frames

 ;; Fix escape for tern mode
 ;; (push 'term-mode evil-escape-excluded-major-modes)
 ;; Doesn't work
 ;; (evil-define-key 'insert term-mode-map (kbd "C-c") 'term-send-raw)

 ;; Indentation
 js2-basic-offset 2
 js-indent-level 2

 exec-path-from-shell-check-startup-files nil
 global-auto-revert-mode nil

 magit-log-arguments (quote ("--graph" "--color" "--decorate"))
 ;; Elfeed
 elfeed-search-filter "@1-week-ago +unread "
 global-prettify-symbols-mode t

 golden-ratio--value 1.60)
