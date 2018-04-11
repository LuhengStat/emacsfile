
(package-initialize)
(elpy-enable)
(add-hook 'elpy-mode-hook (lambda () (highlight-indentation-mode -1)))

(add-hook 'inferior-python-mode-hook 'visual-line-mode)
(define-key elpy-mode-map (kbd "C-x C-n") 'elpy-shell-send-group-and-step)

(setq python-shell-prompt-detect-failure-warning nil)
(setq python-shell-completion-native-enable nil) 
(setq python-shell-interpreter "jupyter"
      python-shell-interpreter-args "console --simple-prompt")


(provide 'init-python)


