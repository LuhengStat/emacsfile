
;; Get tab completion in R script files
;; See this page here
;; https://stat.ethz.ch/pipermail/ess-help/2013-March/008719.html
;; Make sure that this is after the auto-complete package initialization

(auto-complete-mode)
(setq  ess-tab-complete-in-script t)
(setq ess-use-auto-complete t)
(ess-toggle-underscore nil)
(define-key ac-completing-map (kbd "M-h") 'ac-quick-help)
(define-key ac-completing-map "\M-n" nil) ;; was ac-next
(define-key ac-completing-map "\M-p" nil) ;; was ac-previous
(define-key ac-completing-map "\M-," 'ac-next)
(define-key ac-completing-map "\M-k" 'ac-previous)

;; auto-change the directionary to the position of the current file
;;(add-hook 'ess-mode-hook 'ess-use-this-dir)

;; set the default style, same with RStudio
(setq ess-default-style 'RStudio)


;;(require 'ess-view)
;;(setq ess-view--spreadsheet-program "/Applications/Table Tool.app/Contents/MacOS/Table Tool")

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

(add-hook 'inferior-ess-mode-hook 'visual-line-mode)

(provide 'init-ess)
