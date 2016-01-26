; https://github.com/elixir-lang/emacs-elixir
(require 'elixir-mode)
;https://github.com/tonini/alchemist.el
(require 'alchemist)


;(setq alchemist-buffer-status-modeline nil)

;; Highlights *.elixir2 as well
(add-to-list 'auto-mode-alist '("\\.elixir2\\'" . elixir-mode))
(add-hook 'elixir-mode-hook 'alchemist-mode)
(add-hook 'alchemist-mode-hook
          (lambda()
            (setq mode-name "Elixir-A")))

;====================================================
;  Smartparens
;===================================================

; https://github.com/Fuco1/smartparens/wiki

(eval-after-load "elixir-mode"
  '(progn
;     (require 'smartparens-ruby)
     (require 'smartparens-config)
     (set-face-attribute 'sp-show-pair-match-face nil
                         :background "grey20" :foreground "green"
                         :weight 'semi-bold)))

(add-hook 'elixir-mode-hook 'show-smartparens-mode)

(add-hook 'elixir-mode-hook 'ac-alchemist-setup)


(sp-with-modes '(elixir-mode)
  (sp-local-pair "fn" "end"
         :when '(("SPC" "RET"))
         :post-handlers '(sp-ruby-def-post-handler)
         :actions '(insert navigate))
  (sp-local-pair "do" "end"
         :when '(("SPC" "RET"))
         :post-handlers '(sp-ruby-def-post-handler)
         :actions '(insert navigate)))
