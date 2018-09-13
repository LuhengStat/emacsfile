(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(custom-safe-themes
   (quote
    ("a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-pyvenv elpy-module-highlight-indentation elpy-module-yasnippet elpy-module-django elpy-module-sane-defaults)))
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (markdown-mode graphviz-dot-mode flyspell-correct-popup smart-mode-line git-timemachine ztree hungry-delete dim ace-window cal-china-x rg ag popwin counsel-projectile projectile company-auctex spacemacs-theme py-autopep8 exec-path-from-shell flycheck magit elpy evil expand-region auto-complete-auctex iedit transpose-frame youdao-dictionary browse-kill-ring yasnippet undo-tree avy autopair counsel swiper highlight-parentheses auto-complete use-package)))
 '(projectile-mode-line
   (quote
    (:eval
     (format " Proj[%s]"
	     (projectile-project-name)))))
 '(scroll-bar-mode nil)
 '(scroll-conservatively 1000)
 '(scroll-margin 3)
 '(show-paren-mode t)
 '(sml/modified-char " * ")
 '(tool-bar-mode nil))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(error ((t (:foreground "Red" :weight normal))))
 '(font-latex-subscript-face ((t nil)))
 '(font-latex-superscript-face ((t nil)))
 '(mode-line ((t (:background "grey75" :foreground "black" :box (:line-width -1 :style released-button)))))
 '(mode-line-inactive ((t (:inherit mode-line :background "grey90" :foreground "grey20" :box (:line-width -1 :color "grey75") :weight light))))
 '(org-agenda-clocking ((t (:background "SkyBlue1"))))
 '(sml/filename ((t (:inherit sml/global :foreground "black" :weight bold)))))

