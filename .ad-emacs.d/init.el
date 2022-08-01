;;     _    ____     ____ ___  _   _ _____ ___ ____
;;    / \  |  _ \   / ___/ _ \| \ | |  ___|_ _/ ___|
;;   / _ \ | | | | | |  | | | |  \| | |_   | | |  _
;;  / ___ \| |_| | | |__| |_| | |\  |  _|  | | |_| |
;; /_/   \_\____/   \____\___/|_| \_|_|   |___\____|
;;
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

;; Setup third party packages
(setq ad-packages-setup-file (with-conf-dir "packages.el"))
(load ad-packages-setup-file)

;;; Default
(setq custom-theme-directory (with-conf-dir "themes"))
(setq make-backup-files -1)
(setq vc-make-backup-files -1)

;; line-numbers
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)

;; Don't annoy me
(setq ring-bell-function 'ignore)
