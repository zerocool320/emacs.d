;; init.el ---
;;
;; Filename: init.el
;; Description:
;; Author: Barath Ramesh
;; Maintainer:
;; Created: Fri Jul 17 15:33:56 2015 (-0400)
;; Version:
;; Last-Updated: Wed Oct  7 13:00:48 2020 (-0500)
;;           By: Barath Ramesh
;;     Update #: 1022
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

;; Inspired from https://github.com/bbatsov/emacs.d/blob/master/init.el

;; TODO: Organize contents and use require instead of load

(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
;; keep the installed packages in .emacs.d
(setq package-user-dir (expand-file-name "elpa" user-emacs-directory))
(package-initialize)
;; update the package metadata is the local cache is missing
(unless package-archive-contents
  (package-refresh-contents))

;; Always load newest byte code
(setq load-prefer-newer t)

;; smart tab behavior - indent or complete
(setq tab-always-indent 'complete)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-verbose t)

;; DO not close emacs accidentaly
(setq kill-emacs-query-functions
      (list (function (lambda ()
                        (ding)
                        (y-or-n-p "Really quit? ")))))


(use-package auto-package-update
  :ensure t
  :config
  (auto-package-update-maybe)
  (auto-package-update-at-time "17:00")
  (setq auto-package-update-delete-old-versions t))

(use-package dash
  :ensure t
  :config (eval-after-load "dash" '(dash-enable-font-lock)))

(use-package s
  :ensure t)

(use-package f
  :ensure t)

(use-package auto-compile
  :init
  (setq load-prefer-newer t)
  :commands (auto-compile-on-load-mode)
  :config
  (setq auto-compile-display-buffer nil)
  (setq auto-compile-mode-line-counter t)
  (auto-compile-on-load-mode))

(load "~/.emacs.d/elisps/startup_options")

;;Backup files
(setq make-backup-files nil)

;;Yes and No
(defalias 'yes-or-no-p 'y-or-n-p)

;;Key bindings
(load "~/.emacs.d/elisps/key_bindings")

;;Settings, enable logging when tasks are complete
(load "~/.emacs.d/elisps/org_settings")

;;Smex
;; (setq smex-save-file (expand-file-name ".smex-items" user-emacs-directory))
;; (smex-initialize)
;; (global-set-key (kbd "M-x") 'smex)
;; (global-set-key (kbd "M-X") 'smex-major-mode-commands)
(use-package smex
  :ensure t
  :bind
  (("M-x" . smex)
   ("M-x" . smex-major-mode-commands))
  :config
  (smex-initialize))

;; ;;Ido mode
;; (load "~/.emacs.d/elisps/ido_settings")

;;Temporary file management
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;;Power lisp
(load "~/.emacs.d/elisps/power_lisp")

(load "~/.emacs.d/elisps/ac_misc")

;;flyspell
(load "~/.emacs.d/elisps/flyspell_options")

;; Doxygen for emacs ;; copy doxymacs folder from site-lisp after brew install
(add-to-list 'load-path "~/.emacs.d/doxymacs/")
(require 'doxymacs)
;; (add-hook 'c-mode-common-hook 'doxymacs-mode)
;; (defun my-doxymacs-font-lock-hook ()
;;   (if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
;;       (doxymacs-font-lock)))
;; (add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)

;; Cscope
(load "~/.emacs.d/elisps/cscope_settings")


;;auto-header
(load "~/.emacs.d/elisps/auto_header_options")

(use-package multi-term
  :ensure t
  :config
  ;; multi term
  ;; Buggy needs fixing
  (setq multi-term-program "/bin/zsh"))



;;Replace all freakin' ^M chars in the current buffer
(fset 'replace-ctrlms
      [escape ?< escape ?% ?\C-q ?\C-m return ?\C-q ?\C-j return ?!])
(global-set-key "\C-c\C-m" 'replace-ctrlms)

;; ploymode
(load "~/.emacs.d/elisps/polymode_settings")

;; Company and Irony for intellisense
(load "~/.emacs.d/elisps/irony_company_settings")

;; Indentation settings
;;Indentation
;; Emacs modes typically provide a standard means to change the
;; indentation width -- eg. c-basic-offset: use that to adjust your
;; personal indentation width, while maintaining the style (and
;; meaning) of any files you load.
(setq-default indent-tabs-mode nil)   ;; don't use tabs to indent
(setq-default tab-width 3)            ;; but maintain correct appearance

;; (use-package indent-guide
;;   :ensure t
;;   :config (indent-guide-global-mode 1))
(use-package highlight-indent-guides
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
  (setq highlight-indent-guides-method 'bitmap)
  (set-face-background 'highlight-indent-guides-odd-face "darkgray")
  (set-face-background 'highlight-indent-guides-even-face "dimgray")
  (set-face-foreground 'highlight-indent-guides-character-face "dimgray"))


;; Magit settings
(load "~/.emacs.d/elisps/magit_settings")

;; multiple cursors
(use-package multiple-cursors
  :ensure t
  :config
  ;; multiple cursors
  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this))



;; To re-compile all packages after major emacs udpate
;; Has resulted in error: “Symbol's function is void: cl-struct-define”
;; Magit did not work due to above error
;; C-u 0 M-x byte-recompile-directory
;; to force recompile all packages
;; M-: (byte-recompile-directory package-user-dir nil 'force)
;; tramp mode
(require 'tramp)
(setq tramp-default-method "ssh")
(tramp-set-completion-function "ssh"
			                      '((tramp-parse-sconfig "/etc/ssh_config")
				                     (tramp-parse-sconfig "~/.ssh/config")))
;; (customize-set-variable 'tramp-syntax 'simplified)

;; Automatically updated files modified outside of emacs
(global-auto-revert-mode t)
(setq auto-revert-remote-files t)

(use-package all-the-icons
  :ensure t)

(load "~/.emacs.d/elisps/display_settings")
(load "~/.emacs.d/elisps/doom-modeline")

;; Set fonts need to be set after sml
(load "~/.emacs.d/elisps/font_options")

(setq auto-package-update-delete-old-versions t)

;; projectile settings
(load "~/.emacs.d/elisps/projectile_settings")

;; counsel-tramp settings
(load "~/.emacs.d/elisps/counsel_tramp_settings")

;; which-key settings
(load "~/.emacs.d/elisps/which_key_settings")

;; rtags options
(load "~/.emacs.d/elisps/rtags_options")

;; company tabnine for autocomplete
(load "~/.emacs.d/elisps/company_tabnine_settings")

;; enable remot dir locals
(setq enable-remote-dir-locals t)

;; enable elpy
(load "~/.emacs.d/elisps/elpy_settings")

;; switch mac key from meta
;; (load "~/.emacs.d/elisps/mac-switch-meta")
;; (mac-switch-meta)

;; move cursor by camelCase
(global-subword-mode 1)

(toggle-frame-fullscreen)
(desktop-save-mode 1)

;; Ivy mode and swiper
(load "~/.emacs.d/elisps/ivy_settings")

(load "~/.emacs.d/elisps/company_jedi_settings")

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package rainbow-mode
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'rainbow-mode))

(use-package restart-emacs
  :ensure t)

(use-package smartparens
  :ensure t
  :config
  (require 'smartparens-config)
  ;; (add-hook 'prog-mode-hook #'smartparens-mode)
  ;; (global-smart-paren-mode 1)
  ;; Always start smartparens mode in js-mode.
  (add-hook 'js-mode-hook #'smartparens-mode))

(use-package format-all
  :ensure t
  :pin melpa-stable
  :config
  (add-hook 'prog-mode-hook 'format-all-mode))

(use-package whitespace
  :init
  (dolist (hook '(prog-mode-hook text-mode-hook))
    (add-hook hook #'whitespace-mode))
  (add-hook 'before-save-hook #'whitespace-cleanup)
  :config
  (setq whitespace-line-column 90) ;; limit line length
  (setq whitespace-style '(face tabs empty trailing lines-tail)))

(use-package avy
  :ensure t
  :bind (("s-." . avy-goto-word-or-subword-1)
         ("s-," . avy-goto-char))
  :config
  (setq avy-background t))

(use-package crux
  :ensure t
  :bind (("C-c o" . crux-open-with)
         ("M-o" . crux-smart-open-line)
         ("C-c n" . crux-cleanup-buffer-or-region)
         ("C-c f" . crux-recentf-find-file)
         ("C-M-z" . crux-indent-defun)
         ("C-c u" . crux-view-url)
         ("C-c e" . crux-eval-and-replace)
         ("C-c w" . crux-swap-windows)
         ("C-c D" . crux-delete-file-and-buffer)
         ("C-c r" . crux-rename-buffer-and-file)
         ("C-c t" . crux-visit-term-buffer)
         ("C-c k" . crux-kill-other-buffers)
         ("C-c TAB" . crux-indent-rigidly-and-copy-to-clipboard)
         ("C-c I" . crux-find-user-init-file)
         ("C-c S" . crux-find-shell-init-file)
         ("s-r" . crux-recentf-find-file)
         ("s-j" . crux-top-join-line)
         ("C-^" . crux-top-join-line)
         ("s-k" . crux-kill-whole-line)
         ("C-<backspace>" . crux-kill-line-backwards)
         ("s-o" . crux-smart-open-line-above)
         ([remap move-beginning-of-line] . crux-move-beginning-of-line)
         ([(shift return)] . crux-smart-open-line)
         ([(control shift return)] . crux-smart-open-line-above)
         ([remap kill-whole-line] . crux-kill-whole-line)
         ("C-c s" . crux-ispell-word-then-abbrev)))


(use-package diff-hl
  :ensure t
  :config
  (global-diff-hl-mode +1)
  (add-hook 'dired-mode-hook 'diff-hl-dired-mode)
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh))


(use-package undo-tree
  :ensure t
  :config
  ;; autosave the undo-tree history
  (setq undo-tree-history-directory-alist
        `((".*" . ,temporary-file-directory)))
  (setq undo-tree-auto-save-history t))

(use-package hl-todo
  :ensure t
  :config
  (setq hl-todo-highlight-punctuation ":")
  (global-hl-todo-mode))


;; quit Emacs directly even if there are running processes
(setq confirm-kill-processes nil)

;; Always load newest byte code
(setq load-prefer-newer t)

;; reduce the frequency of garbage collection by making it happen on
;; each 50MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 50000000)

(size-indication-mode t)

(setq ring-bell-function 'ignore)

;; warn when opening files bigger than 100MB
(setq large-file-warning-threshold 100000000)

;; Newline at end of file
(setq require-final-newline t)

;; delete the selection with a keypress
(delete-selection-mode t)

(defconst ramesh-savefile-dir (expand-file-name "savefile" user-emacs-directory))

;; create the savefile dir if it doesn't exist
(unless (file-exists-p ramesh-savefile-dir)
  (make-directory ramesh-savefile-dir))

;; saveplace remembers your location in a file when saving files
(use-package saveplace
  :config
  (setq save-place-file (expand-file-name "saveplace" ramesh-savefile-dir))
  ;; activate it for all buffers
  (setq-default save-place t))

(use-package savehist
  :config
  (setq savehist-additional-variables
        ;; search entries
        '(search-ring regexp-search-ring)
        ;; save every minute
        savehist-autosave-interval 60
        ;; keep the home clean
        savehist-file (expand-file-name "savehist" ramesh-savefile-dir))
  (savehist-mode +1))

(use-package recentf
  :config
  (setq recentf-save-file (expand-file-name "recentf" ramesh-savefile-dir)
        recentf-max-saved-items 500
        recentf-max-menu-items 15
        ;; disable recentf-cleanup on Emacs start, because it can cause
        ;; problems with remote files
        recentf-auto-cleanup 'never)
  (recentf-mode +1))

(use-package windmove
  :config
  ;; use shift + arrow keys to switch between visible buffers
  (windmove-default-keybindings))

(use-package dired
  :config
  ;; dired - reuse current buffer by pressing 'a'
  (put 'dired-find-alternate-file 'disabled nil)

  ;; always delete and copy recursively
  (setq dired-recursive-deletes 'always)
  (setq dired-recursive-copies 'always)

  ;; if there is a dired buffer displayed in the next window, use its
  ;; current subdir, instead of the current subdir of this dired buffer
  (setq dired-dwim-target t)

  ;; enable some really cool extensions like C-x C-j(dired-jump)
  (require 'dired-x))

;; config changes made through the customize UI will be stored here
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

;; init.el ends here
