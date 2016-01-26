
;===================shell
;参考 http://sakito.jp/emacs/emacsshell.html
(set-language-environment  "Japanese")
(prefer-coding-system 'utf-8)

;; より下に記述した物が PATH の先頭に追加されます
(dolist (dir (list
              "/sbin"
              "/usr/sbin"
              "/bin"
              "/usr/bin"
              "/opt/local/bin"
              "/sw/bin"
              "/usr/local/bin"
              (expand-file-name "~/bin")
              (expand-file-name "~/.emacs.d/bin")
              ))
;; PATH と exec-path に同じ物を追加します
(when (and (file-exists-p dir) (not (member dir exec-path)))
   (setenv "PATH" (concat dir ":" (getenv "PATH")))
   (setq exec-path (append (list dir) exec-path))))
;;MANPATHの設定
(setenv "MANPATH" (concat "/usr/local/man:/usr/share/man:/Developer/usr/share/man:/sw/share/man" (getenv "MANPATH")))

;; shell の存在を確認
;; 最初に見つけたshellを読み込む
(defun skt:shell ()
  (or (executable-find "zsh")
      (executable-find "bash")
      ;; (executable-find "f_zsh") ;; Emacs + Cygwin を利用する人は Zsh の代りにこれにしてください
      ;; (executable-find "f_bash") ;; Emacs + Cygwin を利用する人は Bash の代りにこれにしてください
      (executable-find "cmdproxy")
      (error "can't find 'shell' command in PATH!!")))

;; Shell 名の設定
(setq shell-file-name (skt:shell))
(setenv "SHELL" shell-file-name)
(setq explicit-shell-file-name shell-file-name)


;; load environment value
(load-file (expand-file-name "~/.emacs.d/shellenv.el"))
(dolist (path (reverse (split-string (getenv "PATH") ":")))
  (add-to-list 'exec-path path))

;exec-pathの内容をリセットしたいという場合は
;(setf exec-path nil)
;を scratchバッファにでも書いて評価(C-x C-e)して、再設定すれば
                                        ;よいでしょう。



;; Emacs が保持する terminfo を利用する
(setq system-uses-terminfo nil)
;;エスケープを綺麗に表示する
;;ls などで色が出るようにしていると Shell のエスケープ文字が表示されてしまう場合があります。これを避けるには以下の設定を init.el に記述します。
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)




;;multi-term.el
;(eval-when-compile (require 'cl))
;(load "/Users/*********/.emacs.d/elpa/multi-term-20130108.2305/multi-term")
(require 'multi-term)
(setq multi-term-program shell-file-name)

(add-to-list 'term-unbind-key-list '"M-x")
(add-hook 'term-mode-hook
         '(lambda ()
            ;; C-h を term 内文字削除にする
            (define-key term-raw-map (kbd "C-h") 'term-send-backspace)
            ;; C-y を term 内ペーストにする
            (define-key term-raw-map (kbd "C-y") 'term-paste)
            ))

;;C-c t で Shell が起動します。キーは好みで割り当てしてください。
(global-set-key (kbd "C-c t") '(lambda ()
                                (interactive)
                                (multi-term)))

;;C-c t で Shell が起動します。キーは好みで割り当てしてください。
;(global-set-key (kbd "C-c t") '(lambda ()
;                                (interactive)
;                                (term shell-file-name)))
