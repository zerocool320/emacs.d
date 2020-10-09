;;; flyspell_options.el ---
;;
;; Filename: flyspell_options.el
;; Description:
;; Author: Barath Ramesh
;; Maintainer:
;; Created: Sat Jun 11 18:58:57 2016 (-0400)
;; Version:
;; Last-Updated: Wed Oct  7 10:59:57 2020 (-0500)
;;           By: Barath Ramesh
;;     Update #: 5
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; flyspell_options.el ends here
