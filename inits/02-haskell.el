


;;haskell-mode
;(load "/Users/Niltea/.emacs.d/elpa/haskell-mode-20130211.2254/haskell-site-file")
;;haskell-mode
;(load "/Users/Niltea/.emacs.d/elpa/haskell-mode-20130211.2254/haskell-site-file")
(setq haskell-program-name "/usr/local/bin/ghci")
(require 'haskell-mode)
(require 'haskell-cabal)
;(require 'haskell-mode-autoloads)

(require 'haskell-interactive-mode)
(require 'haskell-process)





(add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))
(add-to-list 'auto-mode-alist '("\\.lhs$" . literate-haskell-mode))
(add-to-list 'auto-mode-alist '("\\.cabal\\'" . haskell-cabal-mode))

(add-to-list 'interpreter-mode-alist '("runghc" . haskell-mode))     ;#!/usr/bin/env runghc 用
(add-to-list 'interpreter-mode-alist '("runhaskell" . haskell-mode)) ;#!/usr/bin/env runhaskell 用

;Basic indentation
(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;Block-based indentation
(eval-after-load "haskell-mode"
  '(progn
     (define-key haskell-mode-map (kbd "C-,") 'haskell-move-nested-left)
     (define-key haskell-mode-map (kbd "C-.") 'haskell-move-nested-right)))

; if you want to use another, johan-tibell, run M-x customize-variable hindent-style. 
(require 'hindent)
(add-hook 'haskell-mode-hook #'hindent-mode)

;Using rectangular region commands
;C-x r o is "Open Rectangle". It will shift any text within the rectangle to the right side. Also see:
;C-x r t is "String Rectangle". It will replace any text within the rectangle with the given string on all the lines in the region. If comment-region didn't already exist, you could use this instead, for example.
;C-x r d is "Delete Rectangle". It will delete the contents of the rectangle and move anything on the right over.
;C-x r r is "Copy Rectangle to Register". It will prompt you for a register number so it can save it for later.
;C-x r g is "Insert register". This will insert the contents of the given register, overwriting whatever happens to be within the target rectangle. (So make room)
;C-x r k is "Kill rectangle". Delete rectangle and save contents for:
;C-x r y is "Yank rectangle". This will insert the contents of the last killed rectangle.
;As with all Emacs modifier combos, you can type C-x r C-h to find out what keys are bound beginning with the C-x r prefix.

;Aligning code
(global-set-key (kbd "C-x a r") 'align-regexp)

;auto-insertion of module templates, enable:
;(add-hook 'haskell-mode-hook 'haskell-auto-insert-module-template)


(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)

(add-hook 'haskell-mode-hook 'font-lock-mode)
(add-hook 'haskell-mode-hook 'imenu-add-menubar-index)








;; ghc-mod
;gch-modを使えば，補完をおこなったり，’M-C-d’でEmacs上からモジュールのドキュメントを見たり
;"M-t"で先頭に”module Test where”といったテンプレートの挿入ができるようにる．
;; cabal でインストールしたライブラリのコマンドが格納されている bin ディレクトリへのパスを exec-path に追加する
(add-to-list 'exec-path (concat (getenv "HOME") "/.cabal/bin"))
(add-to-list 'load-path "~/.emacs.d/el-get/ghc-mod")
(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

;C-c, C-l でも起動.
(add-hook 'haskell-mode-hook 'inf-haskell-mode) ;; enable
;ghci の起動とファイルの読み込みを一緒に行う設定.

(defadvice inferior-haskell-load-file (after change-focus-after-load)
  "Change focus to GHCi window after C-c C-l command"
  (other-window 1))

(ad-activate 'inferior-haskell-load-file)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
;ac-ghc-mod

(require 'ac-ghc-mod)
(add-hook 'haskell-mode-hook 'haskell-ac-ghc-mod-hook)


(defun my-smartchr-keybindings-haskell ()
  (local-set-key (kbd "+")  (smartchr '(" + " " ++ " "+")))
  (local-set-key (kbd "-")  (smartchr '(" - " "-- " "-")))
  (local-set-key (kbd "*")  (smartchr '("*" " * " " <*> ")))
  (local-set-key (kbd ")")  (smartchr '(")" " >> " " >>= ")))
  (local-set-key (kbd "(")  (smartchr '("(" " <=< ")))
  (local-set-key (kbd ">")  (smartchr '(" -> " " => " " > " ">")))
  (local-set-key (kbd "<")  (smartchr '(" <- " " <= " " < " "<")))
  (local-set-key (kbd ":")  (smartchr '(":" " :: " " : ")))
  (local-set-key (kbd ";")  (smartchr '(";" " :: " " : ")))
  (local-set-key (kbd "!")  (smartchr '("!" " !! " " ! ")))
  (local-set-key (kbd "$")  (smartchr '(" $ " " <$> " "$")))
  (local-set-key (kbd "=")  (smartchr '(" = " " /= " " == " "=")))
  (local-set-key (kbd "|")  (smartchr '("|" " | " )))
  (local-set-key (kbd "`")  (smartchr '("``!!'`" "`" )))
  (local-set-key (kbd ".")  (smartchr '("." " . " )))
  )

(dolist (hook (list
               'haskell-mode-hook
               ))
  (add-hook hook 'my-smartchr-keybindings-haskell))
;flymake でシンタックスチェック
;

(add-hook 'haskell-mode-hook (lambda () (ghc-init) (flymake-mode)))


(define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
(define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
(define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
(define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
(define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
(define-key haskell-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
(define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)
(define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)


