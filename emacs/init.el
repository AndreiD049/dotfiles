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
(use-package counsel
  :diminish
  :bind (("C-s" . swiper)
	 :map ivy-minibuffer-map
	 ("TAB" . ivy-partial-or-done)
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

;; Color theme
(use-package dracula-theme
  :init (load-theme 'dracula t))

;; evil mode
(use-package evil
  :init (evil-mode 1))

;; Basic conifgurations
(setq inhibit-startup-message t)
(setq tab-always-indent 'complete)
(setq-default indent-tabs-mode nil)

(scroll-bar-mode nil)
(menu-bar-mode -1)
(tool-bar-mode -1)
(set-fringe-mode 10)

;; Disable bell
(setq visible-bell t)

;; Font configuration
(set-face-attribute 'default nil :font "JetBrainsMono Nerd Font Mono" :height 110)

;; Modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

;; LSP
(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (typescript-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)
;; if you are helm user
(use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; if you are ivy user
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; optionally if you want to use debugger
(use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; optional if you want which-key integration
(use-package which-key
    :config
    (which-key-mode))

(setenv "NODE_PATH" "/home/andrei/.nvm/versions/node/v14.18.3/lib/node_modules")

;; Typescript
(use-package typescript-mode
  :mode "\\.tsx\\"
  :config (typescript-mode))

;; Prettier
(use-package prettier
  :mode "\\.tsx?\\"
  :bind (("C-c f" . prettier-prettify)))
