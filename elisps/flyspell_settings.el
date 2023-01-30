(use-package flyspell
  :config
  (when (eq system-type 'windows-nt)
    (add-to-list 'exec-path "C:/Program Files (x86)/Aspell/bin/"))
  (setq ispell-program-name "aspell" ; use aspell instead of ispell
        ispell-extra-args '("--sug-mode=ultra"))
  (add-hook 'text-mode-hook #'flyspell-mode)
  (add-hook 'prog-mode-hook #'flyspell-prog-mode)
  (setq flyspell-issue-welcome-flag nil)
  (if (eq system-type 'darwin)
      (setq-default ispell-program-name "/usr/local/bin/aspell")
    (setq-default ispell-program-name "/usr/bin/aspell"))
  (setq-default ispell-list-command "list")
  ;;magit commit
  (add-hook 'text-mode-hook
            (lambda ()
              (flyspell-mode)))
  )


;; (add-hook 'c-mode-common-hook 'flyspell-prog-mode)
;; (add-hook 'prog-mode-hook 'flyspell-prog-mode)

(provide 'flyspell_settings)
