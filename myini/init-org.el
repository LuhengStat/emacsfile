
(require 'org)

(setq org-agenda-files '("/Users/wlh/Documents/Personal/Org/"))
(custom-set-faces
 '(error ((t (:foreground "Red" :weight normal))))
 '(org-agenda-clocking ((t (:background "SkyBlue1")))))


(require 'org-ac)
(org-ac/config-default)


(setq org-todo-keyword-faces
      '(("TODO" . (:foreground "#fa8072" :weight bold))
	;;("DONE" . (:foreground "SeaGreen4" :weight bold))
	("STARTED" . "yellow")
	("CANCELED" . (:foreground "blue" :weight bold))))



;; auto indent in the org-mode
(setq org-startup-indented t)

;; continue with the clock
(setq org-clock-continuously nil)

(setq org-html-validation-link nil)


(eval-after-load 'org
  (progn
    (define-key org-mode-map (kbd "S-C-<left>") nil)
    (define-key org-mode-map (kbd "S-C-<right>") nil)
    (define-key org-mode-map (kbd "S-C-<down>") nil)
    (define-key org-mode-map (kbd "S-C-<up>") nil)
    (define-key org-mode-map (kbd "M-<left>") nil)
    (define-key org-mode-map (kbd "M-<right>") nil)
    (define-key org-mode-map (kbd "C-'") nil)))


(provide 'init-org)
