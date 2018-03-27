
(elpy-enable)
;; For elpy
(setq elpy-rpc-python-command "python3")
;; For interactive shell
(setq python-shell-interpreter "python3")

(add-hook 'python-mode-hook #'elpy-mode)
(with-eval-after-load 'elpy
  (remove-hook 'elpy-modules 'elpy-module-flymake)
  ;;(add-hook 'elpy-mode-hook 'flycheck-mode)
  (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save))

(setq elpy-rpc-backend "jedi")  
(setenv "IPY_TEST_SIMPLE_PROMPT" "1")
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i")

(add-hook 'elpy-mode-hook (lambda () (highlight-indentation-mode -1)))

(provide 'init-python)
