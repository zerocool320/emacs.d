;;; counsel_tramp_settings.el ---
;;
;; Filename: counsel_tramp_settings.el
;; Description:
;; Author: Barath Ramesh
;; Maintainer:
;; Created: Mon May 18 12:54:10 2020 (-0500)
;; Version:
;; Last-Updated: Mon May 18 13:15:15 2020 (-0500)
;;           By: Barath Ramesh
;;     Update #: 5
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

(use-package counsel-tramp
  :ensure t
  :config
  (setq tramp-default-method "ssh")
  (define-key global-map (kbd "C-c s") 'counsel-tramp)
  (setq make-backup-files nil)
  (setq create-lockfiles nil))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; counsel_tramp_settings.el ends here
