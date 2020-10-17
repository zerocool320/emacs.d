;;; company_jedi_settings.el ---
;;
;; Filename: company_jedi_settings.el
;; Description:
;; Author: Barath Ramesh
;; Maintainer:
;; Created: Sat Oct 17 17:54:39 2020 (-0500)
;; Version:
;; Last-Updated: Sat Oct 17 17:54:58 2020 (-0500)
;;           By: Barath Ramesh
;;     Update #: 3
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:


(defun company-jedi-setup ()
  (add-to-list 'company-backends 'company-jedi))

(use-package company-jedi
  :ensure t
  :init
  (add-hook 'python-mode-hook 'company-jedi-setup))


(provide 'company_jedi_settings)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; company_jedi_settings.el ends here
