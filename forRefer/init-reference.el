;; Use the org-ref to manage the references

(require 'org-ref)

(setq reftex-default-bibliography '("/Users/wlh/Documents/References/Org-ref/mybib.bib"))

;; see org-ref for use of these variables
(setq org-ref-bibliography-notes "/Users/wlh/Documents/References/Org-ref/notes.org"
      org-ref-default-bibliography '("/Users/wlh/Documents/References/Org-ref/mybib.bib")
      org-ref-pdf-directory "/Users/wlh/Documents/References/Org-ref/PDFs")


(setq bibtex-completion-bibliography "/Users/wlh/Documents/References/Org-ref/mybib.bib"
      bibtex-completion-library-path "/Users/wlh/Documents/References/Org-ref/PDFs"
      bibtex-completion-notes-path "/Users/wlh/Documents/References/Org-ref/helm-bibtex-notes")

;; open pdf with system pdf viewer (works on mac)
(setq bibtex-completion-pdf-open-function
  (lambda (fpath)
    (start-process "open" "*open*" "open" fpath)))



(provide 'init-reference)


