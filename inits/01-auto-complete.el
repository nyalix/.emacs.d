;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;auto complete
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'auto-complete)
;;auto complete 有効
(global-auto-complete-mode t)
;;auto complete
(require 'auto-complete-config)
;(when (require 'auto-complete-config nil t)
;  (add-to-list 'ac-dictionary-directories
;	       "~/.emacs.d/elpa/auto-complete-20131128.233/dict")
;  (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)

  (add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
  (ac-config-default)


(eval-after-load "key-chord"
  '(progn
     (key-chord-define-global "M-tab" 'auto-complete)))




(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)
(define-key ac-completing-map (kbd "TAB") 'ac-complete)

(setq ac-dwim t)


