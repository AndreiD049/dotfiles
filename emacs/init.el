;; Setting custom configuration file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load-file custom-file))

;; ======================================
;; Setting package manager & adding melpa
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("melpa-stable" . "https://stable.melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Init use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;; use-package installed
(require 'use-package)
(setq use-package-always-ensure t)
;; ======================================

;; Completion
(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
	 :map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done)
	 ("C-l" . ivy-alt-done)
	 ("C-j" . ivy-next-line)
	 ("C-k" . ivy-previous-line)
	 :map ivy-switch-buffer-map
	 ("C-k" . ivy-previous-line)
	 ("C-l" . ivy-done)
	 ("C-d" . ivy-switch-buffer-kill)
	 :map ivy-reverse-i-search-map
	 ("C-k" . ivy-previous-line)
	 ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

;; Basic conifgurations
(setq inhibit-startup-message t)

(scroll-bar-mode nil)
(menu-bar-mode -1)
(tool-bar-mode -1)
(set-fringe-mode 10)

;; Disable bell
(setq visible-bell t)

;; Font configuration
(set-face-attribute 'default nil :font "JetBrainsMono Nerd Font Mono" :height 110)

;; Load color theme
(load-theme 'dracula t)

(require 'evil)
(evil-mode 1)
