(use-package hungry-delete
  :init
  (global-hungry-delete-mode))

;; user define functions
(defun MyDef-quick-save-flash-ideas ()
  "quickly save some flash ideas"
  (interactive)
  (find-file-other-window "/Users/wlh/Documents/Learning/FlashIdeas.org"))
(global-set-key (kbd "s-6") 'MyDef-quick-save-flash-ideas)

(defun MyDef-open-line-and-next ()
  "open a new line and go to the next line"
  (interactive)
  (open-line 1)
  (next-line)
  )
(global-set-key (kbd "C-j") 'MyDef-open-line-and-next)
(add-hook 'bibtex-mode-hook
	  (lambda ()
	    (define-key bibtex-mode-map (kbd "C-j") 'MyDef-open-line-and-next)))

(defun MyDef-mark-whole-line ()
  "mark the whole line"
  (interactive)
  (call-interactively 'move-beginning-of-line)
  (call-interactively 'set-mark-command)
  (call-interactively 'move-end-of-line))
(global-set-key (kbd "C-x C-l") 'MyDef-mark-whole-line)

(defun MyDef-fill-paragraph ()
  "let the position being better after indented"
  (interactive)
  (fill-paragraph)
  (recenter 16))
;;(global-set-key (kbd "M-q") 'MyDef-fill-paragraph)

(defun MyDef-iedit-next-occurrence ()
  "next occurrence with recenter"
  (interactive)
  (iedit-next-occurrence)
  (recenter 12))

(defun MyDef-iedit-prev-occurrence ()
  "next occurrence with recenter"
  (interactive)
  (iedit-prev-occurrence)
  (recenter 12))

;;(add-hook 'iedit-mode-hook
;;	  (lambda ()
;;	    (define-key iedit-occurrence-keymap (kbd "<tab>") 'MyDef-iedit-next-occurrence)
;;	    (define-key iedit-occurrence-keymap (kbd "<S-tab>") 'MyDef-iedit-prev-occurrence)))

;; easy move in read-only buffers
;; enter view-mode for read-only files
(setq view-read-only t)
(add-hook 'view-mode-hook
	  (lambda ()
	    (define-key view-mode-map (kbd "n") 'forward-paragraph)
	    (define-key view-mode-map (kbd "p") 'backward-paragraph)
	    (define-key view-mode-map (kbd "]") 'end-of-buffer)
	    (define-key view-mode-map (kbd "[") 'beginning-of-buffer)
	    (define-key view-mode-map (kbd "l") 'recenter-top-bottom)))
(add-hook 'help-mode-hook
	  (lambda ()
	    (define-key help-mode-map (kbd "n") 'forward-paragraph)
	    (define-key help-mode-map (kbd "p") 'backward-paragraph)
	    (define-key help-mode-map (kbd "]") 'end-of-buffer)
	    (define-key help-mode-map (kbd "[") 'beginning-of-buffer)
	    (define-key help-mode-map (kbd "l") 'recenter-top-bottom)))
;;(add-hook 'help-mode-hook 'turn-on-evil-mode)
;;(add-hook 'view-mode-hook 'turn-on-evil-mode)
(global-set-key (kbd "s-e")  'evil-mode)


;; disable some keys
(global-set-key (kbd "s-x") 'nil)

;; browser the kill ring
(global-set-key (kbd "C-c C-y") 'browse-kill-ring)
(add-hook 'org-mode-hook
	  (lambda ()
	    (define-key org-mode-map (kbd "C-c C-y") 'browse-kill-ring)))


;; change the window size
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)1


;; Enable Cache, for youdao translator h
(setq url-automatic-caching t)
;; Set file path for saving search history
(setq youdao-dictionary-search-history-file "/Users/wlh/Documents/Learning/youdao.txt")
;; Example Key binding
;; Integrate with popwin-el (https://github.com/m2ym/popwin-el)    (left top right bottom)
;;(push '("*Youdao Dictionary*" :width 0.5 :height 0.36 :position bottom) popwin:special-display-config)
(push "*Youdao Dictionary*" popwin:special-display-config)

(defun MyDef-youdao ()
  "If there has a youdao buffer, close it"
  (interactive)
  (if (get-buffer-window "*Youdao Dictionary*")
      (progn   (if (or (< (window-width) 125) (> (window-height) 25))
		   (previous-buffer)
		 (popwin:close-popup-window)))
    (youdao-dictionary-search-at-point)))
(global-set-key (kbd "s-y") 'MyDef-youdao)

(defun MyDef-youdao-input ()
  "close the older youdao windw before input the new word"
  (interactive)
  (youdao-dictionary-search-from-input)
  (popwin:popup-last-buffer))
(add-hook 'youdao-dictionary-mode-hook
	  (lambda ()
	    (define-key youdao-dictionary-mode-map (kbd "<tab>") 'MyDef-youdao-input)))


;; set for the swiper
(defun MyDef-push-mark-swiper ()
  "push a mark to add the current position to the mark ring"
  (interactive)
  (push-mark)
  (swiper))
;; ivy
(global-set-key "\C-s" 'MyDef-push-mark-swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "C-x C-b") 'ivy-switch-buffer)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "\C-xf") 'counsel-find-file)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
(global-set-key (kbd "C-c C-g") 'counsel-mark-ring)


;; avy go to anywhere 
(global-set-key (kbd "C-'") 'avy-goto-line)
;;(global-set-key (kbd "C-;") 'avy-goto-char)
(defun MyDef-avy-goto-char ()
  "let avy-goto-char go to the below of the searching charachter"
  (interactive)
  (call-interactively 'avy-goto-char)
  (forward-char))
(global-set-key [(control ?\;)] 'avy-goto-char)


;; open fold tree
;;(global-set-key [f8] 'treemacs-toggle)


;; easy to change buffer
(global-set-key (kbd "<M-left>") 'previous-buffer)
(global-set-key (kbd "<M-right>") 'next-buffer)
(add-hook 'elpy-mode-hook
	  (lambda ()
	    (define-key elpy-mode-map (kbd "<M-left>") 'previous-buffer)
	    (define-key elpy-mode-map (kbd "<M-right>") 'next-buffer)
	    ))
(global-set-key (kbd "s-[") 'previous-buffer)
(global-set-key (kbd "s-]") 'next-buffer)

(global-set-key (kbd "<s-left>") 'winner-undo)
(global-set-key (kbd "<s-right>") 'winner-redo)

(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-n") 'forward-paragraph)

(global-set-key (kbd "<C-tab>") 'iedit-mode)

;; find the file at point
;;(global-set-key (kbd "C-c o") 'find-file-at-point)
;;(global-set-key (kbd "C-c C-o") 'find-file-at-point)
;;(global-set-key (kbd "C-c C-\\") 'find-file-in-project)
;;(global-set-key (kbd "C-c \\") 'find-file-in-project)

(define-key projectile-mode-map [?\s-p] 'projectile-switch-project)

(defun MyDef-enhanced-counsel-search ()
  "Enhanced the function of counsel-projectile-ag
if we are not in a project, just use the function counsel-ag"
  (interactive)
  (if (equal (projectile-project-name) "-")
      (progn
	(if (not (buffer-file-name))
	    (if (string-equal major-mode "dired-mode")
		(counsel-rg)
	     (swiper))
	  (counsel-rg)))
    (counsel-projectile-rg)))
(define-key projectile-mode-map [?\s-g] 'MyDef-enhanced-counsel-search)

(require 'init-user-funs)
(defun MyDef-enhanced-find-file ()
  "Enhanced the function of counsel-projectile-find-file
if we are not in a project, just use the function find-file"
  (interactive)
  (if (equal (projectile-project-name) "-")
      (counsel-rg-jump)
    (MyDef-counsel-projectile-find-file)))
(define-key projectile-mode-map [?\s-f] 'MyDef-enhanced-find-file)


(global-set-key (kbd "s-SPC") 'set-mark-command)
(global-set-key (kbd "s-b") 'ivy-switch-buffer)
(global-set-key (kbd "s-SPC") 'set-mark-command)


;; expand-region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C--") 'er/contract-region)

;; ace-window
(global-set-key (kbd "s-o") 'ace-window)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
(defvar aw-dispatch-alist
  '((?x aw-delete-window "Delete Window")
	(?m aw-swap-window "Swap Windows")
	(?M aw-move-window "Move Window")
	(?j aw-switch-buffer-in-window "Select Buffer")
	(?n aw-flip-window)
	(?u aw-switch-buffer-other-window "Switch Buffer Other Window")
	(?c aw-split-window-fair "Split Fair Window")
	(?v aw-split-window-vert "Split Vert Window")
	(?b aw-split-window-horz "Split Horz Window")
	(?o delete-other-windows "Delete Other Windows")
	(?? aw-show-dispatch-help))
  "List of actions for `aw-dispatch-default'.")
(global-set-key (kbd "s-0") 'delete-window)
(global-set-key (kbd "s-1") 'delete-other-windows)
(global-set-key (kbd "s-2") 'split-window-below)
(global-set-key (kbd "s-3") 'split-window-right)


(provide 'init-keybindings)
