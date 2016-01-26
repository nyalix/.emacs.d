



(require 'auto-highlight-symbol)
(global-auto-highlight-symbol-mode t)

(require 'highlight-symbol)
(setq highlight-symbol-colors '("DarkOrange" "DodgerBlue1" "DeepPink1")) ;; 使いたい色を設定、repeatしてくれる

;; 適宜keybindの設定
(global-set-key (kbd "<f3>") 'highlight-symbol-at-point)
(global-set-key (kbd "M-<f3>") 'highlight-symbol-remove-all)






;=================================================
;   rainbow-delimiters-mode
;=================================================
;; rainbow-delimiters-mode
;(defun my-rainbow-delimiters-mode-turn-on ()
;  (rainbow-delimiters-mode t))
;(add-hook 'emacs-lisp-mode-hook 'my-rainbow-delimiters-mode-turn-on)
; (add-hook 'c-mode-common-hook 'my-rainbow-delimiters-mode-turn-on)
;; 
;; rainbow-delimiters を使うための設定
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; 括弧の色を強調する設定
(require 'cl-lib)
(require 'color)
(defun rainbow-delimiters-using-stronger-colors ()
  (interactive)
  (cl-loop
   for index from 1 to rainbow-delimiters-max-face-count
   do
   (let ((face (intern (format "rainbow-delimiters-depth-%d-face" index))))
    (cl-callf color-saturate-name (face-foreground face) 30))))
(add-hook 'emacs-startup-hook 'rainbow-delimiters-using-stronger-colors)

;=================================================
;   highlight-indentation
;=================================================
(require 'highlight-indentation)

(set-face-background 'highlight-indentation-face "#465457")

;(set-face-background 'highlight-indentation-current-column-face "#ff0000")

(setq highlight-indentation-offset 2)

;; highlight-indentation-mode が呼ばれたら highlight-indentation-current-column-mode も実行する
(add-hook 'highlight-indentation-mode-hook 'highlight-indentation-current-column-mode)
;; 各種モードで highlight-indentation-mode が実行されるようにする
(add-hook 'jade-mode-hook 'highlight-indentation-mode)
(add-hook 'stylus-mode-hook  'highlight-indentation-mode)
(add-hook 'haskell-mode-hook 'highlight-indentation-mode)
;(add-hook 'scss-mode-hook   'highlight-indentation-mode)

;=======================================================================
(show-paren-mode)

;=======================================================================
; リージョンに色を付ける
;=======================================================================
(setq transient-mark-mode t)


;;;;;;;;
;; インデント設定e
;;;;;;;
(electric-indent-mode -1)
