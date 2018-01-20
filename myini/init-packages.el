

(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")))


(setq package-check-signature nil)

;; list the packages you want
(setq package-list '(auto-complete
		     highlight-parentheses
		     ;;neotree
		     treemacs
		     treemacs-projectile
		     swiper
		     counsel
		     ivy
		     autopair
		     avy
		     undo-tree
		     window-numbering
		     yasnippet
		     org-ac
		     browse-kill-ring
		     youdao-dictionary
		     ess-view
		     ess-R-data-view
		     ;;ess-R-object-popup
		     transpose-frame
		     iedit
		     auto-complete-auctex
		     expand-region
		     ;;find-file-in-project
		     evil
		     elpy
		     magit
		     flycheck
		     exec-path-from-shell
		     py-autopep8
		     cnfonts
		     spacemacs-theme
		     company
		     company-auctex
		     projectile
		     counsel-projectile
		     popwin
		     ag
		     ))

;; activate all the packages (in particular autoloads)
(package-initialize)

;; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))(setq package-list '(package1 package2))


;;;;;;;;;;;;;;;;; swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
;;(setq enable-recursive-minibuffers t)
;;cycle past the last and the first candidates respectively
(setq ivy-wrap t)
;; fuzzy settings for ivy https://oremacs.com/2016/01/06/ivy-flx/
;; do not use "^" for the ivy-M-x
(setq ivy-initial-inputs-alist nil)
(setq ivy-count-format "(%d/%d) ")

;;(require 'find-file-in-project)
;;(setq projectile-completion-system 'ivy)
;;(setq ffip-prune-patterns (delete "*.pdf" ffip-prune-patterns))

(projectile-mode)
(counsel-projectile-mode 1)
;; using the local .projectile file for the file settings
(setq projectile-indexing-method 'native)
(setq projectile-enable-caching t)
(setq projectile-completion-system 'ivy)


;;;;;;;;;;;;;;;;; auto-complete
;;(require 'auto-complete-config)
(ac-config-default)

;; ag highlight
(setq ag-highlight-search t)


;; Get tab completion in R script files
;; See this page here
;; https://stat.ethz.ch/pipermail/ess-help/2013-March/008719.html
;; Make sure that this is after the auto-complete package initialization
(setq  ess-tab-complete-in-script t)
(setq ess-use-auto-complete t)
(ess-toggle-underscore nil)

;; auto-change the directionary to the position of the current file
;;(add-hook 'ess-mode-hook 'ess-use-this-dir)

;; set the default style, same with RStudio
(setq ess-default-style 'RStudio)

(setq ac-auto-start 2)
;;(set-face-attribute 'ac-candidate-face nil   :background "#00222c" :foreground "light gray")
;;(set-face-attribute 'ac-selection-face nil   :background "SteelBlue4" :foreground "white")
;;(set-face-attribute 'popup-tip-face    nil   :background "#003A4E" :foreground "light gray")

(setq 
 ac-auto-show-menu 1
 ac-candidate-limit nil
 ac-delay 0
 ac-disable-faces (quote (font-lock-comment-face font-lock-doc-face))
 ac-ignore-case 'smart
 ac-menu-height 10
 ac-quick-help-delay 0.05
 ac-quick-help-prefer-pos-tip t
 ac-use-quick-help nil
 )


;;;;;;;;;;;;;;;;;; neotree settings
;;(require 'neotree)
;; jump to the current file
;;(setq neo-smart-open t)
(require 'treemacs)
(treemacs-follow-mode 1)
(treemacs-filewatch-mode 1)


;; autocomplete the parenthesis
(require 'autopair)
(autopair-global-mode 1)
(setq ac-auto-show-menu 0)
(setq ac-delay 0)
;; company mode
(setq company-idle-delay 0) 


(require 'avy)

(require 'counsel)


;; redo-undo tree
(require 'undo-tree)
(global-undo-tree-mode 1)


;; auto jump to the pop window
(require 'popwin)
(popwin-mode t)


;; windows numbering
(setq window-numbering-assign-func
      (lambda () (when (equal (buffer-name) "*Calculator*") 9)))
(window-numbering-mode 1)


;; save history
;;(savehist-mode 1)
;;(setq savehist-additional-variables '(kill-ring search-ring regexp-search-ring))
;;(setq savehist-file "~/.emacs.d/tmp/savehist")


;;(require 'ess-view)
;;(setq ess-view--spreadsheet-program "/Applications/Table Tool.app/Contents/MacOS/Table Tool")


(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)


;;(require 'ess-R-object-popup)
;;(define-key ess-mode-map "\C-c\C-g" 'ess-R-object-popup)


;; highlight selected words in the whole buffer
(require 'iedit)


;; evil-mode
;;(require 'evil)
;;(evil-mode 1)
;;(setq evil-emacs-state-cursor '("blue" bar)
;;      evil-normal-state-cursor '("black")
;;      evil-insert-state-cursor '("black" bar))


;; close emacs without ask the existing process 
(add-hook 'comint-exec-hook 
	  (lambda () (set-process-query-on-exit-flag (get-buffer-process (current-buffer)) nil)))




(provide 'init-packages)



