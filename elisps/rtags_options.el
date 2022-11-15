;;; rtags_options.el ---
;;
;; Filename: rtags_options.el
;; Description:
;; Author: Barath Ramesh
;; Maintainer:
;; Created: Tue Jun 21 01:13:16 2016 (-0400)
;; Version:
;; Last-Updated:
;;           By:
;;     Update #: 35
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:


;; From: https://martinsosic.com/development/emacs/2017/12/09/emacs-cpp-ide.html

(use-package rtags
  :ensure t
  :config
  (progn
    ;; ( setq rtags-completions-enabled t
    ;;         rtags-path "/home/ramesh/.emacs.d/rtags/src/rtags.el"
    ;;         rtags-rc-binary-name "/home/ramesh/.emacs.d/rtags/bin/rc"
    ;;         rtags-use-helm t
    ;;         rtags-rdm-binary-name "/home/ramesh/.emacs.d/rtags/bin/rdm")
    (unless (rtags-executable-find "rc") (error "Binary rc is not installed!"))
    (unless (rtags-executable-find "rdm") (error "Binary rdm is not installed!"))

    (define-key c-mode-base-map (kbd "M-.") 'rtags-find-symbol-at-point)
    (define-key c-mode-base-map (kbd "M-,") 'rtags-find-references-at-point)
    (define-key c-mode-base-map (kbd "M-?") 'rtags-display-summary)
    (rtags-enable-standard-keybindings)

    (setq rtags-use-helm t)
    (setq rtags-autostart-diagnostics t)
    (setq rtags-tramp-enabled t)

;;;; This is similar to setting $PATH env var, but for TRAMP
    ;; (add-to-list 'tramp-remote-path "/home/ubuntu/.emacs.d/rtags/bin")

;;;; This is the same as --socket-address to rc
    ;; (setq rtags-socket-address "my-remote-machine:8998")

;;;; Gives you an unfair advantage
    (setq rtags-rc-log-enabled t)

    ;; Shutdown rdm when leaving emacs.
    (add-hook 'kill-emacs-hook 'rtags-quit-rdm)
    ))

;; ;; TODO: Has no coloring! How can I get coloring?
;; (use-package helm-rtags
;;   :config
;;   (progn
;;     (setq rtags-display-result-backend 'helm)
;;     ))

;; Use rtags for auto-completion.
(use-package company-rtags
  :config
  (progn
    (setq rtags-autostart-diagnostics t)
    (rtags-diagnostics)
    (setq rtags-completions-enabled t)
    (push 'company-rtags company-backends)
    ))

;; Live code checking.
;; (use-package flycheck-rtags
;;   :config
;;   (progn
;;     ;; ensure that we use only rtags checking
;;     ;; https://github.com/Andersbakken/rtags#optional-1
;;     (defun setup-flycheck-rtags ()
;;       (flycheck-select-checker 'rtags)
;;       (setq-local flycheck-highlighting-mode nil) ;; RTags creates more accurate overlays.
;;       (setq-local flycheck-check-syntax-automatically nil)
;;       (rtags-set-periodic-reparse-timeout 2.0)  ;; Run flycheck 2 seconds after being idle.
;;       )
;;     (add-hook 'c-mode-hook #'setup-flycheck-rtags)
;;     (add-hook 'c++-mode-hook #'setup-flycheck-rtags)
;;     ))

;; ensure that we use only rtags checking
;; https://github.com/Andersbakken/rtags#optional-1
;; (defun setup-flycheck-rtags ()
;;   (interactive)
;;   (flycheck-select-checker 'rtags)
;;   ;; RTags creates more accurate overlays.
;;   (setq-local flycheck-highlighting-mode nil)
;;   (setq-local flycheck-check-syntax-automatically nil)
;;   )

;; ;; only run this if rtags is installed
;; (when (require 'rtags nil :noerror)
;;   ;; make sure you have company-mode installed
;;   (require 'company)
;;   (define-key c-mode-base-map (kbd "M-.")
;;     (function rtags-find-symbol-at-point))
;;   (define-key c-mode-base-map (kbd "M-,")
;;     (function rtags-find-references-at-point))
;;   ;; disable prelude's use of C-c r, as this is the rtags keyboard prefix
;;   ;; (define-key prelude-mode-map (kbd "C-c r") nil)
;;   ;; install standard rtags keybindings. Do M-. on the symbol below to
;;   ;; jump to definition and see the keybindings.
;;   (rtags-enable-standard-keybindings)
;;   ;; comment this out if you don't have or don't use helm
;;   ;; (setq rtags-use-helm t)
;;   ;; company completion setup
;;   (setq rtags-autostart-diagnostics t)
;;   (rtags-diagnostics)
;;   (setq rtags-completions-enabled t)
;;   (push 'company-rtags company-backends)
;;   (global-company-mode)
;;   (define-key c-mode-base-map (kbd "<C-tab>") (function company-complete))
;;   ;; use rtags flycheck mode -- clang warnings shown inline
;;   ;; (require 'flycheck-rtags)
;;   ;; c-mode-common-hook is also called by c++-mode
;;   )
;; (add-hook 'c-mode-common-hook #'setup-flycheck-rtags)


(provide 'rtags_options)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; rtags_options.el ends here
