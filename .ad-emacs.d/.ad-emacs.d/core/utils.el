;; I want to call this macro like this:
;; (with-conf-dir "file.el")
;; Which should expand to file.el located in my emacs config directory
;; Ex: "~/.emacs.d/file.el"
(defmacro with-conf-dir (&rest files)
  "Expands to the full path to the file located in the user-emacs-directory"
  (concat user-emacs-directory
	  (mapconcat #'(lambda (f) f) files "/")))

;; Keymaps
(defmacro with-global-key (list)
  "Read first two elements from the list and set the key (first element)
to the function (second element)"
  `(global-set-key (kbd (pop ,list)) (pop ,list)))

(defun with-keys (&rest key-command-pairs)
  "Used to generate global keymaps.
Arguments are passed as pairs of KEY (that will be wrapped into kbd later)"
  (if (/= (mod (length key-command-pairs) 2) 0)
      (error "Expected pair arguments. Example: 'C-z' dired-grep")
    (while key-command-pairs
      (with-global-key key-command-pairs))))
