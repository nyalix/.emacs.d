

;外観
(require 'color-theme)
(color-theme-initialize)
(color-theme-molokai)

(column-number-mode t)
(setq frame-title-format "%f")


;;emacs 起動時の設定
(setq inhibit-startup-message t)
(tool-bar-mode 0)
(global-linum-mode t)
(setq next-line-add-newlines nil) ; ファイルの終端で勝手に新しい行を作らない
(setq scroll-step 1)              ; １行ずつ
(setq-default show-trailing-whitespace t) ; 行末の不要なスペースを強調表示する
(setq-default tab-width 2)                ; タブ幅
(setq-default indent-tabs-mode nil)       ; インデントにタブを使わない
;(add-hook 'before-save-hook 'delete-trailing-whitespace)
	                                 ; 保存時に無駄なスペースを削除





;;起動時にウィンドウを分割する
;(split-window-horizontally)
;(other-window 1)
;(split-window-vertically)

;;セッション(ウィンドウ状態)の保存
;;初めは手動でMーx desktop-save
;(desktop-load-default)
;(desktop-read)

;
