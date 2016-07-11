(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-file-name-transforms (backquote ((".*" (\, temporary-file-directory) t))))
 '(backup-directory-alist (backquote ((".*" \, temporary-file-directory))))
 '(column-number-mode t)
 '(custom-enabled-themes nil)
 '(custom-safe-themes t)
 '(custom-theme-load-path
   (quote
    ("~/.emacs.d/emacs-color-theme-solarized" custom-theme-directory t)))
 '(desktop-save-mode t)
 '(global-linum-mode t)
 '(ido-default-buffer-method (quote maybe-frame))
 '(ido-default-file-method (quote maybe-frame))
 '(ido-enable-flex-matching t)
 '(ido-everywhere t)
 '(ido-mode (quote both) nil (ido))
 '(mouse-wheel-progressive-speed nil)
 '(mouse-wheel-scroll-amount (quote (3 ((shift) . 1) ((control)))))
 '(scroll-conservatively 10000)
 '(scroll-error-top-bottom t)
 '(show-paren-delay 0)
 '(show-paren-mode t)
 '(show-paren-style (quote expression))
 '(vc-follow-symlinks t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq frame-title-format
      (setq icon-title-format
	    '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

(add-hook 'before-save-hook 'delete-trailing-whitespace)
