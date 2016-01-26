;;reload
(global-set-key
 [f12] 'eval-buffer)

;;ファイルの自動再読み込み
(global-auto-revert-mode t)
;


;==============================
;;; For folding
;;; hideshow.el

;; C coding style
(add-hook 'c-mode-hook
          '(lambda ()
      (hs-minor-mode 1)))
;; Scheme coding style
(add-hook 'scheme-mode-hook
          '(lambda ()
      (hs-minor-mode 1)))
;; Elisp coding style
(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
      (hs-minor-mode 1)))
;; Lisp coding style
(add-hook 'lisp-mode-hook
          '(lambda ()
      (hs-minor-mode 1)))
;; Python coding style
(add-hook 'python-mode-hook
          '(lambda ()
      (hs-minor-mode 1)))

(define-key
  global-map
  (kbd "C-/") 'hs-toggle-hiding)


;==============================
;


