;;; projectile_settings.el ---
;;
;; Filename: projectile_settings.el
;; Description:
;; Author: Barath Ramesh
;; Maintainer:
;; Created: Mon May 18 12:01:33 2020 (-0500)
;; Version:
;; Last-Updated: Sat Oct 17 19:35:53 2020 (-0500)
;;           By: Barath Ramesh
;;     Update #: 22
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


(use-package org-projectile
  :bind (("C-c n p" . org-projectile-project-todo-completing-read)
         ("C-c c" . org-capture))
  :config
  (org-projectile-per-project)
  (progn
    (setq org-projectile-per-project-filepath "my_project_todo_filename.org")
    (setq org-agenda-files (append org-agenda-files (org-projectile-todo-files)))
    (setq org-agenda-files (append org-agenda-files (org-projectile-todo-files)))
    (push (org-projectile-project-todo-entry) org-capture-templates))
  :ensure t)

(provide 'projectile_settings)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; projectile_settings.el ends here
