(provide '_mu4e)

(setq mu4e-mu-binary "/usr/bin/mu")

  ;;; Set up some common mu4e variables
;; (add-to-list 'load-path "~/.local/share/emacs/site-lisp/mu4e")
;; Use `org-store-link' to store links, and `org-insert-link' to paste them

(defun my-render-html-message ()
  (let ((dom (libxml-parse-html-region (point-min) (point-max))))
    (erase-buffer)
    (shr-insert-document dom)
    (goto-char (point-min))))

(setq mu4e-maildir "~/Mail"
      ;; mu4e-get-mail-command "offlineimap"
      mu4e-split-view 'vertical
      mu4e-update-interval (* 60 5)
      mu4e-view-prefer-html t
      mu4e-view-show-images t
      mu4e-show-images t
      mu4e-view-show-addresses t
      org-mu4e-convert-to-html t
      mu4e-change-filenames-when-moving t
      mu4e-attachment-dir "/tmp/"
      ;; close sent message buffers
      message-kill-buffer-on-exit t
      ;; mu4e-headers-fields '((:flags . 4)
      ;;                        (:from-or-to . 22)
      ;;                        (:date . 18)
      ;;                        (:subject . nil))
      mu4e-headers-date-format "%d-%m-%Y %H:%M"
      message-required-headers '(From To Date Subject)
      mu4e-confirm-quit nil
      mu4e-html2text-command 'mu4e-shr2text
      org-mu4e-link-query-in-headers-mode nil
      shr-color-visible-distance-min 8
      shr-color-visible-luminance-min 70
      user-work-signature (concat  "\n"))

(add-hook 'mu4e-view-mode-hook
          (lambda()
            ;; try to emulate some of the eww key-bindings
            (local-set-key (kbd "<tab>") 'shr-next-link)
            (local-set-key (kbd "<backtab>") 'shr-previous-link)))

(add-hook 'mu4e-compose-mode-hook 'yas-minor-mode)
(add-hook 'mu4e-compose-mode-hook 'auto-complete-mode)

;; Message view setup
(defun user/mu4e-view-mode-hook ()
  (setq word-wrap t)
  (setq truncate-lines nil))
(add-hook 'mu4e-view-mode-hook 'user/mu4e-view-mode-hook)

;; compose mode hook
(add-hook 'mu4e-compose-mode-hook #'(lambda () (auto-save-mode -1)))
(add-hook 'mu4e-compose-mode-hook 'mu4e-org-mode)

;; use imagemagick, if available
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))

(defun user/insert-sig-here ()
  "Insert the signature here "
  (interactive)
  (insert user-work-signature))

;; (setq mu4e-contexts
;;       `( ,(make-mu4e-context
;;            :name "gmail"
;;            :enter-func (lambda () (mu4e-message "Switch to the gmail context"))
;;            :match-func (lambda(msg)
;;                          (when msg
;;                            (string= (mu4e-message-field msg :maildir) "/gmail")))
;;            :vars '(
;;                    ;; local directories, relative to mail root
;;                    (mu4e-sent-folder . "/gmail/Sent")
;;                    (mu4e-drafts-folder . "/gmail/Drafts")
;;                    (mu4e-trash-folder . "/gmail/Trash")
;;                    (mu4e-refile-folder . "/gmail/All Mail")
;;                    ;; account details
;;                    (user-mail-address . (prin1 user/email-gmail))
;;                    (user-full-name . "")
;;                    (mu4e-user-mail-address-list . (prin1 user/email-gmail))
;;                    (mu4e-compose-context-policy 'ask)
;;                    ;; gmail saves every outgoing message automatically
;;                    (mu4e-sent-messages-behavior . sent)
;;                    (mu4e-maildir-shortcuts . (
;;                                               ("/personal/inbox" . ?p)
;;                                               ("/work/Inbox" . ?w)
;;                                               ("/gmail/inbox" . ?g)))

;;                    ;; outbound mail server
;;                    (smtpmail-smtp-server . "smtp.gmail.com")
;;                    ;; outbound mail port
;;                    (smtpmail-smtp-service . 465)
;;                    ;; use ssl
;;                    (smtpmail-stream-type . ssl)
;;                    ;; the All Mail folder has a copy of every other folder's contents,
;;                    ;; and duplicates search results, which is confusing
;;                    (mue4e-headers-skip-duplicates . t)))
;;          ,(make-mu4e-context
;;            :name "personal"
;;            :enter-func (lambda () ( mu4e-message "Switch to the personal context"))
;;            :match-func (lambda(msg)
;;                          (when msg
;;                            (string= (mu4e-message-field msg :maildir) "/work")))
;;            ;; :match-func (lambda(msg)
;;            ;;               (when msg
;;            ;;                 (mu4e-message-contact-field-matches msg :to
;;                    (prin1 'user/email-personal))))
;;            :vars '(
;;                    ;; local directories, relative to mail root
;;                    (mu4e-sent-folder . "/personal/Sent")
;;                    (mu4e-drafts-folder . "/personal/Draft")
;;                    (mu4e-trash-folder . "/personal/Trash")
;;                    (mu4e-refile-folder
;;                     (lambda (msg)
;;                       (cond
;;                        ;; messages sent directly to me go to /archive
;;                        ;; also `mu4e-user-mail-address-regexp' can be used
;;                        ;; Personal filters
;;                        ;; everything else goes to /archive
;;                        ;; important to have a catch-all at the end!
;;                        (t t))))
;;                    ;; account details
;;                    (user-mail-address . (prin1 user/email-personal))
;;                    (user-full-name . (alist-get 'first user/real-name))
;;                    (mu4e-user-mail-address-list . (user/email-personal))
;;                    (mu4e-compose-context-policy 'ask)
;;                    ;; (mu4e-headers-fields '((:flags . 4)
;;                    ;;                       (:from . 20)
;;                    ;;                       (:human-date . 10)
;;                    ;;                       (:subject)))
;;                    ;; personal saves every outgoing message automatically
;;                    (mu4e-sent-messages-behavior . sent)
;;                    (mu4e-maildir-shortcuts . (
;;                                               ("/personal/Inbox" . ?p)
;;                                               ("/work/Inbox" . ?w)
;;                                               ("/gmail/INBOX" . ?g)))

;;                    ;; outbound mail server
;;                    (smtpmail-smtp-server . "smtp.mail.yahoo.com")
;;                    ;; outbound mail port
;;                    (smtpmail-smtp-service . 465)
;;                    ;; use ssl
;;                    (smtpmail-stream-type . ssl)
;;                    ;; the All Mail folder has a copy of every other folder's contents,
;;                    ;; and duplicates search results, which is confusing
;;                    (mue4e-headers-skip-duplicates . t)))
;;          ,(make-mu4e-context
;;            :name "work"
;;            :enter-func (lambda () (mu4e-message "Switch to the work context"))
;;            :match-func (lambda(msg)
;;                          (when msg
;;                            (string= (mu4e-message-field msg :maildir) "/gmail")))
;;            :vars '(
;;                    ;; local directories, relative to mail root
;;                    (mu4e-sent-folder . "/work/Sent")
;;                    (mu4e-drafts-folder . "/work/Draft")
;;                    (mu4e-trash-folder . "/work/Trash")
;;                    (mu4e-refile-folder . "/work/Archive")
;;                    ;; account details
;;                    (user-mail-address . (prin1 user/email-work))
;;                    (user-full-name . "")
;;                    (mu4e-user-mail-address-list . (prin1 user/email-work))
;;                    (mu4e-compose-signature-auto-include nil)
;;                    ;; (message-signature-file . "~/.signature.html")
;;                    ;; (mu4e-compose-signature . user-work-signature)
;;                    (mu4e-compose-context-policy 'ask)
;;                    ;; gmail saves every outgoing message automatically
;;                    (mu4e-sent-messages-behavior . sent)
;;                    (mu4e-maildir-shortcuts . (
;;                                               ("/personal/Inbox" . ?p)
;;                                               ("/work/Inbox" . ?w)
;;                                               ("/gmail/INBOX" . ?g)))

;;                    ;; outbound mail server
;;                    (smtpmail-smtp-server . "smtp.mail.yahoo.com")
;;                    ;; outbound mail port
;;                    (smtpmail-smtp-service . 465)
;;                    ;; use ssl
;;                    (smtpmail-stream-type . ssl)
;;                    ;; the All Mail folder has a copy of every other folder's contents,
;;                    ;; and duplicates search results, which is confusing
;;                    (mue4e-headers-skip-duplicates . t)))))

