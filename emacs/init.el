;; Basic conifgurations
(setq scroll-bar-mode nil)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(message custom-file)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

;; Load color theme
(load-theme 'dracula t)

(require 'evil)
(evil-mode 1)
