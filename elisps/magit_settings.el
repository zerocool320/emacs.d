;;; magit_settings.el ---
;;
;; Filename: magit_settings.el
;; Description:
;; Author: Barath Ramesh
;; Maintainer:
;; Created: Mon May 18 11:29:52 2020 (-0500)
;; Version:
;; Last-Updated: Sat Oct 17 17:45:18 2020 (-0500)
;;           By: Barath Ramesh
;;     Update #: 8
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

;; From https://github.com/howardabrams/dot-files/blob/master/emacs.org

(use-package magit
  :ensure t
  :commands magit-status magit-blame
  :init
  (defadvice magit-status (around magit-fullscreen activate)
    (window-configuration-to-register :magit-fullscreen)
    ad-do-it
    (delete-other-windows))
  :config
  (setq magit-branch-arguments nil
        ;; use ido to look for branches
        ;; magit-completing-read-function 'magit-ido-completing-read
        ;; don't put "origin-" in front of new branch names by default
        magit-default-tracking-name-function 'magit-default-tracking-name-branch-only
        magit-push-always-verify nil
        ;; Get rid of the previous advice to go into fullscreen
        magit-restore-window-configuration t)
  ;; From Kyle Meyer https://emacs.stackexchange.com/users/2114/kyle-meyer
  (defun magit-display-buffer-pop-up-frame (buffer)
    (if (with-current-buffer buffer (eq major-mode 'magit-status-mode))
        (display-buffer buffer
                        '((display-buffer-reuse-window
                           display-buffer-pop-up-frame)
                          (reusable-frames . t)))
      (magit-display-buffer-traditional buffer)))

  (setq magit-display-buffer-function #'magit-display-buffer-pop-up-frame)

  :bind ("C-x g" . magit-status))

(use-package git-timemachine
  :ensure t
  :bind (("s-g" . git-timemachine)))

(provide 'magit_settings)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; magit_settings.el ends here
