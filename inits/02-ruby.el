
;========================================================================
;
;                                  Ruby-mode
;
;========================================================================
(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))



;; ruby-modeのインデントを改良する
(setq ruby-deep-indent-paren-style nil)
(defadvice ruby-indent-line (after unindent-closing-paren activate)
  (let ((column (current-column))
        indent offset)
    (save-excursion
      (back-to-indentation)
      (let ((state (syntax-ppss)))
        (setq offset (- column (current-column)))
        (when (and (eq (char-after) ?\))
                   (not (zerop (car state))))
          (goto-char (cadr state))
          (setq indent (current-indentation)))))
    (when indent
      (indent-line-to indent)
      (when (> offset 0) (forward-char offset)))))

(require 'ruby-end)
(add-hook 'ruby-mode-hook
          '(lambda ()
             (setq tab-width 2)
             (setq ruby-indent-level tab-width)
             (setq ruby-deep-indent-paren-style nil)
;       (define-key ruby-mode-map [return] 'ruby-reindent-then-newline-and-indent)
 ;            (define-key ruby-mode-map [return] 'reindent-then-newline-and-indent)
   (abbrev-mode 1)
    (electric-pair-mode t)
    (electric-indent-mode t)
    (electric-layout-mode t)))


(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)



;; rcodetools
(require 'rcodetools)
(setq rct-find-tag-if-available nil)
(defun ruby-mode-hook-rcodetools ()
  (define-key ruby-mode-map "\M-\C-i" 'rct-complete-symbol)
  (define-key ruby-mode-map "\C-c\C-t" 'ruby-toggle-buffer)
  (define-key ruby-mode-map "\C-c\C-d" 'xmp)
  (define-key ruby-mode-map "\C-c\C-f" 'rct-ri))
(add-hook 'ruby-mode-hook 'ruby-mode-hook-rcodetools)

;(require 'anything-rcodetools)
;(setq rct-get-all-methods-command "PAGER=cat fri -l")
;; See docs
;(define-key anything-map [(control ?;)] 'anything-execute-persistent-action)

;; smart-compile
(require 'smart-compile)
(define-key ruby-mode-map (kbd "C-c c") 'smart-compile)
(define-key ruby-mode-map (kbd "C-c C-c") (kbd "C-c c C-m"))

;;SmartCompile | Emacsからrubyを直接実行 | Drowsy Dog’s Diary
;;("\\.rb\\'"         . "ruby -cw %f")
;("\\.rb\\'"         . "ruby %f")
