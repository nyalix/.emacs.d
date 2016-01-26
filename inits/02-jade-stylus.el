;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   HTML5 css3編集（stylus-mode jade-mode）
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

 ;; (add-to-list 'load-path "/path/to/jade-mode")
(require 'stylus-mode)
(require 'jade-mode)
(add-to-list 'auto-mode-alist '("\\.styl$" . stylus-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))
(add-to-list 'ac-modes 'stylus-mode)
(add-to-list 'ac-modes 'jade-mode)

;; jade自動コンパイル
;; Emacsにjadeコマンドのあるフォルダを教える
(setenv "PATH" (concat "/usr/local/lib/node_modules/jade" ":" (getenv "PATH")))
;; jadeからhtmlへコンパイル
(defun jade-compile ()
  (interactive)
  (let ((from buffer-file-name))
    (shell-command (concat "jade " "-P " from) )))
;; 保存時に自動でjadeからhtmlへコンパイル
(add-hook 'jade-mode-hook
          (lambda ()
            (add-hook 'after-save-hook 'jade-compile nil t)))
(define-key jade-mode-map "\C-c\C-d" 'jade-compile)

;; stylus自動コンパイル
;; Emacsにjadeコマンドのあるフォルダを教える
(setenv "PATH" (concat "/usr/local/lib/node_modules/stylus" ":" (getenv "PATH")))
;; stylusからhtmlへコンパイル
(defun stylus-compile ()
  (interactive)
  (let ((from buffer-file-name))
    (shell-command (concat "stylus " from " --include " "/usr/local/lib/node_modules/nib/lib " ) )))
;; 保存時に自動でjadeからhtmlへコンパイル
(add-hook 'stylus-mode-hook
          (lambda ()
            (add-hook 'after-save-hook 'stylus-compile nil t)))
(define-key stylus-mode-map "\C-c\C-d" 'stylus-compile)

