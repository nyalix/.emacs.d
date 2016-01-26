;;========================================================================
;;
;;                                 Common Lisp
;;
;;========================================================================
;; SBCLをデフォルトのCommon Lisp処理系に設定
(setq inferior-lisp-program "/usr/local/bin/sbcl")
;; ~/.emacs.d/slimeをload-pathに追加
(add-to-list 'load-path (expand-file-name "~/.emacs.d/slime"))
;; SLIMEのロード
(require 'slime)
;(slime-setup '(slime-repl slime-fancy slime-banner))
(slime-setup '(slime-repl slime-fancy slime-banner slime-js))

(setq slime-lisp-implementations
      '((sbcl ("sbcl") :coding-system utf-8-unix)
	(cmucl ("cmucl") :coding-system iso-latin-1-unix)))
;; SLIMEからの入力をUTF-8に設定
(setq slime-net-coding-system 'utf-8-unix)

;;ac-slime
;(load "/Users/Niltea/.emacs.d/elpa/ac-slime-20130503.1302/ac-slime")

(require 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)


;日本語利用
;;(setq slime-net-coding-system 'utf-8-unix)

;; カーソル付近にある単語の情報を表示
;(slime-autodoc-mode)


;; paredit for slime-repl
; (add-hook 'slime-repl-mode-hook (lambda () (paredit-mode +1)))
;; Stop SLIME's REPL from grabbing DEL,
;; which is annoying when backspacing over a '('
;(defun override-slime-repl-bindings-with-paredit ()
;  (define-key slime-repl-mode-map
;     (read-kbd-macro paredit-backward-delete-key) nil))
;(add-hook 'slime-repl-mode-hook 'override-slime-repl-bindings-with-paredit)


;; Apropos
(push '("*slime-apropos*") popwin:special-display-config)
;; Macroexpand
(push '("*slime-macroexpansion*") popwin:special-display-config)
;; Help
(push '("*slime-description*") popwin:special-display-config)
;; Compilation
(push '("*slime-compilation*" :noselect t) popwin:special-display-config)
;; Cross-reference
(push '("*slime-xref*") popwin:special-display-config)
;; Debugger
(push '(sldb-mode :stick t) popwin:special-display-config)
;; Repl
(push '(slime-repl-mode) popwin:special-display-config)
;; Connections
(push '(slime-connection-list-mode) popwin:special-display-config)


;(require 'lispxmp)
;; emacs-modeでC-c C-dを押すと注釈される
(define-key slime-mode-map (kbd "C-c ;") 'lispxmp) ;slime


;==========================================\
;
;==========================================

(defun my-smartchr-keybindings-smile ()
  (local-set-key (kbd "'")  (smartchr '("'" "`" "~" )));\|\|
  (local-set-key (kbd "/")  (smartchr '("/" "//" "\\")))

;  (local-set-key (kbd "+")  (smartchr '(" + " " ++ " "+")))
;  (local-set-key (kbd "-")  (smartchr '(" - " "-- " "-")))
;  (local-set-key (kbd "*")  (smartchr '("*" " * " " <*> ")))
;  (local-set-key (kbd ")")  (smartchr '(")" " >> " " >>= ")))
;  (local-set-key (kbd "(")  (smartchr '("(" " <=< ")))
;  (local-set-key (kbd ">")  (smartchr '(" -> " " => " " > " ">")))
;  (local-set-key (kbd "<")  (smartchr '(" <- " " <= " " < " "<")))
;  (local-set-key (kbd ":")  (smartchr '(":" " :: " " : ")))
;  (local-set-key (kbd ";")  (smartchr '(";" " :: " " : ")))
;  (local-set-key (kbd "!")  (smartchr '("!" " !! " " ! ")))
;  (local-set-key (kbd "$")  (smartchr '(" $ " " <$> " "$")))
;  (local-set-key (kbd "=")  (smartchr '(" = " " /= " " == " "=")))
;  (local-set-key (kbd "|")  (smartchr '("|" " | " )))
;  (local-set-key (kbd "`")  (smartchr '("``!!'`" "`" )))
;  (local-set-key (kbd ".")  (smartchr '("." " . " )))
  )

(dolist (hook (list
               'slime-mode-hook
               ))
  (add-hook hook 'my-smartchr-keybindings-smile))
