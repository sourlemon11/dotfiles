(provide '_defaults)

(golden-ratio-mode)

(setq
 powerline-default-separator 'bar
 dotspacemacs-line-numbers 'relative
 which-key-idle-delay 0.01
 which-key-idle-secondary-delay 0.01
 which-key-popup-type 'side-window
 eyebrowse-new-workspace t
 golden-ratio-mode t
 tab-width 2
 scroll-margin 5
 truncate-lines nil
 evil-move-beyond-eol nil
 helm-echo-input-in-header-line nil
 auto-completion-complete-with-key-sequence-delay 1.0
 ac-delay 1.0
 company-idle-delay 0.5
 ;; company-minimum-prefix-length 4
 browse-url-browser-function 'browse-url-generic
 browse-url-generic-program "firefox"
 shell-default-shell 'term
 mm-text-html-renderer 'w3m
 auto-fill-function 'do-auto-fill
 evil-want-Y-yank-to-eol t

 ;; Flycheck
 flycheck-check-syntax-automatically '(save mode-enabled)
 ispell-program-name "/usr/bin/hunspell"
 ispell-dictionary-alist '(("english" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil nil
                            nil utf-8))
 ispell-dictionary "en_US")
 ;; ispell-dictionary-alist "en_US"

(add-to-list 'exec-path "~/.local/include/npm-global/bin")
(add-to-list 'exec-path "~/.local/bin")
