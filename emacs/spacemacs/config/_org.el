(provide '_org)

(setq
 org-default-notes-file "~/Dropbox/org/notes.org"
 org-startup-indented t
 org-blank-before-new-entry '((heading . nil) (plain-list-item . nil)))

;; Org
;; (user/window-keys-in-mode-map org-mode-map)

;; Org-gcal
;; (require 'org-gcal)
(setq org-gcal-client-id "499759126631-0413mtmb53g4g083riom27d2on2poq0c.apps.googleusercontent.com"
      org-gcal-client-secret "R08KtD0zS1GoBO2sA9WTWxE2"
      org-gcal-file-alist '(((prin1 user/email-gmail) .  "~/Dropbox/org/schedule.org")))
