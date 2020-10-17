;;; projectile_settings.el ---
;;
;; Filename: projectile_settings.el
;; Description:
;; Author: Barath Ramesh
;; Maintainer:
;; Created: Mon May 18 12:01:33 2020 (-0500)
;; Version:
;; Last-Updated: Sat Oct 17 17:50:42 2020 (-0500)
;;           By: Barath Ramesh
;;     Update #: 20
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

;;; From https://docs.projectile.mx/en/latest/

(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1))

(use-package counsel-projectile
  :ensure t
  :config
  (counsel-projectile-mode 1))

(provide 'projectile_settings)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; projectile_settings.el ends here
