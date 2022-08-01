;; Change this if you want a custom org directory
(setq org-directory "~/org")
(setq org-agenda-files (list org-directory))
(setq org-attach-store-link-p 'attached) ; When a file is attached, store an 'attachment' link to that file
(setq org-attach-id-dir ".attach/") ; Where to store attachments

(add-hook 'org-mode-hook
          #'(lambda ()
	      (progn
                (require 'org-tempo)
		(require 'org-attach-git) ; Commit changes to git automatically
	        (org-indent-mode t)
	        (setq org-id-link-to-org-use-id t))))
