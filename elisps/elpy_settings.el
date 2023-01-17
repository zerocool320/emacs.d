;;; elpy_settings.el ---
;;
;; Filename: elpy_settings.el
;; Description:
;; Author: Barath Ramesh
;; Maintainer:
;; Created: Wed Jun 17 15:36:47 2020 (-0500)
;; Version:
;; Last-Updated: Mon Dec 19 05:34:24 2022 (+0000)
;;           By: a0232371
;;     Update #: 78
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

;; (use-package elpy
;;   :mode ("\\.py\\'" . python-mode)
;;   :interpreter ("python" . python-mode)
;;   :init
;;   (setq-default python-shell-interpreter "python3")
;;   (setq elpy-shell-use-project-root nil)
;;   (setq elpy-rpc-python-command "python3")
;;   (setq elpy-modules (quote
;;     (elpy-module-company elpy-module-eldoc
;;     elpy-module-highlight-indentation elpy-module-yasnippet
;;     elpy-module-autodoc elpy-module-sane-defaults)))
;;   (elpy-enable))

(use-package elpy
  :ensure t
  ;; :pin melpa-stable
  :bind
  (:map elpy-mode-map
        ("C-M-n" . elpy-nav-forward-block)
        ("C-M-p" . elpy-nav-backward-block))
  :hook ((elpy-mode . flycheck-mode)
         (elpy-mode . (lambda ()
                        (set (make-local-variable 'company-backends)
                             '((elpy-company-backend :with company-jedi )))))
         )
  :init
  (setq elpy-modules (quote
                      (elpy-module-company elpy-module-eldoc
                                           ;; elpy-module-highlight-indentation
                                           elpy-module-yasnippet
                                           elpy-module-autodoc elpy-module-sane-defaults)))

  (setq elpy-shell-starting-directory (quote current-directory))
  (elpy-enable)
  :config
  ;; (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  ;;                                       ; fix for MacOS, see https://github.com/jorgenschaefer/elpy/issues/1550
  (setq elpy-shell-echo-output nil)
  (setq elpy-rpc-python-command "python3")
  (setq elpy-rpc-timeout 2))

;; Enable Flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))


;; Enable autopep8
;; (use-package py-autopep8
;;   :ensure t
;;   :config
;;   (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save))

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

;; (use-package ein
;;   :ensure t
;;   :commands (ein:notebooklist-open))

;; (use-package pyenv
;;   :ensure t)

;; (use-package pyenv-mode
;;   :ensure t)

(use-package anaconda-mode
  :ensure t
  :config
  (add-hook 'python-mode-hook 'anaconda-mode))

(use-package company-anaconda
  :ensure t
  :after (company)
  :config
  ;;  (eval-after-load "company"
  ;; '(add-to-list 'company-backends 'company-anaconda))
  (eval-after-load "company"
    '(add-to-list 'company-backends '(company-anaconda :with company-capf))))

;; (use-package python-black
;;   :ensure t
;;   :demand t
;;   :after python)

;; from https://medium.com/analytics-vidhya/managing-a-python-development-environment-in-emacs-43897fd48c6a


(use-package blacken
  :ensure t
  :hook (python-mode . blacken-mode)
  :config
  (setq blacken-line-length '78))


(use-package python
  :hook (inferior-python-mode . fix-python-password-entry)
  :config
  (setq python-shell-interpreter "jupyter-console"
        python-shell-interpreter-args "--simple-prompt"
        python-shell-prompt-detect-failure-warning nil)
  (add-to-list 'python-shell-completion-native-disabled-interpreters
               "jupyter-console")
  ;; (add-to-list 'python-shell-completion-native-disabled-interpreters
  ;;              "jupyter")
  (defun fix-python-password-entry ()
    (push
     'comint-watch-for-password-prompt comint-output-filter-functions))
  ;; (defun my-setup-python (orig-fun &rest args)
  ;;   "Use corresponding kernel"
  ;;   (let* ((curr-python (car (split-string (pyenv/version-name) ":")))
  ;;          (python-shell-buffer-name (concat "Python-" curr-python))
  ;;          (python-shell-interpreter-args (if (bound-and-true-p djangonaut-mode)
  ;;                                             "shell_plus -- --simple-prompt"
  ;;                                           (concat "--simple-prompt --kernel=" curr-python)))
  ;;          (python-shell-interpreter (if (bound-and-true-p djangonaut-mode)
  ;;                                        "django-admin"
  ;;                                      python-shell-interpreter)))
  ;;     (apply orig-fun args)))
  ;; (advice-add 'python-shell-get-process-name :around #'my-setup-python)
  ;; (advice-add 'python-shell-calculate-command :around #'my-setup-python)
  )

;; (add-hook 'python-mode-hook
;;           (lambda ()
;;             (anaconda-mode)
;;             (anaconda-eldoc-mode)
;;             (importmagic-mode)
;;             (local-set-key (kbd "C-x C-d") 'anaconda-mode-show-doc)
;;             (local-set-key (kbd "C-x C-w") 'anaconda-mode-find-definitions)
;;             (add-hook 'before-save-hook 'pyimport-remove-unused)
;;             (add-hook 'before-save-hook 'importmagic-fix-imports)
;;             (add-hook 'before-save-hook 'pyimpsort-buffer)
;;             (add-hook 'before-save-hook 'blacken-buffer)
;;             (set (make-local-variable 'compile-command)
;;                  (concat "python3 " (buffer-name)))))

;; Make C-c C-c behave like C-u C-c C-c in Python mode
;; (require 'python)
;; (define-key python-mode-map (kbd "C-c C-c")
;;   (lambda () (interactive) (python-shell-send-buffer t)))


(provide 'elpy_settings)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; elpy_settings.el ends here
