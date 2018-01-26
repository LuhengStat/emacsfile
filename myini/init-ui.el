
;;(load-theme 'monokai t)
;;(load-theme 'spacemacs-dark t)
;;(custom-set-faces
;; '(font-latex-script-char-face ((t (:foreground "burlywood")))))

;;(load-theme 'ample t)
;;(custom-set-faces
;; '(font-latex-script-char-face ((t (:foreground "burlywood"))))
;; '(minibuffer-prompt ((t (:inherit bold :foreground "#4f97d7")))))
;;(load-theme 'dracula t)
;;(load-theme 'sanityinc-tomorrow-night t)
;;(load-theme 'leuven t)

;;(set-face-bold-p 'bold nil)

(toggle-frame-maximized)
;; always wrap without indicators


(blink-cursor-mode 0)
(defun s-cursor()
  ;; set cursor-type with a line
  ;;(setq-default cursor-type 'bar) 
  ;; set cursor color
  (set-cursor-color "#3180f1")
  )
(if window-system
    (s-cursor))

(unless (display-graphic-p)
  (menu-bar-mode -1))
(unless (display-graphic-p)
  (load-theme 'spacemacs-dark t))


(setq truncate-lines nil)
(setq truncate-partial-width-windows nil)
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
(add-hook 'reftex-toc-mode-hook (lambda () (setq truncate-lines nil)))
;; line-spacing
(setq-default line-spacing 3)
(setq modelinesize 125)
(set-face-attribute 'mode-line nil :height modelinesize)
(set-face-attribute 'mode-line-inactive nil  :height modelinesize)


;; initial window
;;(setq initial-frame-alist '((left . 50) (top . 50)))
;;(setq initial-frame-alist
;;      '(
;;        (width . 132) ; character
;;      (height . 35))) ;
;;
;;(when (window-system)
;;  (set-frame-position (selected-frame) 156 86))


(show-paren-mode 1)
;;;;;;;;;;;;;;;;; highlight-parantheses
(require 'highlight-parentheses)
(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)


;; color of selected background
;;(set-face-attribute 'region nil :background "#94c9ff")

;; show number in the left
;;(global-linum-mode t)


;; highlight current line
;;(global-hl-line-mode +1)
;;(set-face-background 'hl-line "grey9")
(unless (display-graphic-p)
  (set-face-background 'hl-line "#121212"))


;;(defun acg-initial-buffer-choice ()
;;  (if (get-buffer "*ESS*")
;;      (kill-buffer "*ESS*"))
;;  (setq curbuf (current-buffer))
;;  (switch-to-buffer curbuf)
;;  (delete-other-windows))
;;(setq initial-buffer-choice 'acg-initial-buffer-choice)

(if (get-buffer "*ESS*")
      (kill-buffer "*ESS*"))

;; show the search results number
(defun MyDef-isearch-update-post-hook()
  (let (suffix num-before num-after num-total-set-keyal)
    (setq num-before (count-matches isearch-string (point-min) (point)))
    (setq num-after (count-matches isearch-string (point) (point-max)))
    (setq num-total (+ num-before num-after))
    (setq suffix (if (= num-total 0)
                     ""
                   (format "  [%d of %d]" num-before num-total)))
    (setq isearch-message-suffix-add suffix)
    (isearch-message)))
(add-hook 'isearch-update-post-hook 'MyDef-isearch-update-post-hook)



;; hide the mode in the mode-line
(defvar hidden-minor-modes ; example, write your own list of hidden
  '(abbrev-mode            ; minor modes
    helm-mode
    undo-tree-mode
    auto-complete-mode
    flyspell-mode
    inf-haskell-mode
    haskell-indent-mode
    haskell-doc-mode
    highlight-parentheses-mode
    autopair-mode
    yas-global-mode
    yas-minor-mode
    ivy-mode
    visual-line-mode
    auto-fill-mode
    Latex-mode
    latex-mode
    tex-mode
    TeX-mode
    reftex-mode
    disable-mouse-mode
    ))

(defun purge-minor-modes ()
  (interactive)
  (dolist (x hidden-minor-modes nil)
    (let ((trg (cdr (assoc x minor-mode-alist))))
      (when trg
        (setcar trg "")))))
(add-hook 'after-change-major-mode-hook 'purge-minor-modes)


;;(add-to-list 'default-frame-alist '(font . "-*-Monaco-normal-normal-normal-*-16-*-*-*-m-0-iso10646-1")) 
;;(set-face-attribute 'default t :font "-*-Monaco-normal-normal-normal-*-16-*-*-*-m-0-iso10646-1" )

;;(add-to-list 'default-frame-alist '(font . "-*-Inconsolata-normal-normal-normal-*-20-*-*-*-m-0-iso10646-1")) 
;;(set-face-attribute 'default t :font "-*-Inconsolata-normal-normal-normal-*-20-*-*-*-m-0-iso10646-1" )

;; Auto generated by cnfonts
;; 15 18
(defun s1-font()
  (set-face-attribute
   'default nil
   :font (font-spec :name "-*-Monaco-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1"
		    :weight 'normal
		    :slant 'normal
		    :size 15))
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font
     (frame-parameter nil 'font)
     charset
     (font-spec :name "-*-Hiragino Sans GB-normal-normal-normal-*-*-*-*-*-p-0-iso10646-1"
		:weight 'normal
		:slant 'normal
		:size 15))))

;; 20, 20.5;   18, 18.5
(defun s2-font()
  (set-face-attribute
   'default nil
   :font (font-spec :name "-*-Inconsolata-normal-normal-normal-*-20-*-*-*-m-0-iso10646-1"
		    :weight 'normal
		    :slant 'normal
		    :size 18))
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font
     (frame-parameter nil 'font)
     charset
     (font-spec :name "-*-Hiragino Sans GB-normal-normal-normal-*-*-*-*-*-p-0-iso10646-1"
		:weight 'normal
		:slant 'normal)))
  (setq face-font-rescale-alist '(("Hiragino Sans GB" . 1.05))))

;; 16 20.5
;; 14 16.5
(defun s3-font()
  (set-face-attribute
   'default nil
   :font (font-spec :name "-*-Roboto Mono-normal-normal-normal-*-17-*-*-*-m-0-iso10646-1"
		    :weight 'normal
		    :slant 'normal
		    :size 15))
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font
     (frame-parameter nil 'font)
     charset
     (font-spec :name "-*-Hiragino Sans GB-normal-normal-normal-*-*-*-*-*-p-0-iso10646-1"
		:weight 'normal
		:slant 'normal
		:size 18.5))))

(defun s-font()
  (set-face-attribute
   'default nil
   :font (font-spec :name "-*-Inconsolata-normal-normal-normal-*-20-*-*-*-m-0-iso10646-1"
		    :weight 'normal
		    :slant 'normal
		    :size 18))
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font
     (frame-parameter nil 'font)
     charset
     (font-spec :name "-*-Hiragino Sans GB-normal-normal-normal-*-*-*-*-*-p-0-iso10646-1"
		:weight 'normal
		:slant 'normal
		:size 16))))

(if window-system
    (s2-font))



;;;; 设置编辑环境
;; 设置emacs 使用 utf-8
(setq locale-coding-system 'utf-8)
;; 设置键盘输入时的字符编码
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
;; 文件默认保存为 utf-8
(set-buffer-file-coding-system 'utf-8)
(set-default buffer-file-coding-system 'utf8)
(set-default-coding-systems 'utf-8)
;; 解决粘贴中文出现乱码的问题
(set-clipboard-coding-system 'utf-8)
;; 终端中文乱码
(set-terminal-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
;; 解决文件目录的中文名乱码
(setq-default pathname-coding-system 'utf-8)
;; 解决 Shell Mode(cmd) 下中文乱码问题
(defun change-shell-mode-coding ()
  (progn
    (set-terminal-coding-system 'gbk)
    (set-keyboard-coding-system 'gbk)
    (set-selection-coding-system 'gbk)
    (set-buffer-file-coding-system 'gbk)
    (set-file-name-coding-system 'gbk)
    (modify-coding-system-alist 'process "*" 'gbk)
    (set-buffer-process-coding-system 'gbk 'gbk)
    (set-file-name-coding-system 'gbk)))

;;设置文件名编码
(setq file-name-coding-system 'utf-8)
;;设置目录路径名编码
;;(setq path-name-coding-system 'utf-8)


;; always open files in the same window
(setq ns-pop-up-frames nil)


;; choose horizon window if proper
(setq split-width-threshold 140)



(provide 'init-ui)
