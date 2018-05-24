
(if (get-buffer "*ESS*")
    (kill-buffer "*ESS*")
  )

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

;; line-spacing
(setq-default line-spacing 4)
(sml/setup)
(custom-set-faces
 '(mode-line ((t (:background "grey75" :foreground "black" :box (:line-width -1 :style released-button)))))
 '(mode-line-inactive ((t (:inherit mode-line :background "grey90" :foreground "grey20" :box (:line-width -1 :color "grey75") :weight light)))))
(setq modelinesize 125)
(set-face-attribute 'mode-line nil :height modelinesize)
(set-face-attribute 'mode-line-inactive nil  :height modelinesize)

;; initial window
;; (setq initial-frame-alist '((left . 50) (top . 50)))
;; (setq initial-frame-alist
;;      '(
;;        (width . 132) ; character
;;      (height . 35))) ;

;; (when (window-system)
;;  (set-frame-position (selected-frame) 156 86))

;; (set-frame-position (selected-frame) 0 0)
;;(add-to-list 'default-frame-alist '(height . 50))
;;(add-to-list 'default-frame-alist '(width . 80))
(toggle-frame-maximized)

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
  (global-hl-line-mode +1)
  (set-face-background 'hl-line "#121212"))


;; show the search results number
(defun mydef-isearch-update-post-hook()
  (let (suffix num-before num-after num-total-set-keyal)
    (setq num-before (count-matches isearch-string (point-min) (point)))
    (setq num-after (count-matches isearch-string (point) (point-max)))
    (setq num-total (+ num-before num-after))
    (setq suffix (if (= num-total 0)
                     ""
                   (format "  [%d of %d]" num-before num-total)))
    (setq isearch-message-suffix-add suffix)
    (isearch-message)))
(add-hook 'isearch-update-post-hook 'mydef-isearch-update-post-hook)



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
    auto-fill-function
    hungry-delete-mode
    auto-revert-mode
    buffer-face-mode
    ))

(defun purge-minor-modes ()
  (interactive)
  (dolist (x hidden-minor-modes nil)
    (let ((trg (cdr (assoc x minor-mode-alist))))
      (when trg
        (setcar trg "")))))
(add-hook 'after-change-major-mode-hook 'purge-minor-modes)

(dim-major-name 'help-mode "H")
(dim-major-name 'emacs-lisp-mode "L")
(dim-major-name 'inferior-python-mode "iPy")
(dim-major-name 'python-mode "Py")

;; set default font 
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
		:slant 'normal)))
  (setq face-font-rescale-alist '(("Hiragino Sans GB" . 1.05))))
(if window-system
    (s-font))

;; smaller font for some buffer
(defun my-buffer-face-mode-smaller ()
  "font in the inferiror python or ess mode"
  (interactive)
  (setq buffer-face-mode-face '(:family "Inconsolata" :height 140))
  (buffer-face-mode))

;; Set default font faces for other modes
(add-hook 'inferior-python-mode-hook 'my-buffer-face-mode-smaller)
(add-hook 'inferior-ess-mode-hook 'my-buffer-face-mode-smaller)


;;;; 设置编辑环境
(setenv "LC_ALL" "en_US.UTF-8")
;; 设置emacs 使用 utf-8
(setq locale-coding-system 'utf-8)
;; 设置键盘输入时的字符编码
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
;; 文件默认保存为 utf-8
(set-buffer-file-coding-system 'utf-8)
(set-default buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
;; 解决粘贴中文出现乱码的问题
(set-clipboard-coding-system 'utf-8)
;; 终端中文乱码
(set-terminal-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
;; 解决文件目录的中文名乱码
(setq-default pathname-coding-system 'utf-8)
;;设置文件名编码
(setq file-name-coding-system 'utf-8)
;;设置目录路径名编码
(setq path-name-coding-system 'utf-8)



;; always open files in the same window
(setq ns-pop-up-frames nil)


;; choose horizon window if proper
(setq split-width-threshold 140)

;; show file path
;; (setq frame-title-format
;;       '((:eval (if (buffer-file-name)
;;                    (abbreviate-file-name (buffer-file-name))
;;                  "%b"))))

;;(setq fancy-splash-image nil)


(provide 'init-ui)
