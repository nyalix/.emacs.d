;==========================
; point-undo
(when (require `point-undo nil t)
; (define-key global-map [f5] 'point-undo)
; (define-key global-map [f6] 'point-redo)
  ;;
  (define-key global-map (kbd "M-[") 'point-undo)
  (define-key global-map (kbd "M-]") 'point-redo)
  )


(require 'undo-tree)
(global-undo-tree-mode t)
(global-set-key (kbd "M-/") 'undo-tree-redo)


