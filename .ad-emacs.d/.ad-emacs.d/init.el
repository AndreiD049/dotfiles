;;; Utils and macros
(setq ad-core-folder-path (concat user-emacs-directory "core/"))
(load (concat ad-core-folder-path "utils.el"))

;;; Set new custom file
(setq custom-file (with-conf-dir "custom.el"))
(load custom-file)

;;; Load key-binding
(setq ad-keybindings-file (with-conf-dir "keybindings.el"))
(load ad-keybindings-file)

;;; Org setup
(setq ad-org-setup-file (with-conf-dir "org.el"))
(load ad-org-setup-file)

;;; Default
(setq custom-theme-directory (with-conf-dir "themes"))
(load-theme 'ad-default-light)
(setq make-backup-files nil)
;; line-numbers
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)
;; Minibuffer-completion.
(fido-mode t)
