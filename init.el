;; .emacs ---
;;
;; Filename: .emacs
;; Description:
;; Author: Barath Ramesh
;; Maintainer:
;; Created: Fri Jul 17 15:33:56 2015 (-0400)
;; Version:
;; Last-Updated: Fri Oct  2 18:27:03 2020 (-0500)
;;           By: Barath Ramesh
;;     Update #: 956
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

(package-initialize)

(setq user-full-name "Barath Ramesh")
(setq user-mail-address "barath.ramesh@ti.com")

;; DO not close emacs accidentaly
(setq kill-emacs-query-functions
      (list (function (lambda ()
                        (ding)
                        (y-or-n-p "Really quit? ")))))

;;Environment
;; (setenv "PATH" (concat "/usr/local/bin:/opt/local/bin:/usr/bin:/bin" (getenv "PATH")))


;; What is this issue with julia-mode?
;; (add-to-list 'load-path "~/.emacs.d/elisps/")
;; (require 'julia-mode)

(load "~/.emacs.d/elisps/package_management")

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
(setq smex-save-file (expand-file-name ".smex-items" user-emacs-directory))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;;Ido mode
(load "~/.emacs.d/elisps/ido_settings")



;;Temporary file management
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;;autopair-mode
(require 'autopair)
(autopair-global-mode)

;;Power lisp
(load "~/.emacs.d/elisps/power_lisp")

;;auto-complete
;; (load "~/.emacs.d/elisps/auto_complete_settings.el")

(load "~/.emacs.d/elisps/ac_misc")

;; buffer cleanup
(load "~/.emacs.d/elisps/buffer_cleanup")

;;flyspell
(load "~/.emacs.d/elisps/flyspell_options")

;;Language Hooks
(load "~/.emacs.d/elisps/lang_hooks")

;;matlab mode in emacs, replace one in melpa
;; (require 'matlab-load)
;; (load "~/.emacs.d/elisps/matlab_load")

;;EMMS player, not working yet
(load "~/.emacs.d/elisps/emms_settings")

;;Locate Makefile in nearest directory and compile
(load "~/.emacs.d/elisps/make_options")

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

;; VHDL mode options, needs fixing
(load "~/.emacs.d/elisps/vhdl_options")

;;auto-header
(load "~/.emacs.d/elisps/auto_header_options")

;;opencl-mode
(require 'opencl-mode)
(add-to-list 'auto-mode-alist '("\\.cl\\'" . opencl-mode))

;;cuda-mode
;; (add-to-list 'load-path "~/.emacs.d/elisps/")
;; (require 'cuda-mode)

;;Pandora
;; (load "~/.emacs.d/elisps/pandora_settings.el")


;;lice
(setq lice:default-license "TI_MMALIB")

;; multi term
;; Buggy needs fixing
(setq multi-term-program "/bin/zsh")

;; Flymake: On the fly syntax checking
;; (load "~/.emacs.d/elisps/flymake_options")

;; go to the last change
;; (package-require 'goto-chg)
;; (global-set-key [(control .)] 'goto-last-change)
                                        ; M-. can conflict with etags tag search. But C-. can get overwritten
                                        ; by flyspell-auto-correct-word. And goto-last-change needs a really
                                        ; fast key.
;; (global-set-key [(meta .)] 'goto-last-change)

;; Highlight TODO and FIXME in comments
;; (package-require 'fic-mode)
;; (defun add-something-to-mode-hooks (mode-list something)
;;   "helper function to add a callback to multiple hooks"
;;   (dolist (mode mode-list)
;;     (add-hook (intern (concat (symbol-name mode) "-mode-hook")) something)))

;; (add-something-to-mode-hooks '(cuda c c++ tcl emacs-lisp python text
;;                                     markdown latex vhdl) 'fic-mode)


;; (spotify-enable-song-notifications)

;; enclose
;; (require 'enclose)
;;(enclose-global-mode)

;; cmake
;; (require 'cmake-mode)
;; (require 'rtags)
;; (cmake-ide-setup)
;; (autoload 'cmake-font-lock-activate "cmake-font-lock" nil t)
;; (add-hook 'cmake-mode-hook 'cmake-font-lock-activate)

;; disable flycheck mode for now; supress c7x compile warnings
;; flycheck mode
;; (global-flycheck-mode)
;; (put 'flycheck-clang-args 'safe-local-variable (lambda (xx) t))

;;Replace all freakin' ^M chars in the current buffer
(fset 'replace-ctrlms
      [escape ?< escape ?% ?\C-q ?\C-m return ?\C-q ?\C-j return ?!])
(global-set-key "\C-c\C-m" 'replace-ctrlms)

;; tags
;; (load "~/.emacs.d/elisps/tags_settings.el")

;; CEDET
;; (load "~/.emacs.d/elisps/cedet_options.el")

;; yasnippet
;; (require 'yasnippet)
;; (yas-global-mode 1)

;; tex, Rnw and auctex
(load "~/.emacs.d/elisps/tex_utils_settings")
(add-to-list 'load-path "~/.emacs.d/elisps/ess-knitr/")
(require 'ess-knitr)

;; ploymode
(load "~/.emacs.d/elisps/polymode_settings")
;; Playing with fonts
;; (set-fontset-font "fontset-default" 'gb18030 '("dejavu sans mono" . “unicode-bmp”))

;; crux - NOT WORKING
;; (global-set-key [remap move-beginning-of-line] 'crux-move-beginning-of-line)
;; (global-set-key (kbd "C-c o") 'crux-open-with)
;; (global-set-key [(shift return)] 'crux-smart-open-line)
;; (global-set-key (kbd "s-r") 'crux-recentf-ido-find-file)
;; (global-set-key (kbd "C-<backspace>") 'crux-kill-line-backwards)
;; (global-set-key [remap kill-whole-line] 'crux-kill-whole-line)

;; openwith
(load "~/.emacs.d/elisps/openwith_settings")

;; Aggressive indent mode
;; (global-aggressive-indent-mode 1)
;; (add-to-list 'aggressive-indent-excluded-modes 'html-mode)

;; (add-to-list
;;  'aggressive-indent-dont-indent-if
;;  '(and (derived-mode-p 'c++-mode 'c-mode)
;;        (null (string-match "\\([;{}]\\|\\b\\(if\\|for\\|while\\)\\b\\)"
;;                            (thing-at-point 'line)))))

;; Company and Irony for intellisense
(load "~/.emacs.d/elisps/irony_company_settings")

;; Indentation settings
(load "~/.emacs.d/elisps/indentation_settings")

;; Magit settings
(load "~/.emacs.d/elisps/magit_settings")

;; sml and powerline
;; (load "~/.emacs.d/elisps/sml_powerline")


;; flyparen needs fixing
;; (load "~/.emacs.d/elisps/flyparens_options")



;; doxymacs; got it in a hacky way from brew install and cp to this directory
;; (load "~/.emacs.d/elisps/doxymacs")

;; multiple cursors
(require 'multiple-cursors)

;; auto-complete-clang
;; (load "~/.emacs.d/elisps/auto_complete_clang_settings")


;; Make TeX and RefTex aware of Snw and Rnw files
;; (setq reftex-file-extensions
;;       '(("Snw" "Rnw" "nw" "tex" ".tex" ".ltx") ("bib" ".bib")))
;; (setq TeX-file-extensions
;;       '("Snw" "Rnw" "nw" "tex" "sty" "cls" "ltx" "texi" "texinfo"))

;; ;; Lets you do 'C-c C-c Sweave' from your Rnw file
;; (defun emacsmate-add-Sweave ()
;;   (add-to-list 'TeX-command-list
;;        '("Sweave" "R CMD Sweave %s"
;;               TeX-run-command nil (latex-mode) :help "Run Sweave") t)
;;   (add-to-list 'TeX-command-list
;;        '("LatexSweave" "%l %(mode) %s"
;;               TeX-run-TeX nil (latex-mode) :help "Run Latex after Sweave") t)
;;   (setq TeX-command-default "Sweave"))

;; (add-hook 'Rnw-mode-hook 'emacsmate-add-Sweave)

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

;; ESS
;; (require 'ess-site)
;; (require 'ess-rutils)
;; ;; (define-key R-mode-map ";" #'ess-insert-assign)
;; (add-hook 'R-mode-hook
;;           (lambda ()
;;             (local-set-key ";" #'ess-insert-assign)))

;; anaconda-mode
(add-hook 'python-mode-hook 'anaconda-mode)

;; JIRA settings
(load "~/.emacs.d/elisps/jira_options")

(require 'all-the-icons)

;; (setq powerline-default-separator 'wave)
;; (require 'spaceline-config)
;; (spaceline-emacs-theme)

(require 'spaceline-all-the-icons)
(require 'doom-modeline)
(doom-modeline-mode 1)

(use-package spaceline-all-the-icons
  :after spaceline
  :config (spaceline-all-the-icons-theme))

;; Fix spceline and icons issue with stable

;; (use-package spaceline
;;   :ensure t
;;   :pin melpa-stable)

;; (use-package spaceline-config
;;   :ensure spaceline
;;   :config
;;   ;; (use-package moe-theme
;;   ;;   :commands (powerline-moe-theme moe-theme-set-color))
;;   ;; (powerline-moe-theme)
;;   ;; (moe-theme-set-color 'blue)
;;   ;; (moe-dark)
;;   (setq powerline-default-separator 'wave)
;;   (spaceline-emacs-theme))


;; (use-package spaceline-all-the-icons
;;   :after spaceline
;;   :pin melpa-stable
;;   :config
;;   (setq spaceline-all-the-icons-eyebrowse-display-name  nil
;;      spaceline-all-the-icons-hide-long-buffer-path   t
;;      spaceline-all-the-icons-separator-type          'wave)
;;   (spaceline-all-the-icons--setup-neotree)
;;   (spaceline-toggle-all-the-icons-projectile-on)
;;   (spaceline-all-the-icons-theme))

;;Indentation
(setq tab-width 3
      indent-tabs-mode nil)
(setq-default c-basic-offset 3)

;; spacemacs theme
;; (load-theme 'spacemacs-dark t)
;; (setq spacemacs-theme-org-agenda-height nil)
;; (setq spacemacs-theme-org-height nil)

;; set sizes here to stop spacemacs theme resizing these
(set-face-attribute 'org-level-1 nil :height 1.0)
(set-face-attribute 'org-level-2 nil :height 1.0)
(set-face-attribute 'org-level-3 nil :height 1.0)
(set-face-attribute 'org-scheduled-today nil :height 1.0)
(set-face-attribute 'org-agenda-date-today nil :height 1.1)
(set-face-attribute 'org-table nil :foreground "#008787")
(use-package spaceline
  :demand t
  :init
  (setq powerline-default-separator 'arrow-fade)
  :config
  (require 'spaceline-config)
  (spaceline-spacemacs-theme))

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
(load "~/.emacs.d/elisps/mac-switch-meta")
(mac-switch-meta)

;; move cursor by camelCase
(global-subword-mode 1)

'(ivy-current-match ((t (:background "#00AF00"))))
'(ivy-highlight-face ((t (:background "#AF0000"))))

(toggle-frame-fullscreen)
(desktop-save-mode 1)

;; Ivy mode and swiper
(load "~/.emacs.d/elisps/ivy_settings")

;; emojify settings
(load "~/.emacs.d/elisps/emojify_settings")

(load "~/.emacs.d/elisps/company_jedi_settings")

;; .emacs ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-etags-requires 1)
 '(ansi-color-names-vector
   ["#000000" "#8b0000" "#00ff00" "#ffa500" "#7b68ee" "#dc8cc3" "#93e0e3" "#dcdccc"])
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(custom-safe-themes
   '("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "c29e00a62634efa10d45cf110f12574831b2599367f2169f553a338bac232fa3" "a802c77b818597cc90e10d56e5b66945c57776f036482a033866f5f506257bca" "868f73b5cf78e72ca2402e1d48675e49cc9a9619c5544af7bf216515d22b58e7" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "71ecffba18621354a1be303687f33b84788e13f40141580fa81e7840752d31bf" default))
 '(display-time-mode t)
 '(fci-rule-color "#383838")
 '(font-use-system-font t)
 '(package-selected-packages
   '(ein zenburn-theme zen-and-art-theme yaml-mode yafolding xterm-color xcscope writegood-mode whitespace-cleanup-mode which-key web-mode web-beautify w3m w32-browser volatile-highlights uuidgen twilight-theme telephone-line tangotango-theme srefactor spinner spacemacs-theme spaceline-all-the-icons solarized-theme sml-mode smex smart-mode-line-powerline-theme smart-mode-line-atom-one-dark-theme skewer-mode scala-mode rvm rtags-xref restclient restart-emacs request-deferred req-package rainbow-mode rainbow-delimiters pyenv-mode py-autopep8 popup-complete poly-R planet-theme pianobar php-mode paredit organic-green-theme org-journal org-ac openwith opencl-mode o-blog nyan-mode nodejs-repl nlinum multiple-cursors multi-term monokai-theme moe-theme micgoline matlab-mode markdown-preview-mode markdown-preview-eww markdown-mode+ magit-popup magit linum-relative lice latex-preview-pane latex-pretty-symbols latex-math-preview latex-extra julia-mode json-navigator json-mode jabber ivy-yasnippet ivy-todo ivy-prescient ivy-hydra irony-eldoc indent-guide imenu-anywhere htmlize hl-todo hl-indent highlight-operators highlight-numbers highlight-indent-guides highlight-doxygen highlight helm-rtags helm-jira header2 haskell-mode haml-mode graphviz-dot-mode graphql goto-chg google-translate golden-ratio go-mode gnuplot-mode gnuplot gitconfig-mode gist ghub format-all flyspell-lazy flyspell-correct-popup flyspell-correct-ivy flyparens flymake-json flymake-cursor flycheck-rtags flycheck-irony flx fill-column-indicator fic-mode feature-mode fancy-battery ess-smart-underscore ess-smart-equals ess-R-data-view enclose emojify emms elpy electric-case eldoc-eval el-get doom-themes doom-modeline dired-hacks-utils deft dash-functional cyberpunk-theme cuda-mode csv-mode csharp-mode crux counsel-tramp counsel-projectile company-tabnine company-rtags company-prescient company-math company-jedi company-irony-c-headers company-irony company-fuzzy company-emoji company-c-headers company-auctex company-anaconda column-enforce-mode color-theme-sanityinc-tomorrow coffee-mode cmake-project cmake-ide cmake-font-lock clojure-mode clang-format ccls c-eldoc buffer-move base16-theme autopair auto-package-update auto-complete-exuberant-ctags auto-complete-clang auto-complete-c-headers auto-complete-auctex auto-compile auctex-latexmk anzu anti-zenburn-theme all-the-icons-ivy all-the-icons-gnus all-the-icons-dired airline-themes aggressive-indent aggressive-fill-paragraph afternoon-theme ac-slime ac-math ac-c-headers))
 '(safe-local-variable-values
   '((eval pyvenv-activate "/ssh:mllab7:/home/ramesh/anaconda2/envs/pytorch")
     (lice:default-license . "chrec")))
 '(send-mail-function 'smtpmail-send-it)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(vhdl-electric-mode t t)
 '(vhdl-model-alist
   '(("Example Model" "<label> : process (<clock>, <reset>)
begin  -- process <label>
  if <reset> = '1' then  -- asynchronous reset (active high)
    <cursor>
  elsif <clock>'event and <clock> = '1' then  -- rising clock edge
    if <enable> = '1' then  -- synchronous load

    end if;
  end if;
end process <label>;" "e" "")))
 '(vhdl-reset-active-high t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ivy-current-match ((((class color) (background light)) :background nil :foreground nil) (((class color) (background dark)) :background "DimGrey" :foreground nil)))
 '(ivy-highlight-face ((t (:background "red"))))
 '(swiper-minibuffer-match-face-1 ((t :background "#dddddd")))
 '(swiper-minibuffer-match-face-2 ((t :background "#bbbbbb" :weight bold)))
 '(swiper-minibuffer-match-face-3 ((t :background "#bbbbff" :weight bold)))
 '(swiper-minibuffer-match-face-4 ((t :background "#ffbbff" :weight bold))))
