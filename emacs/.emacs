(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(apropos-do-all t)
 '(auto-save-file-name-transforms (backquote ((".*" (\, temporary-file-directory) t))))
 '(backup-directory-alist (backquote ((".*" \, temporary-file-directory))))
 '(column-number-mode t)
 '(custom-enabled-themes nil)
 '(custom-safe-themes t)
 '(custom-theme-load-path
   (quote
    ("~/.emacs.d/emacs-color-theme-solarized" custom-theme-directory t)))
 '(desktop-save-mode t)
 '(global-auto-complete-mode t)
 '(global-linum-mode t)
 '(ido-default-buffer-method (quote maybe-frame))
 '(ido-default-file-method (quote maybe-frame))
 '(ido-enable-flex-matching t)
 '(ido-everywhere t)
 '(ido-mode (quote both) nil (ido))
 '(indent-tabs-mode nil)
 '(mouse-wheel-progressive-speed nil)
 '(mouse-wheel-scroll-amount (quote (3 ((shift) . 1) ((control)))))
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/"))))
 '(package-enable-at-startup nil)
 '(scroll-conservatively 10000)
 '(scroll-error-top-bottom t)
 '(show-paren-delay 0)
 '(show-paren-mode t)
 '(show-paren-style (quote expression))
 '(tab-width 4)
 '(use-package-always-ensure t)
 '(vc-follow-symlinks t)
 '(whitespace-style
   (quote
    (face tabs spaces trailing space-before-tab newline indentation empty space-after-tab space-mark tab-mark newline-mark))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(unless (package-installed-p 'use-package)
    (progn
      (package-refresh-contents)
      (package-install 'use-package)))

(use-package auto-complete
  :ensure t)

(setq frame-title-format
      (setq icon-title-format
            '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

(add-hook 'before-save-hook 'delete-trailing-whitespace)
