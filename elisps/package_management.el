;;; package_management.el ---
;;
;; Filename: package_management.el
;; Description:
;; Author: Barath Ramesh
;; Maintainer:
;; Created: Sat Jun 11 08:22:48 2016 (-0400)
;; Version:
;; Last-Updated: Fri Oct  2 18:02:42 2020 (-0500)
;;           By: Barath Ramesh
;;     Update #: 55
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

;; written based of http://www.aaronbedra.com/emacs.d/
package-enable-at-startup
(require 'cl)

;;Package Management
(load "package")
(package-initialize)
(add-to-list 'package-archives
         '("marmalade" . "https://marmalade-repo.org/packages/"))
;; (add-to-list 'package-archives
;;          '("melpa" . "https://melpa.milkbox.net/packages/") t)

(add-to-list 'package-archives
         '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
;; and the old elpa repo
;; (add-to-list 'package-archives '("elpa-old" . "http://tromey.com/elpa/"))

;; (setq package-archive-enable-alist '(("melpa" deft magit)))

;;Define default packages
(defvar ~/.emacs.d/packages '(ac-c-headers
                  ac-math
                  aggressive-fill-paragraph
                  aggressive-indent
                  anaconda-mode
                  ;; anaconda-eldoc-mode
                  auto-complete-auctex
                  auto-complete-c-headers
                  auto-complete-clang
                  auto-package-update
                  ac-slime
                  ;; ac-etags
                  all-the-icons-ivy
                  auctex
                  auctex-latexmk
                  auto-complete-auctex
                  auto-complete
                  auto-complete-exuberant-ctags
                  ;; autofit-frame
                  autopair
                  base16-theme
                  ;; bookmark+
                  c-eldoc
                  clojure-mode
                  cmake-mode
                  cmake-ide
                  cmake-font-lock
                  cmake-project
                  ;; cmds-menu
                  ;;cpputils-cmake
                  ;;clojure-test-mode
                  coffee-mode
                  column-enforce-mode
                  color-theme-sanityinc-tomorrow
                  company
                  company-auctex
                  company-anaconda
                  company-irony
                  company-tabnine
                  counsel
                  crux
                  csharp-mode
                  ;; ctags
                  cuda-mode
                  cyberpunk-theme
                  ;; dired+
                  dired-hacks-utils
                  ;;doxymacs
                  deft
                  ein
                  ;; eldoc-eval
                  ;; eldoc-extension
                  electric-case
                  ;; electric-spacing
                  emms
                  enclose
                  ;; erlang
                  ess
                  ;; etags
                  ;; etags-select
                  ;; etags-table
                  feature-mode
                  ;; fit-frame
                  ;; frame-fns
                  flycheck
                  flymake-cursor
                  flyparens
                  flyspell-correct
                  flyspell-correct-ivy
                  flyspell-correct-popup
                  flyspell-lazy
                  format-all
                  ghub
                  gist
                  gnuplot
                  gnuplot-mode
                  go-mode
                  goto-chg
                  graphviz-dot-mode
                  haml-mode
                  haskell-mode
                  ;; header2
                  ;; help+
                  highlight
                  htmlize
                  image-dired
                  imenu-anywhere
                  ;; info+
                  irony
                  ivy
                  ivy-hydra
                  ivy-todo
                  ivy-yasnippet
                  julia-mode
                  latex-extra
                  latex-math-preview
                  latex-pretty-symbols
                  latex-preview-pane
                  lice
                  magit
                  matlab-mode
                  markdown-mode
                  markdown-preview-eww
                  markdown-preview-mode
                  ;; marmalade
                  ;; menu-bar+
                  ;; misc-cmds
                  ;; misc-fns
                  monokai-theme
                  multi-term
                  multiple-cursors
                  ;; naked
                  nlinum
                  nodejs-repl
                  ;;nrepl
                  o-blog
                  opencl-mode
                  openwith
                  org
                  org-ac
                  org-journal
                  paredit
                  pianobar
                  php-mode
                  polymode
                  poly-markdown
                  powerline
                  ;; pp+
                  ;; puppet-mode
                  request
                  restclient
                  rtags
                  rvm
                  scala-mode
                  ;; second-sel
                  smart-mode-line
                  smart-mode-line-powerline-theme
                  smex
                  sml-mode
                  solarized-theme
                  spacemacs-theme
                  srefactor
                  swiper
                  ;; strings
                  ;; subr+
                  tangotango-theme
                  telephone-line
                  tempo
                  ;; thingatpt+
                  twilight-theme
                  ;; w3
                  web-mode
                  websocket
                  whitespace-cleanup-mode
                  ;; wid-edit+
                  writegood-mode
                  xcscope
                  yafolding
                  yaml-mode
                  yasnippet
                  zen-and-art-theme
                  )
  "Default packages")

;;Install default packages
(defun ~/.emacs.d/packages-installed-p ()
  (loop for pkg in ~/.emacs.d/packages
    when (not (package-installed-p pkg)) do (return nil)
    finally (return t)))

(unless (~/.emacs.d/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg ~/.emacs.d/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; From http://draketo.de/light/english/emacs/babcore
;; Make sure a package is installed
(defun package-require (package)
  "Install a PACKAGE unless it is already installed
or a feature with the same name is already active.

Usage: (package-require 'package)"
                    ; try to activate the package with at least version 0.
  (package-activate package '(0))
                    ; try to just require the package. Maybe the user has it in his local config
  (condition-case nil
      (require package)
                    ; if we cannot require it, it does not exist, yet. So install it.
    (error (package-install package))))

;; Initialize installed packages
;; (package-initialize)
;; package init not needed, since it is done anyway in emacs 24 after reading the init
;; but we have to load the list of available packages
(package-refresh-contents)

;; auto-package-update
(auto-package-update-maybe)
(auto-package-update-at-time "17:30")
(setq auto-package-update-delete-old-versions t)


(defun activate-package (pkg)
  "Install a package if it is not present then require it"
  (unless (package-installed-p pkg)
    (package-refresh-contents)
    (package-install pkg))
  (require pkg))


(activate-package 'use-package)
(setq use-package-always-ensure t
      use-package-verbose t)


(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(require 'cl)

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

;; To find out existing packages that was installed using M-x package-install:
;; C-h v package-activated-list

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; package_management.el ends here
