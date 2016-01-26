;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  yasnippet
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(setq yas/snippet-dirs "~/.emacs.d/elpa/yasnippet-20150320.334/snippets")

;(require 'yasnippet-bundle)

(require 'yasnippet)
;(yas-global-mode 1)


(yas-initialize)
(yas-load-directory "~/.emacs.d/vendor/snippets")

(setq yas-snippet-dirs
      '("~/.emacs.d/vendor/snippets"
        ))


(yas-global-mode 1)
