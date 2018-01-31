
(require 'org)

(setq org-todo-keyword-faces
      '(("TODO" . (:foreground "#fa8072" :weight bold))
	;;("DONE" . (:foreground "SeaGreen4" :weight bold))
	("STARTED" . "yellow")
	("CANCELED" . (:foreground "blue" :weight bold))))


(require 'org-ac)
(org-ac/config-default)

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


;; agenda views
(setq org-agenda-files '("/Users/wlh/Documents/Personal/Org/"))
(custom-set-faces
 '(error ((t (:foreground "Red" :weight normal))))
 '(org-agenda-clocking ((t (:background "SkyBlue1")))))

(setq org-agenda-span 'day)
(setq org-agenda-custom-commands
      '(("d" "Simple agenda view"
	 ((agenda "")
	  (alltodo "")))))

(defun MyDef-org-agenda-view ()
  "set a org-agenda-view i choose most"
  (interactive)
  (org-agenda nil "d"))

;; org-agenda
(global-set-key (kbd "C-c t") 'org-agenda)
(global-set-key [?\s-t] 'MyDef-org-agenda-view)

;; use org-agenda-view
(setq inhibit-splash-screen t)
(setq org-agenda-inhibit-startup t)
(org-agenda nil "d")
(delete-other-windows)


(defun my/org-clock-query-out ()
  "Ask the user before clocking out.
This is a useful function for adding to `kill-emacs-query-functions'."
  (if (and
       (featurep 'org-clock)
       (funcall 'org-clocking-p)
       (y-or-n-p "You are currently clocking time, clock out? "))
      (org-clock-out) 
    t)) ;; only fails on keyboard quit or error

;; timeclock.el puts this on the wrong hook!
(add-hook 'kill-emacs-query-functions 'my/org-clock-query-out)

(provide 'init-org)
