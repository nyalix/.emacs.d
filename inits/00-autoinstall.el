(add-to-list 'load-path "~/.emacs.d/auto-install/")
(require 'auto-install)
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)
(setq ediff-window-setup-function 'eddiff-setup-windows-plain)


;;; 式の評価結果を注釈するための設定
(require 'lispxmp)
;; emacs-modeでC-c C-dを押すと注釈される
(define-key emacs-lisp-mode-map (kbd "C-c C-d") 'lispxmp)
;;; 括弧の対応を保持して編集する設定
(require 'paredit)
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
(add-hook 'slime-mode-hook 'enable-paredit-mode) ;slime
(add-hook 'lisp-interacion-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-mode-hook 'enable-paredit-mode)
(add-hook 'ielm-mode-hook 'enable-paredit-mode)


(require 'auto-async-byte-compile)
;; 自動バイトコンパイルを無効にするファイル名の正規表現
(setq auto-async-byte-compile-exclude-files-regexp "/junk/")
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
(setq eldoc-idle-delay 0.2)              ;すぐ表示したい
(setq eldoc-minor-mode-string "")        ;モードラインにElDocと表示しない
;; 釣り合いのとれる括弧をハイライトする
(show-paren-mode 1)
;; 開業と同時にインデントも行う
(global-set-key "\C-m" 'newline-and-indent)
;; find-functionをキー割り当てする
(find-function-setup-keys)

;; popwin-----------------------------------
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
(setq popwin:popup-window-position 'bottom)

;; *help*
(push '("*help*" :noselect t) popwin:special-display-config)
