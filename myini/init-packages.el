

(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")))


(setq package-check-signature nil)

;; list the packages you want
(setq package-list '(use-package
		     auto-complete
		     highlight-parentheses
		     ;;neotree
		     ;;treemacs
		     ;;treemacs-projectile
		     swiper
		     counsel
		     ivy
		     autopair
		     avy
		     undo-tree
		     ;;window-numbering
		     yasnippet
		     ;;org-ac
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
		     ;;magit
		     flycheck
		     exec-path-from-shell
		     py-autopep8
		     ;;cnfonts
		     spacemacs-theme
		     company
		     company-auctex
		     projectile
		     counsel-projectile
		     popwin
		     ag
		     rg
		     cal-china-x
		     ace-window
		     dim
		     hungry-delete
		     ztree
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

;; This is only needed once, near the top of the file
(eval-when-compile
  (require 'use-package))

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
;;(ac-config-default)
;;(setq ac-auto-start 2)

;; company-mode 
(global-company-mode)
(define-key company-active-map (kbd "M-h") 'company-show-doc-buffer)
(define-key company-active-map (kbd "M-n") 'company-select-next) 
(define-key company-active-map (kbd "M-p") 'company-select-previous)
(define-key company-active-map [tab] 'company-complete-common)
;;(define-key company-active-map (kbd "<C-tab>") 'company-select-previous)
(setq company-selection-wrap-around t
      company-tooltip-align-annotations t
      company-idle-delay 0
      company-minimum-prefix-length 2
      company-tooltip-limit 9
      company-show-numbers t)

;; Add yasnippet support for all company backends
(defvar company-mode/enable-yas t
  "Enable yasnippet for all backends.")

(defun company-mode/backend-with-yas (backend)
  (if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
      backend
    (append (if (consp backend) backend (list backend))
            '(:with company-yasnippet))))

(setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))

;; this configure is copied from https://oremacs.com/
(let ((map company-active-map))
  (mapc
   (lambda (x)
     (define-key map (format "%d" x) 'ora-company-number))
   (number-sequence 0 9))
  (define-key map " " (lambda ()
                        (interactive)
                        (company-abort)
                        (self-insert-command 1)))
  (define-key map (kbd "<return>") nil)) 

(defun ora-company-number ()
  "Forward to `company-complete-number'.
Unless the number is potentially part of the candidate.
In that case, insert the number."
  (interactive)
  (let* ((k (this-command-keys))
         (re (concat "^" company-prefix k)))
    (if (cl-find-if (lambda (s) (string-match re s))
                    company-candidates)
        (self-insert-command 1)
      (company-complete-number (string-to-number k)))))


;; ag highlight
(setq ag-highlight-search t)

;; autocomplete the parenthesis
(require 'autopair)
(autopair-global-mode 1)
;;(setq ac-auto-show-menu 0)
;;(setq ac-delay 0)

(require 'avy)
(require 'counsel)

;; redo-undo tree
(require 'undo-tree)
(global-undo-tree-mode 1)


;; auto jump to the pop window
(require 'popwin)
(popwin-mode t)


;; save history
;;(savehist-mode 1)
;;(setq savehist-additional-variables '(kill-ring search-ring regexp-search-ring))
;;(setq savehist-file "~/.emacs.d/tmp/savehist")


(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)


;; highlight selected words in the whole buffer
(require 'iedit)


;;evil-mode
;;(require 'evil)
;;(evil-mode 1)
;;(setq evil-emacs-state-cursor '("blue" bar)
;;      evil-normal-state-cursor '("black")
;;      evil-insert-state-cursor '("black" bar))


;; close emacs without ask the existing process 
(add-hook 'comint-exec-hook 
	  (lambda () (set-process-query-on-exit-flag (get-buffer-process (current-buffer)) nil)))


(require 'cal-china-x)
(setq mark-holidays-in-calendar t)
(setq cal-china-x-important-holidays cal-china-x-chinese-holidays)
(setq cal-china-x-general-holidays '((holiday-lunar 1 15 "元宵节")))
(setq other-holidays '((holiday-lunar 12 27 "Lisa's Birthday")))
(setq calendar-holidays
      (append cal-china-x-important-holidays
	      cal-china-x-general-holidays
	      other-holidays))


(provide 'init-packages)



