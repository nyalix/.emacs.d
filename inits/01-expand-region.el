
;multiple-cursors, expand-region, smartrep
;http://shibayu36.hatenablog.com/entry/2013/12/30/190354

;追加の設定
;http://qiita.com/ongaeshi/items/3521b814aa4bf162181d

;; transient-mark-modeが nilでは動作しませんので注意
;(transient-mark-mode t)

(require 'expand-region)
(require 'multiple-cursors)
(require 'smartrep)

(global-set-key (kbd "C-,") 'er/expand-region)
(global-set-key (kbd "C-'") 'er/contract-region)


(global-set-key (kbd "C-M-c") 'mc/edit-lines)
(global-set-key (kbd "C-M-r") 'mc/mark-all-in-region)

(global-unset-key "\C-t")

(smartrep-define-key global-map "C-t"
  '(("C-t"      . 'mc/mark-next-like-this)
    ("n"        . 'mc/mark-next-like-this)
    ("p"        . 'mc/mark-previous-like-this)
    ("m"        . 'mc/mark-more-like-this-extended)
    ("u"        . 'mc/unmark-next-like-this)
    ("U"        . 'mc/unmark-previous-like-this)
    ("s"        . 'mc/skip-to-next-like-this)
    ("S"        . 'mc/skip-to-previous-like-this)
    ("*"        . 'mc/mark-all-like-this)
    ("d"        . 'mc/mark-all-like-this-dwim)
    ("i"        . 'mc/insert-numbers)
    ("o"        . 'mc/sort-regions)
    ("O"        . 'mc/reverse-regions)))
;http://qiita.com/ongaeshi/items/3521b814aa4bf162181d

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





