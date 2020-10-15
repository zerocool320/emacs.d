;;; company_tabnine_settings.el ---
;;
;; Filename: company_tabnine_settings.el
;; Description:
;; Author: Barath Ramesh
;; Maintainer:
;; Created: Thu Jun  4 19:27:40 2020 (-0500)
;; Version:
;; Last-Updated: Wed Oct  7 10:36:02 2020 (-0500)
;;           By: Barath Ramesh
;;     Update #: 6
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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; company_tabnine_settings.el ends here
