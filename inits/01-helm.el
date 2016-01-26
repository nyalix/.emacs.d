;==============================================================================================
;
;                        helm          anything
;
;==============================================================================================
(require 'anything)
(require 'anything-config)
;(require 'anything-match-plugin)

;
(require 'helm-config)
(require 'helm-descbinds)
(helm-descbinds-mode);C-h b
(require 'helm-migemo)

(eval-after-load "helm-migemo"
  '(defun helm-compile-source--candidates-in-buffer (source)
     (helm-aif (assoc 'candidates-in-buffer source)
         (append source
                 `((candidates
                    . ,(or (cdr it)
                           (lambda ()
                             ;; Do not use `source' because other plugins
                             ;; (such as helm-migemo) may change it
                             (helm-candidates-in-buffer (helm-get-current-source)))))
                   (volatile) (match identity)))
	 source)))


(setq helm-use-migemo t)

(global-set-key (kbd "C-x C-f") 'helm-for-files)
(global-set-key (kbd "M-x") 'helm-M-x)

(require 'helm-anything)
;Replace helm-resume and anything-resume with helm-anything-resume
(helm-anything-set-keys)




(require 'helm-match-plugin)


(defun helm-default-display-buffer (buf)
  (if helm-samewindow
      (switch-to-buffer buf)
    (progn
      (delete-other-windows)
      (split-window (selected-window) nil t)
      (pop-to-buffer buf))))
;=============================
; ag (the silver search)の設定
; M-x helm-ag-this-file
; コマンドの最後に現在のファイル名を appendする以外は helm-agと同じです。
; M-x helm-ag-pop-stack
; jump前の場所に戻る(元いた場所がファイルである場合に限る)
;
(require 'helm-files)
(require 'helm-ag)

;(global-set-key (kbd "M-g .") 'helm-ag)
;(global-set-key (kbd "M-g ,") 'helm-ag-pop-stack)
;(global-set-key (kbd "C-M-s") 'helm-ag-this-file)



;;; 特に個人的な設定
;; Command+f で helm-for-files
(define-key global-map (kbd "s-f") 'helm-for-files)
;; C-x b で helm-for-files
;(define-key global-map (kbd "C-x b") 'helm-for-files)
;; Command+y で anything-show-kill-ring
(define-key global-map (kbd "M-y") 'helm-show-kill-ring)
;; Command+r で anything-resume
(define-key global-map (kbd "s-r") 'helm-resume)

;(setq search-whitespace-regexp nil)

;M-x all を実行後
;M-g M-nやM-g M-pを実行してください。
;(require 'all)
(require 'all-ext)
