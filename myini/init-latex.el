
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
(setq font-latex-fontify-sectioning 'color)
;; super-/sub-script on baseline
(setq font-latex-script-display (quote (nil)))
;; Do not change super-/sub-script font
(custom-set-faces
 '(font-latex-subscript-face ((t nil)))
 '(font-latex-superscript-face ((t nil)))
 )
;; Exclude bold/italic from keywords
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

 
(require 'company-auctex)
(require 'auto-complete-auctex)
(company-auctex-init)


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
;;(setq reftex-toc-split-windows-horizontally t)
(setq reftex-toc-split-windows-fraction 0.4)
;; do not promot for the reference <2018-01-23 Tue> by wlh
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
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(setq reftex-plug-into-AUCTeX t)
(setq TeX-PDF-mode t)


;; use Skim as default pdf viewer
;; Skim's displayline is used for forward search (from .tex to .pdf)
;; option -b highlights the current line; option -g opens Skim in the background  
(setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
(setq TeX-view-program-list
     '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b"))) 


;; redefine some keyblindings for the Latex mode
(add-hook 'LaTeX-mode-hook
	  (lambda ()
	    (define-key LaTeX-mode-map (kbd "C-c C-c") 'TeX-command-run-all)
	    (define-key LaTeX-mode-map (kbd "C-c C-a") 'TeX-command-master)
	    (define-key LaTeX-mode-map (kbd "C-c )") 'LaTeX-close-environment)
	    (define-key LaTeX-mode-map (kbd "C-c 0") 'LaTeX-close-environment)
	    (define-key LaTeX-mode-map (kbd "C-c 9") 'reftex-label)
	    (define-key LaTeX-mode-map (kbd "C-c ]") 'reftex-reference)
	    ))




(provide 'init-latex)
