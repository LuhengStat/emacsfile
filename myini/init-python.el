
(elpy-enable)

(add-hook 'elpy-mode-hook (lambda () (highlight-indentation-mode -1)))

(add-hook 'inferior-python-mode-hook 'visual-line-mode)

(defun mydef-RET ()
  "define RET behavior in python"
  (interactive)
  (setq current-line (what-line))
  (end-of-buffer)
  (if (string=  current-line (what-line))
      (comint-send-input)))
(define-key inferior-python-mode-map (kbd "RET") 'mydef-RET)

(define-key elpy-mode-map (kbd "C-c C-c") 'elpy-shell-send-group-and-step)
(define-key elpy-mode-map (kbd "C-c C-l") 'elpy-shell-send-region-or-buffer)

(defun mydef-eval-line ()
  "eval line and step"
  (interactive)
  (setq current-line (what-line))
  (elpy-shell-send-statement-and-step)
  (if (string=  current-line (what-line))
      (progn
	(end-of-line)
	(newline))))
(define-key elpy-mode-map (kbd "<C-return>") 'mydef-eval-line)

(define-key elpy-mode-map (kbd "s-r") 'elpy-shell-send-region-or-buffer)

(setq python-shell-prompt-detect-failure-warning nil)
(setq python-shell-completion-native-enable nil)

;; interactive python
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "--simple-prompt -c exec('__import__(\\'readline\\')') -i")
(setq python-shell-interpreter "python3"
      elpy-rpc-python-command "python3"
      python-shell-interpreter-args "-i")



;;(setq python-check-command (expand-file-name "~/.local/bin/flake8"))



(provide 'init-python)


