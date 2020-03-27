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
 '(async-shell-command-buffer (quote new-buffer))
 '(backup-by-copying t)
 '(backup-directory-alist (backquote (("." \, temporary-file-directory))))
 '(column-number-mode t)
 '(custom-enabled-themes (quote (adwaita)))
 '(delete-selection-mode t)
 '(desktop-save-mode t)
 '(dired-dwim-target t)
 '(dired-listing-switches "-alh --group-directories-first")
 '(dired-omit-files "^\\.?#\\|^\\.[^\\.]")
 '(dired-recursive-copies (quote always))
 '(dired-recursive-deletes (quote always))
 '(fill-column 80)
 '(global-linum-mode t)
 '(golden-ratio-mode nil)
 '(horizontal-scroll-bar-mode t)
 '(hscroll-step 1)
 '(ido-default-buffer-method (quote maybe-frame))
 '(ido-default-file-method (quote maybe-frame))
 '(ido-enable-flex-matching t)
 '(ido-everywhere t)
 '(ido-mode (quote both) nil (ido))
 '(indent-tabs-mode nil)
 '(isearch-allow-scroll t)
 '(lazy-highlight-initial-delay 0)
 '(mouse-wheel-progressive-speed nil)
 '(mouse-wheel-scroll-amount (quote (3 ((shift) . 1) ((control)))))
 '(org-support-shift-select t)
 '(package-archive-priorities (quote (("melpa-stable" . 1) ("melpa" . 10) ("gnu" . 100))))
 '(package-archives
   (quote
    (("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa-stable" . "https://stable.melpa.org/packages/")
     ("melpa" . "https://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (golden-ratio golden-ratio-scroll-screen dired-ranger crux dired-subtree auto-complete magit org use-package)))
 '(scroll-conservatively most-positive-fixnum)
 '(scroll-error-top-bottom t)
 '(sentence-end-double-space nil)
 '(show-paren-delay 0)
 '(show-paren-mode t)
 '(show-paren-style (quote parenthesis))
 '(sublimity-mode nil)
 '(tab-width 4)
 '(vc-follow-symlinks t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(dired-subtree-depth-1-face ((t (:background "#99ffff"))))
 '(dired-subtree-depth-2-face ((t (:background "#99ffcc"))))
 '(dired-subtree-depth-3-face ((t (:background "#99ff99"))))
 '(dired-subtree-depth-4-face ((t (:background "#ccff99"))))
 '(dired-subtree-depth-5-face ((t (:background "#ffff99"))))
 '(dired-subtree-depth-6-face ((t (:background "#ffcc99")))))

;; Packages
(unless (package-installed-p 'use-package)
    (progn
      (package-refresh-contents)
      (package-install 'use-package)))

;; https://github.com/magit/magit
(use-package magit
  :ensure t)

;; https://github.com/auto-complete/auto-complete
(use-package auto-complete
  :ensure t)

;; https://github.com/bbatsov/crux
(use-package crux
  :ensure t)

;; https://github.com/Fuco1/dired-hacks
(use-package dired-subtree
  :ensure t)

(use-package dired-ranger
  :ensure t)

(use-package golden-ratio
  :ensure t)


(setq frame-title-format
      (setq icon-title-format
            '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; diff-buffer-with-file prompts generically for any buffer
;; This customisation diffs with file in current buffer
(defun diff-this-buffer-with-file ()
  "View the differences between current buffer and its associated file.
This requires the external program `diff' to be in your `exec-path'."
  (interactive)
  (diff buffer-file-name (current-buffer) nil 'noasync))

;; Remap keys
;; originally suspend-frame
(global-set-key (kbd "C-z") 'undo)

;; originally undo
(global-set-key (kbd "C-/") 'comment-line)

;; TODO: remap this
(global-set-key (kbd "C-a") 'crux-move-beginning-of-line)
(global-set-key (kbd "<home>") 'crux-move-beginning-of-line)
(global-set-key (kbd "C-k") 'crux-smart-kill-line)

;; originally isearch-forward
(global-set-key (kbd "C-s") 'save-buffer)

;; originally forward-char
(global-set-key (kbd "C-f") 'isearch-forward)
(define-key
  isearch-mode-map
  (kbd "C-f")
  'isearch-repeat-forward)

;; TODO: remap this
(global-set-key (kbd "C-r") nil)

;; (define-key
;;   isearch-mode-map
;;   (kbd "C-r")
;;   'isearch-repeat-forward)

;; originally scroll-up-command, scroll-down-command
(global-set-key (kbd "C-v") 'yank)
(global-set-key (kbd "M-v") 'yank-pop)

;; scroll-right
(global-set-key (kbd "C-<prior>") 'previous-buffer)
;; scroll-left
(global-set-key (kbd "C-<next>") 'next-buffer)

;; next-line
(global-set-key (kbd "C-n") 'make-frame-command)

(define-key global-map (kbd "C-1") (make-sparse-keymap))
(global-set-key (kbd "C-1 C-3") 'split-window-right)
(global-set-key (kbd "C-1 C-2") 'delete-window)
(global-set-key (kbd "C-1 C-1") 'delete-other-windows)

(define-key global-map (kbd "C-4") (make-sparse-keymap))
(global-set-key (kbd "C-4 C-1") 'dired-jump)
(global-set-key (kbd "C-4 C-2") 'magit)

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
  '("Interactive list buffers" . ibuffer))

(define-key-after
  global-map
  [menu-bar mymenu read-only]
  '("Read only mode" . read-only-mode))

(define-key-after
  global-map
  [menu-bar mymenu autocomplete]
  '("Autocomplete mode" . auto-complete-mode))

(define-key-after
  global-map
  [menu-bar mymenu autofill]
  '("Auto fill mode" . auto-fill-mode))

(define-key-after
  global-map
  [menu-bar mymenu diff-buffer]
  '("Diff buffer" . diff-this-buffer-with-file))

(define-key-after
  global-map
  [menu-bar mymenu indent-rigidly]
  '("Indent rigidly" . indent-rigidly))

(define-key-after
  global-map
  [menu-bar mymenu remove-search-highlight]
  '("Remove Search Highlight" . lazy-highlight-cleanup))

;; ========================================
;; Custom dired menu
;; ========================================
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

(define-key-after
  dired-mode-map
  [menu-bar mydiredmenu xdg-open]
  `("xdg-open" . ,(kbd "& xdg-open RET")))

;; This will also work
;; (kbd "M-! terminator RET")
(define-key-after
  dired-mode-map
  [menu-bar mydiredmenu terminal]
  `("Open Terminal" . ,(kbd "M-x dired-smart-shell-command RET terminator & RET")))

(define-key-after
  dired-mode-map
  [menu-bar mydiredmenu hidedetails]
  `("Hide Details" . dired-hide-details-mode))

(defun dired-edit-listing-switches ()
  (interactive)
  (setq current-prefix-arg '(4)) ; C-u
  (call-interactively 'dired-sort-toggle-or-edit))

(define-key-after
  dired-mode-map
  [menu-bar mydiredmenu editlisting]
  `("Edit listing switches" . dired-edit-listing-switches))

(add-hook 'dired-mode-hook (lambda () (dired-omit-mode)))

(define-key-after
  dired-mode-map
  [menu-bar mydiredmenu omit-mode]
  `("Omit mode" . dired-omit-mode))

(define-key-after
  dired-mode-map
  [menu-bar mydiredmenu ranger-copy]
  `("Ranger copy" . dired-ranger-copy))

(define-key-after
  dired-mode-map
  [menu-bar mydiredmenu ranger-paste]
  `("Ranger paste" . dired-ranger-paste))

(define-key-after
  dired-mode-map
  [menu-bar mydiredmenu ranger-move]
  `("Ranger move" . dired-ranger-move))

;; Remap dired
(define-key
  dired-mode-map
  [mouse-2]
  'dired-mouse-find-file)

(setq dired-deletion-confirmer 'y-or-n-p)

(define-key dired-mode-map [C-down-mouse-1] 'mouse-set-point)
;; (define-key dired-mode-map [C-mouse-1] 'dired-mouse-find-file-other-window-my)
(define-key dired-mode-map [C-mouse-1] 'dired-mouse-find-file-other-window-my)
;; (define-key dired-mode-map [C-mouse-1] 'dired-mouse-find-file-other-window)
(define-key dired-mode-map [down-mouse-3] 'mouse-set-point)
(define-key dired-mode-map [mouse-3] 'dired-subtree-toggle)

;; ========================================
;; Custom magit menu
;; ========================================
(define-key-after
  magit-mode-map
  [menu-bar mymagitmenu]
  (cons "MyMagitMenu" (make-sparse-keymap "MyMagitMenu")))

(define-key-after
  magit-mode-map
  [menu-bar mymagitmenu magitclean]
  `("Clean untracked" . magit-clean))

;; Dired subtree
(define-key
  dired-mode-map
  (kbd "TAB")
  ;; 'dired-subtree-toggle-my)
  'dired-subtree-toggle)

;; Misc stuff

;; Example of function to keyboard macro
;; (defun foo () (interactive) (execute-kbd-macro (kbd "M-x diff-this-buffer-with-file RET")))

;; Unused


 ;; '(auto-save-file-name-transforms (backquote ((".*" (\, temporary-file-directory) t))))
 ;; '(custom-enabled-themes nil)
 ;; '(custom-safe-themes t)
 ;; '(custom-theme-load-path
 ;;   (quote
 ;;    ("~/.emacs.d/emacs-color-theme-solarized" custom-theme-directory t)))
 ;; '(use-package-always-ensure t)
 ;; '(package-enable-at-startup nil)
 ;; '(whitespace-style
 ;;   (quote
 ;;    (face tabs spaces trailing space-before-tab newline indentation empty space-after-tab space-mark tab-mark newline-mark))))


;; https://github.com/Fuco1/dired-hacks/issues/167
;;;###autoload
;; (defun dired-subtree-insert-my ()
;;   "Insert subtree under this directory."
;;   (interactive)
;;   (when (and (dired-subtree--dired-line-is-directory-or-link-p)
;;              (not (dired-subtree--is-expanded-p)))
;;     (let* ((dir-name (dired-get-filename nil))
;;            (listing (dired-subtree--readin (file-name-as-directory dir-name)))
;;            beg end)
;;       (read-only-mode -1)
;;       (move-end-of-line 1)
;;       ;; this is pretty ugly, I'm sure it can be done better
;;       (save-excursion
;;         (insert listing)
;;         (setq end (+ (point) 2)))
;;       ;; https://github.com/Fuco1/dired-hacks/issues/167
;;       (insert "\n")
;;       ;; (newline)
;;       (setq beg (point))
;;       (let ((inhibit-read-only t))
;;         (remove-text-properties (1- beg) beg '(dired-filename)))
;;       (let* ((ov (make-overlay beg end))
;;              (parent (dired-subtree--get-ov (1- beg)))
;;              (depth (or (and parent (1+ (overlay-get parent 'dired-subtree-depth)))
;;                         1))
;;              (face (intern (format "dired-subtree-depth-%d-face" depth))))
;;         (when dired-subtree-use-backgrounds
;;           (overlay-put ov 'face face))
;;         ;; refactor this to some function
;;         (overlay-put ov 'line-prefix
;;                      (if (stringp dired-subtree-line-prefix)
;;                          (if (not dired-subtree-use-backgrounds)
;;                              (apply 'concat (-repeat depth dired-subtree-line-prefix))
;;                            (cond
;;                             ((eq nil dired-subtree-line-prefix-face)
;;                              (apply 'concat
;;                                     (-repeat depth dired-subtree-line-prefix)))
;;                             ((eq 'subtree dired-subtree-line-prefix-face)
;;                              (concat
;;                               dired-subtree-line-prefix
;;                               (propertize
;;                                (apply 'concat
;;                                       (-repeat (1- depth) dired-subtree-line-prefix))
;;                                'face face)))
;;                             ((eq 'parents dired-subtree-line-prefix-face)
;;                              (concat
;;                               dired-subtree-line-prefix
;;                               (apply 'concat
;;                                      (--map
;;                                       (propertize dired-subtree-line-prefix
;;                                                   'face
;;                                                   (intern (format "dired-subtree-depth-%d-face" it)))
;;                                       (number-sequence 1 (1- depth))))))))
;;                        (funcall dired-subtree-line-prefix depth)))
;;         (overlay-put ov 'dired-subtree-name dir-name)
;;         (overlay-put ov 'dired-subtree-parent parent)
;;         (overlay-put ov 'dired-subtree-depth depth)
;;         (overlay-put ov 'evaporate t)
;;         (push ov dired-subtree-overlays))
;;       (goto-char beg)
;;       (dired-move-to-filename)
;;       (read-only-mode 1)
;;       (run-hooks 'dired-subtree-after-insert-hook))))

;; ;;;###autoload
;; (defun dired-subtree-toggle-my ()
;;   "Insert subtree at point or remove it if it was not present."
;;   (interactive)
;;   (if (dired-subtree--is-expanded-p)
;;       (progn
;;         (dired-next-line 1)
;;         (dired-subtree-remove))
;;       (save-excursion (dired-subtree-insert-my))))

;; ;; quick toggle for testing
;; ;; (define-key dired-mode-map (kbd "<f10>") 'dired-subtree-toggle-my)


;; ;; ;; when exiting isearch, register the search term as regexp-highlight
;; ;; (defadvice isearch-done (after ysph-hl-search activate compile)
;; ;;            "highlight the search term after isearch has quit"
;; ;;            (unhighlight-regexp t)
;; ;;            (highlight-regexp (car (if isearch-regexp
;; ;;                                       regexp-search-ring
;; ;;                                       search-ring)) 'lazy-highlight))

;; (defun dired-subtree--after-readin-my (&optional subtrees)
;;   "Insert the SUBTREES again after dired buffer has been reverted.

;; If no SUBTREES are specified, use `dired-subtree-overlays'."
;;   (-when-let (subtrees-to-process (or subtrees dired-subtree-overlays))
;;     (let* ((ovs-by-depth (--sort (< (car it) (car other))
;;                                  (--group-by (overlay-get it 'dired-subtree-depth)
;;                                              subtrees-to-process)))
;;            (sorted-ovs (--map (cons (car it)
;;                                     (--map (-cons* it
;;                                                    (overlay-get it 'dired-subtree-name)
;;                                                    (-map (lambda (x) (cons x (overlay-get it x)))
;;                                                          dired-subtree-preserve-properties)) (cdr it)))
;;                               ovs-by-depth)))
;;       ;; (depth (path1 ov1 (prop1 . value1) (prop2 . value2)) (path2 ...))
;;       (--each sorted-ovs
;;         (--each (cdr it)
;;           (when (dired-utils-goto-line (cadr it))
;;             (dired-subtree--remove-overlay (car it))
;;             (dired-subtree-insert-my)
;;             (let ((ov (dired-subtree--get-ov)))
;;               (--each (cddr it)
;;                 (overlay-put ov (car it) (cdr it)))
;;               (dired-subtree--filter-subtree ov))))))))

;; (add-hook 'dired-after-readin-hook 'dired-subtree--after-readin-my)

;; Notes
;; https://www.reddit.com/r/emacs/comments/a5j3lc/emacs_key_binding_conventions_and_why_you_should/

;; (defun dired-mouse-find-file-other-window-my (event)
;;   "In Dired, visit the file or directory name you click on in another window."
;;   (interactive "e")
;;   (dired-mouse-find-file event 'dired-display-file 'dired-other-window))

(defun dired-mouse-find-file-other-window-my (event &optional find-file-func find-dir-func)
  "In Dired, visit the file or directory name you click on.
The optional arguments FIND-FILE-FUNC and FIND-DIR-FUNC specify
functions to visit the file and directory, respectively.  If
omitted or nil, these arguments default to `find-file' and `dired',
respectively."
  (interactive "e")
  (or find-file-func (setq find-file-func 'find-file))
  (or find-dir-func (setq find-dir-func 'dired))
  (let (window pos file)
    (save-excursion
      (setq window (posn-window (event-end event))
	    pos (posn-point (event-end event)))
      (if (not (windowp window))
	  (error "No file chosen"))
      (set-buffer (window-buffer window))
      (goto-char pos)
      (setq file (dired-get-file-for-visit)))
    (select-window window)
    (display-buffer (find-file-noselect file)
		  t)))
