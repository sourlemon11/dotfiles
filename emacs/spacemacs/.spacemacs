;;-*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.
;; Todo
;; atomic-chrome layer

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      ;; w3m
                                      ;; smtpmail-multi
                                      ;; org calendar
                                      ;; org-gcal
                                      ;; emacs-calfw
                                      ;; highlight-indent-guides
                                      molokai-theme
                                      gruvbox-theme
                                      exec-path-from-shell)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(
                                    ;; swiper
                                    ;; spinner
                                    ;; skewer-mode
                                    ;; scala-mode
                                    ;; sbt-mode
                                    ;; multiple-cursors
                                    ;; lv
                                    ;; haml-mode
                                    ;; grizzl
                                    ;; counsel
                                    ;; alert
                                    ;; highlight-indentation
                                    ;; nlinum
                                    ;; writeroom-mode
                                    ;; smex
                                    ;; smeargle; highlight recently edited code by git
                                    ;; slim-mode
                                    ;; scss-mode
                                    ;; pug mode
                                    ;; overseer ; lisp regression testing
                                    ;; org-mime
                                    ;; org-brain
                                    ;; live-py-mode
                                    ;; groovy-mode
                                    ;; groovy-imports
                                    ;; graphql
                                    ;; gradle-mode
                                    ;; font-lock+
                                    ;; flx-ido
                                    ;; disaster)
                                    )
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-but-keep-unused)

  (cond
   ((eq system-type 'gnu/linux)
    (setq-default
     ;; List of configuration layers to load.
     dotspacemacs-configuration-layers
     '(systemd
       (helm
        :variables
        helm-ag-command-option "-S"
        :config)
       gtags
       (git
        :variables
        ;; magit-auto-revert-mode t
        ;; magit-log-select-margin (list (t age-abbreviated magit-log-margin-width t 10))
        magit-refs-local-branch-format "%4c")
       ;; :config
       ;; (define-key magit-mode-map (kbd "M-w") 'spacemacs/rotate-windows)
       ;; ("C-h" . evil-window-left)
       ;; ("C-k" . evil-window-up)
       ;; ("M-w" . spacemacs/rotate-windows)
       ;; ("C-h" . evil-window-left)
       ;; ("C-k" . evil-window-up)
       ;; ("M-w" . spacemacs/rotate-windows)
       ;; ("C-l" . evil-window-right)
       ;; ("M-w" . spacemacs/rotate-windows)
       ;; (define-key magit-log-mode-map  (kbd "C-h") 'evil-window-left)
       ;; (define-key magit-refs-mode-map (kbd "C-h") 'evil-window-left)
       ;; (define-key magit-log-mode-map  (kbd "C-k") 'evil-window-up)
       ;; (define-key magit-refs-mode-map (kbd "C-k") 'evil-window-up)
       ;; (define-key magit-mode-map      (kbd "C-l") 'evil-window-right)
       ;; (define-key magit-log-mode-map  (kbd "M-w") 'spacemacs/rotate-windows)
       ;; (define-key magit-refs-mode-map (kbd "M-w") 'spacemacs/rotate-windows)
       ;; (define-key magit-mode-map      (kbd "M-w") 'spacemacs/rotate-windows)
       ;; (define-key magit-log-mode-map  (kbd "M-w") 'spacemacs/rotate-windows)
       (version-control
        :variables
        version-control-global-margin t
        version-control-diff-tool 'git-gutter+
        version-control-diff-side 'left)
       ;; diff-hl-side 'left
       ;; semantic ; IDE like features (refactoring)
       ;; imenu-list ; For function reference on sidebar
       ;; languages
       ;; lua
       emacs-lisp
       ;; markdown
       c-c++
       ;; csharp
       ;; sql
       ;; (latex
       ;;  :variables
       ;;  latex-build-command "LaTeX"
       ;;  TeX-view-program-selection '((output-pdf "Zathura" "zathura %o" "zathura")))
       javascript
       ;; rust
       ;; java
       ;; lua
       yaml
       colors
       (python
        :variables
        python-backend 'anaconda
        python-enable-yapf-format-on-save t
        python-sort-imports-on-save t
        flycheck-python-pycompile-executable "python3"
        python-shell-interpreter "python3"
        python-shell-interpreter-args '-i
        python-test-runner 'pytest
        python-indent-offset 4
        :config
        (define-key python-mode-map (kbd "C-j") 'evil-window-down)
        (define-key python-mode-map (kbd "C-h") 'evil-window-left)
        (define-key python-mode-map (kbd "C-k") 'evil-window-up)
        (define-key python-mode-map (kbd "C-l") 'evil-window-right)
        (define-key inferior-python-mode-map (kbd "C-j") 'evil-window-down)
        (define-key inferior-python-mode-map (kbd "C-h") 'evil-window-left)
        (define-key inferior-python-mode-map (kbd "C-k") 'evil-window-up)
        (define-key inferior-python-mode-map (kbd "C-l") 'evil-window-right))
       html
       ;; csv
       shell-scripts
       (dash
        :variables
        dash-docs-docset-newpath (expand-file-name "~/.docsets"))
       ;; (add-to-list 'zeal-at-point-mode-alist '(python-mode . "python"))
       ;; apps
       ;; mu4e
       ;; (elfeed
       ;;  :config
       ;;  elfeed-org
       ;;  :variables
       ;;  rmh-elfeed-org-files (list "~/Dropbox/org/feeds.org"))
       (org :variables
            org-agenda-files (list
                              (expand-file-name "~/Dropbox/org/agenda.org"))
            org-capture-templates
            '(("r" "respond ro email (mu4e)"
               entry (file+headline malb/inbox-org "Email")
               "* REPLY to [[mailto:%:fromaddress][%:fromname]] on %a\nDEADLINE: %(org-insert-time-stamp (org-read-date nil t \"+1d\"))\n%U\n\n"
               :immediate-finish t
               :prepend t)

              ("f" "file email (mu4e)"
               entry (file+headline malb/inbox-org "Email")
               "* %a by [[mailto:%:fromaddress][%:fromname]]\n%U\n\n%i%?\n"
               :immediate-finish nil
               :prepend nil)
              ("pn" "programming language notes"
               entry (function (
                                (file-name-extension (buffer-file-name))))))
            org-capture-templates-contexts
            '(("f" ((in-mode . "python-mode"))))
            org-export-backends (quote (ascii html icalendar latex md odt))
            )
       ;; Emacs Utilities
       ;; (ranger :variables
       ;;         ranger-ignored-extensions '("mkv" "iso" "mp4")
       ;;         ranger-max-preview-size 10
       ;;         ranger-show-preview t)
       ;; nginx
       fasd
       ;; pdf-tools
       (shell
        :variables
        shell-default-height 30
        shell-default-position 'bottom
        shell-default-shell 'eshell)
       spell-checking ; error, seems to be overiding dict val to nil
       syntax-checking
       (auto-completion :variables
                        auto-completion-complete-with-key-sequence-delay 1.2
                        auto-completion-return-key-behavior 'complete
                        auto-completion-tab-key-behavior 'cycle
                        auto-completion-complete-with-key-sequence nil
                        auto-completion-private-snippets-directory "~/.emacs.d/private/snippets/"
                        auto-completion-enable-snippets-in-popup t
                        auto-completion-enable-help-tooltip t
                        yas-also-auto-indent-first-line t
                        yas-indent-line 'fixed)
       ;; private ;;
       ;; tabbar
       ;; log
       ;; smarttab
       )))
   )
  )

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading t
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7)
                                (todos . 3))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         dracula
                         molokai
                         gruvbox
                         atomic-chrome
                         spacemacs-dark)
   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("DejaVu Sans Mono"
                               ;; "Input Mono Narrow"
                               :size 20
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non-nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ t
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout t
   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header t
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 75
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode t
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis t
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (push (expand-file-name "~/.config/spacemacs/") load-path)
  (require '_user-init) ;    ~/.config/spacemacs/_user-init.el
  (require '_font-config)) ; ~/.config/spacemacs/_font-config.el


(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  (add-hook 'find-file-hook 'rainbow-delimiters-mode-enable)
  (add-hook 'find-file-hook 'spacemacs/toggle-visual-line-navigation-on)

  (require '_defaults) ;  ~/.config/spacemacs/_defaults
  (require '_movement) ;  ~/.config/spacemacs/_movement
  (require '_buffers) ;   ~/.config/spacemacs/_buffers
  (require '_windows) ;   ~/.config/spacemacs/_windows
  (require '_layouts) ;   ~/.config/spacemacs/_layouts
  (require '_directory) ; ~/.config/spacemacs/_directory
  (require '_complete) ;  ~/.config/spacemacs/_complete
  (require '_helm) ;      ~/.config/spacemacs/_helm
  (require '_git) ;       ~/.config/spacemacs/_git
  (require '_apps) ;      ~/.config/spacemacs/_apps
  (require '_languages) ; ~/.config/spacemacs/_languages
  )

(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."


)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#080808" "#d70000" "#67b11d" "#875f00" "#268bd2" "#af00df" "#00ffff" "#b2b2b2"])
 '(package-selected-packages
   '(org-category-capture alert log4e gntp magit-popup magit skewer-mode simple-httpd json-snatcher json-reformat multiple-cursors js2-mode dash-docs haml-mode autothemer gitignore-mode fringe-helper git-gutter+ git-gutter git-commit with-editor transient flyspell-correct flycheck web-completion-data pos-tip smeargle scss-mode org-mime highlight-indentation flx-ido disaster zeal-at-point yapfify yaml-mode xterm-color ws-butler winum which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package undo-tree toml-mode toc-org tern tagedit systemd stickyfunc-enhance srefactor sql-indent spaceline slim-mode shell-pop sass-mode restart-emacs ranger rainbow-mode rainbow-identifiers rainbow-delimiters racer pyvenv pytest pyenv-mode py-isort pug-mode pip-requirements persp-mode pcre2el paradox orgit org-projectile org-present org-pomodoro org-download org-bullets open-junk-file omnisharp neotree multi-term move-text molokai-theme magit-gitflow macrostep lua-mode lorem-ipsum livid-mode live-py-mode linum-relative link-hint json-mode js2-refactor js-doc insert-shebang indent-guide imenu-list hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gtags helm-gitignore helm-flx helm-descbinds helm-dash helm-css-scss helm-company helm-c-yasnippet helm-ag gruvbox-theme google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ ggtags fuzzy flyspell-correct-helm flycheck-rust flycheck-pos-tip fish-mode fill-column-indicator fasd fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav elfeed-web elfeed-org elfeed-goodies dumb-jump dracula-theme diminish diff-hl define-word cython-mode company-web company-statistics company-shell company-quickhelp company-c-headers company-anaconda column-enforce-mode color-identifiers-mode coffee-mode cmake-mode clean-aindent-mode clang-format cargo auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
