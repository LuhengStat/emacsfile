(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-quote-after-quote t)
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(fringe-mode (quote (nil . 0)) nil (fringe))
 '(hl-paren-colors
   (quote
    ("blue" "Red" "Magenta" "dark cyan" "dark goldenrod")))
 '(initial-scratch-message ";; Hello, Luheng.

")
 '(mark-ring-max 10)
 '(org-agenda-block-separator
   "=============================================================================")
 '(org-agenda-clock-consistency-checks
   (quote
    (:max-duration "10:00" :min-duration 0 :max-gap "0:05" :gap-ok-around
		   ("4:00")
		   :default-face
		   ((:background "turquoise")
		    (:foreground "balck"))
		   :overlap-face nil :gap-face nil :no-end-time-face nil :long-face nil :short-face nil)))
 '(org-agenda-current-time-string "now - - - - - - - - - - - - - - - - - - - - - - - -")
 '(org-agenda-files
   (quote
    ("~/Documents/Personal/Org/timelog.org" "~/Documents/Learning/FlashIdeas.org" "~/Documents/Personal/Org/othernotes.org" "/Users/wlh/Documents/Personal/Org/diary.org" "/Users/wlh/Documents/Personal/Org/goodhabit.org" "/Users/wlh/Documents/Personal/Org/workdiary.org")))
 '(org-agenda-restore-windows-after-quit t)
 '(org-agenda-window-setup (quote only-window))
 '(org-clock-clocked-in-display (quote frame-title))
 '(org-clock-report-include-clocking-task t)
 '(package-selected-packages
   (quote
    (magithub ztree flyspell-correct-popup rg youdao-dictionary use-package transpose-frame spacemacs-theme py-autopep8 popwin org-ac iedit highlight-parentheses flycheck expand-region exec-path-from-shell evil ess-view ess-R-data-view elpy dim counsel-projectile company-auctex cal-china-x browse-kill-ring autopair auto-complete-auctex ag ace-window)))
 '(projectile-mode t nil (projectile))
 '(projectile-mode-line
   (quote
    (:eval
     (format " Proj[%s]"
	     (projectile-project-name)))))
 '(safe-local-variable-values
   (quote
    ((projectile-project-name . Python)
     (projectile-project-name . Ref)
     (projectile-project-name . RCVCov)
     (projectile-project-name . "PhdThesis"))))
 '(save-abbrevs (quote silently))
 '(scroll-bar-mode nil)
 '(scroll-conservatively 1000)
 '(scroll-margin 3)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:foreground "red" :height 1.2))))
 '(error ((t (:foreground "Red" :weight normal))))
 '(font-latex-sectioning-0-face ((t (:inherit font-latex-sectioning-1-face :height 1.0))))
 '(font-latex-sectioning-1-face ((t (:inherit font-latex-sectioning-2-face :height 1.0))))
 '(font-latex-sectioning-2-face ((t (:inherit font-latex-sectioning-3-face :height 1.0))))
 '(font-latex-sectioning-3-face ((t (:inherit font-latex-sectioning-4-face :height 1.0))))
 '(font-latex-sectioning-4-face ((t (:inherit font-latex-sectioning-5-face :height 1.0))))
 '(font-latex-sectioning-5-face ((t (:foreground "blue4"))))
 '(font-latex-slide-title-face ((t (:inherit (variable-pitch font-lock-type-face) :weight bold :height 1.0))))
 '(font-latex-subscript-face ((t nil)))
 '(font-latex-superscript-face ((t nil)))
 '(font-latex-warning-face ((t (:foreground "red"))))
 '(iedit-occurrence ((t (:background "CadetBlue2"))))
 '(org-agenda-clocking ((t (:background "SkyBlue1"))))
 '(org-level-1 ((t (:inherit outline-1 :height 1.15))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.1))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.05))))
 '(org-upcoming-deadline ((t (:foreground "blue violet")))))


