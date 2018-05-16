(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-quote-after-quote t)
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(auto-theme-mode t)
 '(beacon-color "#c82829")
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(cursor-type (quote box))
 '(custom-enabled-themes (quote (sanityinc-tomorrow-night)))
 '(custom-safe-themes
   (quote
    ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "7153b82e50b6f7452b4519097f880d968a6eaf6f6ef38cc45a144958e553fbc6" "5e3fc08bcadce4c6785fc49be686a4a82a356db569f55d411258984e952f194a" "a0feb1322de9e26a4d209d1cfa236deaf64662bb604fa513cca6a057ddf0ef64" "ab04c00a7e48ad784b52f34aa6bfa1e80d0c3fcacc50e1189af3651013eb0d58" "04dd0236a367865e591927a3810f178e8d33c372ad5bfef48b5ce90d4b476481" "7356632cebc6a11a87bc5fcffaa49bae528026a78637acd03cae57c091afd9b9" "ee4dcfcb646d4ad11fe1bd90ed111e3e59a78703325fdef347b50a39ccba13d7" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(diary-entry-marker (quote font-lock-variable-name-face))
 '(ess-ask-for-ess-directory nil)
 '(fancy-splash-image "nil.png")
 '(fci-rule-color "#404040")
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(frame-background-mode (quote light))
 '(gnus-logo-colors (quote ("#4c8383" "#bababa")) t)
 '(graphviz-dot-auto-indent-on-semi nil)
 '(graphviz-dot-auto-preview-on-save t)
 '(graphviz-dot-delete-completions t)
 '(graphviz-dot-preview-extension "pdf")
 '(hl-paren-colors
   (quote
    ("blue" "Red" "Magenta" "dark cyan" "dark goldenrod")))
 '(initial-scratch-message ";; Hello, Luheng.

")
 '(mark-ring-max 10)
 '(mode-line-format
   (quote
    ("%e" mode-line-front-space mode-line-mule-info mode-line-client mode-line-modified mode-line-remote mode-line-frame-identification mode-line-buffer-identification sml/pos-id-separator mode-line-position sml/pre-modes-separator mode-line-modes mode-line-misc-info mode-line-end-spaces)))
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
    (markdown-mode graphviz-dot-mode flyspell-correct-popup flyspell-correct-ivy smart-mode-line git-timemachine osx-dictionary magithub ztree rg youdao-dictionary use-package transpose-frame spacemacs-theme py-autopep8 popwin org-ac iedit highlight-parentheses flycheck expand-region exec-path-from-shell evil ess-view ess-R-data-view elpy dim counsel-projectile company-auctex cal-china-x browse-kill-ring autopair auto-complete-auctex ag ace-window)))
 '(projectile-mode t nil (projectile))
 '(projectile-mode-line
   (quote
    (:eval
     (format " Proj[%s]"
	     (projectile-project-name)))))
 '(python-indent-guess-indent-offset nil)
 '(red "#ffffff")
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
 '(sml/full-mode-string " ")
 '(sml/modified-char "*")
 '(sml/name-width 39)
 '(sml/shorten-mode-string " ")
 '(sml/shorten-modes nil)
 '(tool-bar-mode nil)
 '(vc-annotate-background "#404040")
 '(vc-annotate-color-map
   (quote
    ((20 . "#ea4141")
     (40 . "#db4334")
     (60 . "#e9e953")
     (80 . "#c9d617")
     (100 . "#dc7700")
     (120 . "#bcaa00")
     (140 . "#29b029")
     (160 . "#47cd57")
     (180 . "#60a060")
     (200 . "#319448")
     (220 . "#078607")
     (240 . "#1ec1c4")
     (260 . "#1ba1a1")
     (280 . "#26d5d5")
     (300 . "#58b1f3")
     (320 . "#00a2f5")
     (340 . "#1e7bda")
     (360 . "#da26ce"))))
 '(vc-annotate-very-old-color "#da26ce"))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:foreground "red" :height 1.2))))
 '(error ((t (:foreground "Red" :weight normal))))
 '(flymake-errline ((t nil)))
 '(flymake-warnline ((t nil)))
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
 '(mode-line ((t (:background "grey75" :foreground "black" :box (:line-width -1 :style released-button)))))
 '(mode-line-inactive ((t (:inherit mode-line :background "grey90" :foreground "grey20" :box (:line-width -1 :color "grey75") :weight light))))
 '(org-agenda-clocking ((t (:background "SkyBlue1"))))
 '(org-level-1 ((t (:inherit outline-1 :height 1.15))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.1))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.05))))
 '(org-upcoming-deadline ((t (:foreground "blue violet"))))
 '(sml/filename ((t (:inherit sml/global :foreground "gray0" :weight bold))))
 '(sml/modified ((t (:inherit sml/not-modified :foreground "tomato" :weight bold)))))


