
;;(require 'auto-complete-auctex)
(require 'company-auctex)
(company-auctex-init)


;; for the \left \right part 
(add-hook 'latex-mode-hook
          (lambda ()
	    (autopair-mode -1)))
(add-hook 'LaTeX-mode-hook
          (lambda ()
	    (autopair-mode -1)))
(setq-default LaTeX-electric-left-right-brace t)


;; two dollars in one time
(defun brf-TeX-Inserting (sta stb stc num)
  " after entering stb insert stc and go back with the cursor by num positions.
    With prefix nothings gets replaced. If the previous char was sta nothing will be 
    replaces as well." 
  (if (null current-prefix-arg)
      (progn
        (if (= (preceding-char) sta )
            (insert stb)
          (progn (insert stc) (backward-char num))))
    (insert stb)))

(defun brf-TeX-dollarm () (interactive) (brf-TeX-Inserting ?\\ "$"  "$$" 1))
(add-hook 'LaTeX-mode-hook
   (function (lambda ()
	       (local-set-key (kbd "$") 'brf-TeX-dollarm))))



;; Only change sectioning colour
;;(setq font-latex-fontify-sectioning 'color)

;; super-/sub-script on baseline
(setq font-latex-script-display (quote (nil)))
;; Do not change super-/sub-script font
(custom-set-faces
 '(font-latex-subscript-face ((t nil)))
 '(font-latex-superscript-face ((t nil)))
 )

;; Exclude bold/italic from keywords, can be customized
(setq font-latex-deactivated-keyword-classes
      '("italic-command" "bold-command" "italic-declaration" "bold-declaration"))


(setq-default TeX-parse-self t) ;; Enable parsing of the file itself on load
(setq-default TeX-auto-save t) ;; Enable save on command executation (e.g., LaTeX)
(setq-default TeX-save-query nil) ;; Don't even ask about it

;; latex options
(setq-default TeX-command-extra-options "-shell-escape") ;; Enable shell escape option by default

;; Synctex for windows
(setq-default TeX-source-correlate-mode t) ;; Enable synctex
(setq-default TeX-source-correlate-start-server t)


(setq TeX-parse-self t) ; Enable parse on load.
(setq TeX-auto-save t) ; Enable parse on save.


;; Turn on RefTeX in AUCTeX
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
;; Activate nice interface between RefTeX and AUCTeX
(setq reftex-plug-into-AUCTeX t)
;; set a cite type
;;(setq reftex-cite-format 'natbib)

(eval-after-load 'LaTeX
  (progn
    (define-key org-mode-map (kbd "C-<SPC>") nil)))

 	
(setq-default TeX-master nil) ; Query for master file.
;; do not promot for the reference <2018-01-23 Tue> 
(setq reftex-ref-macro-prompt nil)


(setq font-latex-match-reference-keywords
  '(
    ("citeauthor" "[{")
    ("Citeauthor" "[{")
    ("cians" "[{")
    ("citet" "[{")
    ("citep" "[{")
    ))


;; AucTeX
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
;;(add-hook 'LaTeX-mode-hook 'flyspell-mode)
;;(eval-after-load 'flyspell (lambda()
;;			     (require 'flyspell-correct-popup)))
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(setq reftex-plug-into-AUCTeX t)
(setq TeX-PDF-mode t)


;; use Skim as default pdf viewer
;; Skim's displayline is used for forward search (from .tex to .pdf)
;; option -b highlights the current line; option -g opens Skim in the background  
(setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
(setq TeX-view-program-list
     '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))


;; set the face of the toc 
(defface MyDef-reftex-section-heading-face
  '((t :inherit font-lock-function-name-face :height 125))
  "My RefTeX section heading face.")
(setq reftex-section-heading-face 'MyDef-reftex-section-heading-face)

;; description of the toc buffer
(defface MyDef-reftex-toc-header-face
  '((t :inherit font-lock-doc-face :height 115))
  "My RefTeX section heading face.")
(setq reftex-toc-header-face 'MyDef-reftex-toc-header-face)

;; 2016 Statistica Sinica 26, 69--95
(defface MyDef-reftex-bib-extra-face
  '((t :inherit font-lock-comment-face :height 136))
  "My RefTeX section heading face.")
(setq reftex-bib-extra-face 'MyDef-reftex-bib-extra-face)
(setq reftex-bib-year-face 'MyDef-reftex-bib-extra-face)

(defface MyDef-reftex-bib-extra-face
  '((t :inherit font-lock-comment-face :height 136))
  "My RefTeX section heading face.")
(setq reftex-index-header-face 'MyDef-reftex-bib-extra-face)
(setq reftex-index-section-face 'MyDef-reftex-bib-extra-face)
(setq reftex-index-tag-face 'MyDef-reftex-bib-extra-face)
(setq reftex-index-face 'MyDef-reftex-bib-extra-face)


;; redefine some keyblindings for the Latex mode
(add-hook 'LaTeX-mode-hook
	  (lambda ()
	    (define-key LaTeX-mode-map (kbd "C-c C-c") 'TeX-command-run-all)
	    (define-key LaTeX-mode-map (kbd "s-r") 'TeX-command-run-all)
	    (define-key LaTeX-mode-map (kbd "C-c C-a") 'TeX-command-master)
	    (define-key LaTeX-mode-map (kbd "C-c )") 'LaTeX-close-environment)
	    (define-key LaTeX-mode-map (kbd "C-c 0") 'LaTeX-close-environment)
	    (define-key LaTeX-mode-map (kbd "C-c 9") 'reftex-label)
	    (define-key LaTeX-mode-map (kbd "C-c ]") 'reftex-reference)
	    ))
(add-hook 'reftex-mode-hook
	  (lambda ()
	    (define-key reftex-mode-map (kbd "C-c )") 'LaTeX-close-environment)))


(defun MyDef-choose-horizon-toc ()
  "autotically choose whether to set the reftex-toc-split-window 
true or not"
  (if (< (window-width) 125)
      (progn
	(setq reftex-toc-split-windows-fraction 0.36)
	(setq reftex-toc-split-windows-horizontally nil))
    (setq reftex-toc-split-windows-fraction 0.25)
    (setq reftex-toc-split-windows-horizontally t)))

(defun MyDef-reftex-toc ()
  "let reftex-toc being more reasonable"
  (interactive)
  (MyDef-choose-horizon-toc)
  (reftex-toc))

(defun MyDef-reftex-toc-recenter ()
  "let the reftex-toc-recenter more reasonable"
  (interactive)
  (MyDef-choose-horizon-toc)
  (reftex-toc-recenter))

(add-hook 'reftex-toc-mode-hook 'visual-line-mode)
(add-hook 'reftex-mode-hook
	  (lambda ()
	    (define-key reftex-mode-map (kbd "C-c =") 'MyDef-reftex-toc)
	    (define-key reftex-mode-map (kbd "C-c -") 'MyDef-reftex-toc-recenter)
	    ))




(provide 'init-latex)

