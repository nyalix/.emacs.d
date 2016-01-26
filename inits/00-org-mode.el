;org-mode

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/gtd.org" "Tasks")
     "* TODO %?\n  %i\n  %a")
        ("j" "Journal" entry (file+datetree "~/org/journal.org")
     "* %?\nEntered on %U\n  %i\n  %a")))












;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (defun my/get-curernt-path ()
    (if (equal major-mode 'dired-mode)
  default-directory
  (buffer-file-name)))
 
(defun my/copy-current-path ()
  (interactive)
  (let ((fPath (my/get-curernt-path)))
    (when fPath
      (message "stored path: %s" fPath)
      (kill-new (file-truename fPath)))))
 
(global-set-key (kbd "C-c p") 'my/copy-current-path)

(defun my/copy-current-org-link-path ()
  (interactive)
  (let* ((fPath (my/get-curernt-path))
   (fName (file-relative-name fPath)))
    (my/copy-org-link fPath fName)))
 
(defun my/copy-org-link (my/current-path my/current-title)
  (let ((orgPath
   (format "[[%s][%s]]" my/current-path my/current-title)))
    (message "stored org-link: %s" orgPath)
    (kill-new orgPath)))
 
(global-set-key (kbd "C-c y") 'my/copy-current-org-link-path)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/junk/2015/03/20-212658.org" "~/org/journal.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;コードの折り返し
(global-set-key (kbd "C-c n") 'toggle-truncate-lines)
