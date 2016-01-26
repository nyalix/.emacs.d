
;; Mac OS X の HFS+ ファイルフォーマットではファイル名は NFD (の様な物)で扱うため以下の設定をする必要がある
(require 'ucs-normalize)
(setq file-name-coding-system 'utf-8-hfs)
(setq locale-coding-system 'utf-8-hfs)

;emacs mac ports ver
;(mac-auto-ascii-mode 1)
;(setq mac-command-key-is-meta nil)
;(setq mac-option-modifier 'meta)
;(setq mac-command-modifier 'super)

; Mac用フォント設定
;; http://tcnksm.sakura.ne.jp/blog/2012/04/02/emacs/

;; 英語
(set-face-attribute 'default nil
             :family "Ricty" ;; font  ;Menlo
             :height 160)    ;; font size

;; 日本語
(set-fontset-font
 nil 'japanese-jisx0208
;; (font-spec :family "Hiragino Mincho Pro")) ;; font
;; (font-spec :family "Hiragino Kaku Gothic ProN")) ;; font
 (font-spec :family "Ricty")) ;; font

;; 半角と全角の比を1:2に
(setq face-font-rescale-alist
      '((".*Hiragino_Mincho_proN.*" . 1.2)))
;      '((".*Hiragino_Mincho_pro.*" . 1.2)))

;(setq default-input-method "english-dvorak")
;(mac-set-input-method-parameter "com.google.inputmethod.Japanese.base" `title "あ")

;; カーソルの色
;(mac-set-input-method-parameter "com.google.inputmethod.Japanese.base" `cursor-color "red")
;(mac-set-input-method-parameter "com.apple.keylayout.US" `cursor-color "blue")
;; (mac-set-input-method-parameter "com.google.inputmethod.Japanese.Roman" `cursor-color "blue")


;; emacs 起動時は英数モードから始める
(add-hook 'after-init-hook 'mac-change-language-to-us)
;; minibuffer 内は英数モードにする
(add-hook 'minibuffer-setup-hook 'mac-change-language-to-us)
;; [migemo]isearch のとき IME を英数モードにする
(add-hook 'isearch-mode-hook 'mac-change-language-to-us)


;; minibuffer 内は英数モードにする
(add-hook 'minibuffer-setup-hook 'mac-change-language-to-us)

;; [migemo]isearch のとき IME を英数モードにする
(add-hook 'isearch-mode-hook 'mac-change-language-to-us)





;ATOK23.0の場合
;「*scratch*」バッファでIMを有効化した状態で「(mac-get-current-input-source)」を評価
;(C-x C-e）で分かる
(setq default-input-method "MacOSX")
;(mac-set-input-method-parameter "com.justsystems.inputmethod.atok23.Japanese" `title "あ")
;(mac-set-input-method-parameter "com.justsystems.inputmethod.atok23.Japanese" `cursor-type 'box)
;(mac-set-input-method-parameter "com.justsystems.inputmethod.atok23.Japanese" `cursor-color "magenta")


;(setq default-input-method "MacOSX")
;(mac-set-input-method-parameter "com.apple.keylayout.Dvorak" 'title "DV")

;(mac-set-input-method-parameter "com.apple.keylayout.Dvorak" `cursor-type 'box)
;(mac-set-input-method-parameter "com.apple.keylayout.Dvorak" 'cursor-color "red")




  ;(add-hook
  ;  'post-command-hook
  ;   (lexical-let ((previous-buffer nil))
  ;     #'(lambda ()
  ;         (unless (eq (current-buffer) previous-buffer)
  ;          (if (bufferp previous-buffer) (mac-handle-input-method-change))
  ;          (setq previous-buffer (current-buffer))))))

