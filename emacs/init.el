;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(apropos-do-all t)
 '(backup-by-copying t)
 '(backup-directory-alist (backquote (("." \, temporary-file-directory))))
 '(column-number-mode t)
 '(custom-enabled-themes (quote (adwaita)))
 '(delete-selection-mode t)
 '(desktop-save-mode t)
 '(dired-dwim-target t)
 '(dired-listing-switches "-alh")
 '(dired-recursive-copies (quote always))
 '(dired-recursive-deletes (quote always))
 '(global-linum-mode t)
 '(horizontal-scroll-bar-mode t)
 '(hscroll-step 1)
 '(ido-default-buffer-method (quote maybe-frame))
 '(ido-default-file-method (quote maybe-frame))
 '(ido-enable-flex-matching t)
 '(ido-everywhere t)
 '(ido-mode (quote both) nil (ido))
 '(indent-tabs-mode nil)
 '(mouse-wheel-progressive-speed nil)
 '(mouse-wheel-scroll-amount (quote (3 ((shift) . 1) ((control)))))
 '(scroll-conservatively most-positive-fixnum)
 '(scroll-error-top-bottom t)
 '(show-paren-delay 0)
 '(show-paren-mode t)
 '(show-paren-style (quote parenthesis))
 '(tab-width 4))
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

;; Custom global menu
(define-key-after
  global-map
  [menu-bar mymenu]
  (cons "MyMenu" (make-sparse-keymap "MyMenu")))

(define-key
  global-map
  [menu-bar mymenu whitespace]
  '("Whitespace Mode" . whitespace-mode))

(define-key-after
  global-map
  [menu-bar mymenu delete-trailing]
  '("Delete trailing whitespace" . delete-trailing-whitespace))

(define-key-after
  global-map
  [menu-bar mymenu ibuffer]
  '("Interactive buffer" . ibuffer))

; Customisation of diff-buffer-with-file, which prompts generically for any buffer
(defun diff-this-buffer-with-file ()
  "View the differences between current buffer and its associated file.
This requires the external program `diff' to be in your `exec-path'."
  (interactive)
  (diff buffer-file-name (current-buffer) nil 'noasync))

(define-key-after
  global-map
  [menu-bar mymenu diff-buffer]
  '("Diff buffer" . diff-this-buffer-with-file))

;; Custom dired menu
(require 'dired)
(require 'dired-x)

(define-key-after
  dired-mode-map
  [menu-bar mydiredmenu]
  (cons "MyDiredMenu" (make-sparse-keymap "MyDiredMenu")))

(define-key
  dired-mode-map
  [menu-bar mydiredmenu sort-by-name-time-toggle]
  '("Toggle sort by name/time" . dired-sort-toggle-or-edit))

(define-key-after
  dired-mode-map
  [menu-bar mydiredmenu open-file]
  '("Open file" . browse-url-of-dired-file))

;; This will also work
;; (kbd "M-! terminator RET")
(define-key-after
  dired-mode-map
  [menu-bar mydiredmenu terminal]
  `("Open Terminal" . ,(kbd "M-x dired-smart-shell-command RET terminator RET")))

;; Remap dired
(define-key
  dired-mode-map
  [mouse-2]
  'dired-mouse-find-file)

(setq dired-deletion-confirmer 'y-or-n-p)


;; Misc stuff

;; Example of function to keyboard macro
;; (defun foo () (interactive) (execute-kbd-macro (kbd "M-x diff-this-buffer-with-file RET")))

;; Unused

;; (unless (package-installed-p 'use-package)
;;     (progn
;;       (package-refresh-contents)
;;       (package-install 'use-package)))

;; (use-package auto-complete
;;   :ensure t)

 ;; '(auto-save-file-name-transforms (backquote ((".*" (\, temporary-file-directory) t))))
 ;; '(custom-enabled-themes nil)
 ;; '(custom-safe-themes t)
 ;; '(custom-theme-load-path
 ;;   (quote
 ;;    ("~/.emacs.d/emacs-color-theme-solarized" custom-theme-directory t)))
 ;; '(package-archives
 ;;   (quote
 ;;    (("gnu" . "http://elpa.gnu.org/packages/")
 ;;     ("melpa" . "https://melpa.org/packages/"))))
 ;; '(package-enable-at-startup nil)
 ;; '(use-package-always-ensure t)
 ;; '(vc-follow-symlinks t)
 ;; '(whitespace-style
 ;;   (quote
 ;;    (face tabs spaces trailing space-before-tab newline indentation empty space-after-tab space-mark tab-mark newline-mark))))
