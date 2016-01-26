;; markdown mode
;; markdownモード（gfm-mode Github flavor markdown mode）を拡張子と関連付けする
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))

;; ファイル内容を標準入力で渡すのではなく、ファイル名を引数として渡すように設定
(defun markdown-custom ()
  "markdown-mode-hook"
  (setq markdown-command-needs-filename t)
  )
(add-hook 'markdown-mode-hook '(lambda() (markdown-custom)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(require 'w3m-load)
;; w3mのbinaryの場所指定
(setq w3m-command "/usr/local/bin/w3m")
(require 'w3m)
(require 'markdown-mode)

(defun w3m-browse-url-other-window (url &optional newwin)
  (let ((w3m-pop-up-windows t))
    (if (one-window-p) (split-window))
    (other-window 1)
    (w3m-browse-url url newwin)))

(defun markdown-render-w3m (n)
  (interactive "p")
  (message (buffer-file-name))
  (call-process "/usr/local/bin/grip" nil nil nil
                "--gfm" "--export"
                (buffer-file-name)
                "/tmp/grip.html")
  (w3m-browse-url-other-window "file://tmp/grip.html")
  )
(define-key markdown-mode-map "C-c C-c c" 'markdown-render-w3m)
