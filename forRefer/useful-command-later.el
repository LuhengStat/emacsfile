

(defun buffer-local-set-key (key func)
  (interactive "KSet key on this buffer: \naCommand: ")
  (let ((name (format "%s-magic" (buffer-name))))
    (eval
     `(define-minor-mode ,(intern name)
	"Automagically built minor mode to define buffer-local keys."))
    (let* ((mapname (format "%s-map" name))
	   (map (intern mapname)))
      (unless (boundp (intern mapname))
	(set map (make-sparse-keymap)))
      (eval
       `(define-key ,map ,key func)))
    (funcall (intern name) t)))


(defun example ()
  (interactive)
  (let ((cands '(("one" . 1)
                 ("two" . 2))))
    (ivy-read "goto: " cands
              :action (lambda (x) (goto-line (cdr x))))))

(defun my-action-1 (x)
  (message "action-1: %s" x))

(defun my-action-2 (x)
  (message "action-2: %s" x))

(defun my-action-3 (x)
  (message "action-3: %s" x))

(defun my-command-with-3-actions ()
  (interactive)
  (ivy-read "test: " '("foo" "bar" "baz")
            :action '(1
                      ("o" my-action-1 "action 1")
                      ("j" my-action-2 "action 2")
                      ("k" my-action-3 "action 3"))))


;; @see https://bitbucket.org/lyro/evil/issue/511/let-certain-minor-modes-key-bindings
(eval-after-load 'git-timemachine
  '(progn
     (evil-make-overriding-map git-timemachine-mode-map 'normal)
     ;; force update evil keymaps after git-timemachine-mode loaded
     (add-hook 'git-timemachine-mode-hook #'evil-normalize-keymaps)))


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
