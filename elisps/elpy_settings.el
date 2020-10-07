;;; elpy_settings.el ---
;;
;; Filename: elpy_settings.el
;; Description:
;; Author: Barath Ramesh
;; Maintainer:
;; Created: Wed Jun 17 15:36:47 2020 (-0500)
;; Version:
;; Last-Updated: Tue Oct  6 10:23:18 2020 (-0500)
;;           By: Barath Ramesh
;;     Update #: 20
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

(use-package elpy
  :ensure t
  :init
  (elpy-enable))

;; Enable Flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))


;; Enable autopep8
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; Use IPython for REPL
;; (setq python-shell-interpreter "jupyter"
;;       python-shell-interpreter-args "console --simple-prompt"
;;       python-shell-prompt-detect-failure-warning nil)
;; (add-to-list 'python-shell-completion-native-disabled-interpreters
;;              "jupyter")

;; (setq python-shell-interpreter "ipython")
;; (setq python-shell-interpreter-args "--pylab")

;; Enable Flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(use-package ein
  :ensure t
  :commands (ein:notebooklist-open))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; elpy_settings.el ends here
