
(elpy-enable)
(add-hook 'elpy-mode-hook (lambda () (highlight-indentation-mode -1)))

(add-hook 'inferior-python-mode-hook 'visual-line-mode)

(defun MyDef-RET ()
  "define RET behavior in python"
  (interactive)
  (setq current-line (what-line))
  (end-of-buffer)
  (if (string=  current-line (what-line))
      (comint-send-input)))
(define-key inferior-python-mode-map (kbd "RET") 'MyDef-RET)

(define-key elpy-mode-map (kbd "C-x C-n") 'elpy-shell-send-group-and-step)

(defun MyDef-eval-line ()
  "eval line and step"
  (interactive)
  (setq current-line (what-line))
  (elpy-shell-send-statement-and-step)
  (if (string=  current-line (what-line))
      (progn
	(end-of-line)
	(newline))))
(define-key elpy-mode-map (kbd "C-x C-j") 'MyDef-eval-line)

(define-key elpy-mode-map (kbd "s-r") 'elpy-shell-send-region-or-buffer)

(setq python-shell-prompt-detect-failure-warning nil)
(setq python-shell-completion-native-enable nil) 
(setq python-shell-interpreter "jupyter"
      python-shell-interpreter-args "console --simple-prompt")


(provide 'init-python)


