
(ess-toggle-underscore nil)

;; auto-change the directionary to the position of the current file
;;(add-hook 'ess-mode-hook 'ess-use-this-dir)

;; set the default style, same with RStudio
(setq ess-default-style 'RStudio)


(require 'ess-view)
(setq ess-view--spreadsheet-program "/Applications/Table Tool.app/Contents/MacOS/Table Tool")


;;(require 'ess-R-object-popup)
;;(define-key ess-mode-map "\C-c\C-g" 'ess-R-object-popup)

;; ess quit R
(defun ess-abort ()
  (interactive)
  (kill-process (ess-get-process)))
(define-key ess-mode-map (kbd "C-c C-a") 'ess-abort)
(define-key inferior-ess-mode-map (kbd "C-c C-a") 'ess-abort)
(define-key ess-mode-map (kbd "C-x C-w") 'ess-view-inspect-df)
(define-key inferior-ess-mode-map (kbd "C-x C-w") 'ess-view-inspect-df)
(define-key ess-mode-map (kbd "s-r") 'ess-eval-region-or-function-or-paragraph-and-step)
(define-key inferior-ess-mode-map (kbd "RET") 'mydef-RET)

(add-hook 'inferior-ess-mode-hook 'visual-line-mode)

(provide 'init-ess)
