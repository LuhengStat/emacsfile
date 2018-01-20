
(require 'org)

(setq org-agenda-files '("/Users/wlh/Documents/Personal/Org/"))

(eval-after-load 'org
  (progn
    (define-key org-mode-map (kbd "C-'") nil)))


(require 'org-ac)
(org-ac/config-default)



(setq org-todo-keyword-faces
      '(("TODO" . (:foreground "#fa8072" :weight bold))
	("DONE" . (:foreground "#86dc2f" :weight bold))
	("STARTED" . "yellow")
	("CANCELED" . (:foreground "blue" :weight bold))))



;; auto indent in the org-mode
(setq org-startup-indented t)

;; continue with the clock
(setq org-clock-continuously t)

(setq org-html-validation-link nil)


(eval-after-load 'org
  (progn
    (define-key org-mode-map (kbd "S-C-<left>") nil)
    (define-key org-mode-map (kbd "S-C-<right>") nil)
    (define-key org-mode-map (kbd "S-C-<down>") nil)
    (define-key org-mode-map (kbd "S-C-<up>") nil)
    (define-key org-mode-map (kbd "M-<left>") nil)
    (define-key org-mode-map (kbd "M-<right>") nil)))
    


(provide 'init-org)
