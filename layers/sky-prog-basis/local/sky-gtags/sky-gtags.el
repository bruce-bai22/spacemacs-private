;; ---------------------------------------------------------------------------------------------------------------------------
;; Basic.
;; Deprecated, use counsel-gtags instead. And finally, use lsp.

(defsubst sky-gtags--get-dir-full-name (dir)
  "If the dir is string like ~/*, then replace ~ with /Users/Baitianyu"
  (let ((dir-name (directory-file-name dir)))
    (progn
      (if (string-equal "~" (substring dir-name 0 1))
          (concat "/Users/Baitianyu" (substring dir-name 1 (length dir-name)) "/")
        (concat "" dir-name "/")))))

(defsubst sky-gtags--label-option (label)
  "Get the --gtagslabel option string of shell command: gtags"
  (concat "--gtagslabel=" label))

;;;###autoload
(defun sky-gtags--make-gtags-sentinel (process event)
  "file process guide(callback) function."
  (when (eq (process-status process) 'exit)
    (if (zerop (process-exit-status process))
        (progn
          (message "Success: %s TAGS" "refresh")
          (kill-buffer (process-buffer process)))
      (progn
        (message "Failed: %s TAGS(%d)" "refresh" (process-exit-status process))
        (kill-buffer (process-buffer process))))))

;; ---------------------------------------------------------------------------------------------------------------------------
;; Create tags functions.

(defsubst sky-gtags--read-gtagslabel ()
  "When user call sky-gtags-create-tags, read the user's choice of gtagslabel"
  (let ((labels '("default" "native" "ctags" "new-ctags" "pygments")))
    (completing-read "GTAGSLABEL(Default: default): " labels nil t nil nil "default")))

(defsubst sky-gtags--create-dir-option (dir)
  "Get the destination directory of tag files."
  (let* ((gtags-make-dir-prefix (getenv "MAKEOBJDIRPREFIX"))
         (dir (concat gtags-make-dir-prefix (sky-gtags--get-dir-full-name dir))))
    (directory-file-name dir)))

(defsubst sky-gtags--insert-contents-to-file (file-name contents)
  "Insert contents to file \"file-name\". Create the file named \"file-name\" if not exists"
  (progn
    (find-file file-name)
    (erase-buffer)
    (insert contents)
    (save-buffer)
    (kill-buffer (find-buffer-visiting file-name))))

(defsubst sky-gtags--create-dir-gtagslabel (dir label)
  "Create dir if not exist, also create dir/gtagslabel if not exist. If dir/gtagslabel exists, refresh label info"
  (let* ((gtags-make-dir-prefix (getenv "MAKEOBJDIRPREFIX"))
         (dir (concat gtags-make-dir-prefix (sky-gtags--get-dir-full-name dir)))
         (gtagslabel-file-name (concat dir "/gtagslabel")))
    (if (not (file-exists-p dir))
        (mkdir dir t))
    (sky-gtags--insert-contents-to-file gtagslabel-file-name label)))

(defsubst sky-gtags--create-command (label dir)
  "Get the create tags command."
  (sky-gtags--set-global-update-env dir)
  (sky-gtags--create-dir-gtagslabel dir label)
  (concat "gtags" " -q" " " (sky-gtags--label-option label) " " (sky-gtags--create-dir-option dir)))

;;;###autoload
(defun sky-gtags-create-tags (dir label)
  "Main function of create action."
  (interactive
   (list (read-directory-name "Root Directory: ")
         (sky-gtags--read-gtagslabel)))
  (progn
    (setenv "MAKEOBJDIRPREFIX" "/Users/Baitianyu/.spacemacs.d/.tags")
    (let ((default-direcotry dir)
          (proc-buf (get-buffer-create "*sky-gtags-create*")))
      (let ((proc (start-file-process-shell-command "sky-gtags-create" proc-buf
                                                    (sky-gtags--create-command label dir))))
        (set-process-sentinel proc 'sky-gtags--make-gtags-sentinel)))))


;; ---------------------------------------------------------------------------------------------------------------------------
;; Update tags functions.

(defsubst sky-gtags--update-gtagslabel (gtags-dir)
  "Get gtagslabel which is saved during create process."
  (let ((gtagslabel-file-name (concat gtags-dir "/gtagslabel")))
    (progn
      (find-file gtagslabel-file-name)
      (setq gtagslabel (buffer-string))
      (kill-buffer (find-buffer-visiting gtagslabel-file-name))
      (sky-gtags--label-option gtagslabel))))

(defsubst sky-gtags--set-global-update-env (current-dir)
  "Set update global environment, here \"global\" means command tool global, not the \"global variable\" in lisp."
  (let* ((gtags-make-dir-prefix (getenv "MAKEOBJDIRPREFIX"))
         (dir (concat gtags-make-dir-prefix (sky-gtags--get-dir-full-name current-dir)))
         (components-of-dir (split-string dir "/"))
         (gtags-dir nil))
    (progn
      (while (> (length components-of-dir) 2)
        (let ((combined-dir (mapconcat 'identity components-of-dir "/")))
          (progn
            (if (file-exists-p combined-dir)
                (progn
                  (if (> (length (directory-files-recursively combined-dir "gtagslabel")) 0)
                      (progn
                        (setq-local gtags-dir combined-dir)
                        (setq-local components-of-dir nil))
                    (setq-local components-of-dir (append (butlast components-of-dir 2) '("")))))
              (setq-local components-of-dir (append (butlast components-of-dir 2) '("")))))))
      (if (not (> (length gtags-dir) 0))
          (error "No exist tags founded")
        (progn
          (setq-local default-directory (string-remove-prefix gtags-make-dir-prefix gtags-dir))
          (setenv "GTAGSROOT" default-directory)
          (setenv "GTAGSDBPATH" gtags-dir))))))

(defsubst sky-gtags--update-command (dir)
  "Get update command of update action."
  (let* ((gtags-dir (sky-gtags--set-global-update-env dir))
         (gtags-label (sky-gtags--update-gtagslabel gtags-dir)))
    (concat "global" " -u" " " gtags-label)))

;;;###autoload
(defun sky-gtags-update-tags ()
  "Main function of update action."
  (interactive)
  (setenv "MAKEOBJDIRPREFIX" "/Users/Baitianyu/.spacemacs.d/.tags")
  (let* ((current-dir (file-name-directory (buffer-file-name)))
         (proc-buf (get-buffer-create "*sky-gtags-update*")))
    (let ((proc (start-file-process-shell-command "sky-gtags-update" proc-buf
                                                  (sky-gtags--update-command current-dir))))
      (set-process-sentinel proc 'sky-gtags--make-gtags-sentinel))))

;; ---------------------------------------------------------------------------------------------------------------------------
;; Define minor mode.

;;;###autoload
(define-minor-mode sky-gtags-mode
  (lambda () ()))

(provide 'sky-gtags)