(add-hook 'message-send-hook
          (lambda ()
            (unless (yes-or-no-p "Sure you want to send this?")
              (signal 'quit nil))))

(setq gnus-dired-mail-mode 'mu4e-user-agent)
(add-hook 'dired-mode-hook 'turn-on-gnus-dired-mode)

(require 'smtpmail)
;; (require 'smtpmail-multi)

(setq smtpmail-multi-associations
      (quote
       (((prin1 user/email-gmail) gmail)
        ((prin1 user/email-personal) personal)
        (prin1 user/email-work) work)))

(setq smtpmail-multi-default-account (quote personal)
      message-send-mail-function 'smtpmail-multi-send-it
      smtpmail-debug-info t
      smtpmail-debug-verbose t)

;; attach files
(require 'gnus-dired)
;; make the `gnus-dired-mail-buffers' function also work on
;; message-mode derived modes, such as mu4e-compose-mode
(defun gnus-dired-mail-buffers ()
  "Return a list of active message buffers."
  (let (buffers)
    (save-current-buffer
      (dolist (buffer (buffer-list t))
        (set-buffer buffer)
        (when (and (derived-mode-p 'message-mode)
                   (null message-sent-message-via))
          (push (buffer-name buffer) buffers))))
    (nreverse buffers)))
(defun user/open-url-from-register (&optional reg)
  (interactive)
  (let (last-reg (evil-get-register ?1))
    (message last-reg)))

(defun insert-current-date () (interactive)
       (insert (shell-command-to-string "echo -n $(date +%d-%m-%Y)")))
(defun insert-current-date-and-time () (interactive)
       (insert (shell-command-to-string "echo -n $(date \"+%d-%m-%Y %H:%M\")")))
(defun user/yas-comment-hash-width (total-width yas-text)
  "Comment block used in yas-snippet that determines the surrounding width of the comment title"
  ;; expression is inside let. variables are local only inside the let parens
  (let ((half-width (/ (- total-width 2 (string-width yas-text)) 2))
        (remain-width (% (- total-width 2 (string-width yas-text)) 2)))
    (if (eq remain-width 0)
        half-width
      (+ half-width remain-width))))
