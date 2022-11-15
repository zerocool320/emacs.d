;;; company_tabnine_settings.el ---
;;
;; Filename: company_tabnine_settings.el
;; Description:
;; Author: Barath Ramesh
;; Maintainer:
;; Created: Thu Jun  4 19:27:40 2020 (-0500)
;; Version:
;; Last-Updated: Wed Feb 23 12:28:55 2022 (-0600)
;;           By: Barath Ramesh
;;     Update #: 9
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

(use-package company-tabnine
  :ensure t
  :config
  (add-to-list 'company-backends #'company-tabnine)
  ;; Trigger completion immediately.
  (setq company-idle-delay 0)
  ;; Number the candidates (use M-1, M-2 etc to select completions).
  (setq company-show-numbers t))

(provide 'company_tabnine_settings)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; company_tabnine_settings.el ends here
