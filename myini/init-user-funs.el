
(defun MyDef-find-file (filename)
  "Open file with better suggestions 2018-02-04"
  (interactive
   (find-file-read-args "Find file: "
                        (confirm-nonexistent-file-or-buffer)))
  (setq fileflag nil)
  (cl-loop for x in
	   '(.pdf .eps .jpg .xlsx .xls .jpg .rmvb .mkv .mp4 .flv .mp3 .m4a
		  .skim .doc .docx .enl)
	   do (if (cl-search (format "%s" x) (downcase filename))
		  (setq fileflag t)))
  (if fileflag
      (shell-command (format "open \"%s\"" filename))
    (find-file filename)))

(defun MyDef-open-folder (filename)
  "Open folder of the current file"
  (interactive
   (find-file-read-args "Open Finder: "
                        (confirm-nonexistent-file-or-buffer)))
  (shell-command (format "open -R \"%s\"" filename)))

(defun MyDef-dired-find-file ()
  "let the dired mode can open file correctly"
  (interactive)
  (let ((find-file-run-dired t))
    (MyDef-find-file (dired-get-file-for-visit))))

(defun MyDef-dired-open-folder ()
  "let the dired mode can open file correctly"
  (interactive)
  (let ((find-file-run-dired t))
    (MyDef-open-folder (dired-get-file-for-visit))))

(add-hook 'dired-mode-hook
	  (lambda ()
	    (define-key dired-mode-map (kbd "<return>") 'MyDef-dired-find-file)
	    (define-key dired-mode-map (kbd "<s-return>") 'MyDef-dired-open-folder)))

(defun MyDef-counsel-projectile-find-file-action (file)
  "Find FILE and run `projectile-find-file-hook'."
  (interactive)
  (MyDef-find-file (projectile-expand-root file))
  (run-hooks 'projectile-find-file-hook))

(defun MyDef-counsel-projectile-open-folder-action (file)
  "Find FILE and run `projectile-find-file-hook'."
  (interactive)
  (MyDef-open-folder (projectile-expand-root file))
  (run-hooks 'projectile-find-file-hook))

(defun MyDef-counsel-projectile-find-file (&optional arg)
  "Jump to a file in the current project.

With a prefix ARG, invalidate the cache first."
  (interactive "P")
  (projectile-maybe-invalidate-cache arg)
  (ivy-read (projectile-prepend-project-name "Find file: ")
            (projectile-current-project-files)
            :matcher #'counsel--find-file-matcher
            :require-match t
            :action (lambda (x)
		      (with-ivy-window
			(MyDef-counsel-projectile-find-file-action x)))
            :caller 'MyDef-counsel-projectile-find-file))

(defun MyDef-counsel-projectile-open-folder (&optional arg)
  "Jump to a file in the current project.

With a prefix ARG, invalidate the cache first."
  (interactive "P")
  (projectile-maybe-invalidate-cache arg)
  (ivy-read (projectile-prepend-project-name "Open Finder: ")
            (projectile-current-project-files)
            :matcher #'counsel--find-file-matcher
            :require-match t
            :action (lambda (x)
		      (with-ivy-window
			(MyDef-counsel-projectile-open-folder-action x)))
            :caller 'MyDef-counsel-projectile-find-file))

(defun counsel-rg-jump (&optional initial-input initial-directory)
  "Jump to a file below the current directory.
List all files within the current directory or any of its subdirectories.
INITIAL-INPUT can be given as the initial minibuffer input.
INITIAL-DIRECTORY, if non-nil, is used as the root directory for search."
  (interactive
   (list nil
         (when current-prefix-arg
           (read-directory-name "From directory: "))))
  (counsel-require-program "find")
  (let* ((default-directory (or initial-directory default-directory)))
    (ivy-read "Find file: "
              (split-string
               (shell-command-to-string
                (concat "rg" " --files "))
               "\n" t)
              :matcher #'counsel--find-file-matcher
              :initial-input initial-input
              :action (lambda (x)
                        (with-ivy-window
                          (MyDef-find-file (expand-file-name x ivy--directory))))
              :preselect (counsel--preselect-file)
              :require-match 'confirm-after-completion
              :history 'file-name-history
              :keymap counsel-find-file-map
              :caller 'counsel-rg-jump)))

(defun counsel-rg-jump-to-folder (&optional initial-input initial-directory)
  "Jump to a file below the current directory.
List all files within the current directory or any of its subdirectories.
INITIAL-INPUT can be given as the initial minibuffer input.
INITIAL-DIRECTORY, if non-nil, is used as the root directory for search."
  (interactive
   (list nil
         (when current-prefix-arg
           (read-directory-name "From directory: "))))
  (counsel-require-program "find")
  (let* ((default-directory (or initial-directory default-directory)))
    (ivy-read "Open Finder: "
              (split-string
               (shell-command-to-string
                (concat "rg" " --files "))
               "\n" t)
              :matcher #'counsel--find-file-matcher
              :initial-input initial-input
              :action (lambda (x)
                        (with-ivy-window
                          (MyDef-open-folder (expand-file-name x ivy--directory))))
              :preselect (counsel--preselect-file)
              :require-match 'confirm-after-completion
              :history 'file-name-history
              :keymap counsel-find-file-map
              :caller 'counsel-rg-jump-to-folder)))




(provide 'init-user-funs)
