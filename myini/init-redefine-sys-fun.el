

(defun find-file-copy (filename &optional wildcards)
  "Copy of find-file"
  (interactive
   (find-file-read-args "Find fsafsile: "
                        (confirm-nonexistent-file-or-buffer)))
  (let ((value (find-file-noselect filename nil nil wildcards)))
    (if (listp value)
	(mapcar 'switch-to-buffer (nreverse value))
      (switch-to-buffer value))))

(defun find-file (filename)
  "Open file with better suggestions 2018-02-04"
  (interactive
   (find-file-read-args "Find file: "
                        (confirm-nonexistent-file-or-buffer)))
  (setq fileflag nil)
  (cl-loop for x in
	   '(.pdf .eps .jpg .xlsx .xls .jpg .rmvb .mkv .mp4 .flv .mp3 .m4a
		  .bmp .png .skim .doc .docx .enl)
	   do (if (cl-search (format "%s" x) (downcase filename))
		  (setq fileflag t)))
  (if fileflag
      (shell-command (format "open \"%s\"" filename))
    (find-file-copy filename)))

(provide 'init-redefine-sys-fun)
