(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-quote-after-quote t)
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(cursor-type (quote box))
 '(custom-safe-themes
   (quote
    ("a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
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
 '(org-agenda-restore-windows-after-quit t)
 '(org-agenda-window-setup (quote only-window))
 '(org-clock-clocked-in-display (quote frame-title))
 '(org-clock-report-include-clocking-task t)
 '(package-selected-packages
   (quote
    (git-timemachine osx-dictionary magithub ztree flyspell-correct-popup rg youdao-dictionary use-package transpose-frame spacemacs-theme py-autopep8 popwin org-ac iedit highlight-parentheses flycheck expand-region exec-path-from-shell evil ess-view ess-R-data-view elpy dim counsel-projectile company-auctex cal-china-x browse-kill-ring autopair auto-complete-auctex ag ace-window)))
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
 '(sml/modified-char " * ")
 '(sml/name-width 33)
 '(tool-bar-mode nil)
 '(undo-tree-auto-save-history t))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:foreground "red" :height 1.2))))
 '(error ((t (:foreground "Red" :weight normal))))
 '(font-latex-script-char-face ((t (:foreground "burlywood"))))
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
 '(org-upcoming-deadline ((t (:foreground "blue violet"))))
 '(sml/modified ((t (:inherit sml/not-modified :foreground "black" :weight bold)))))


