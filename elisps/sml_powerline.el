;;; sml_powerline.el ---
;;
;; Filename: sml_powerline.el
;; Description:
;; Author: Barath Ramesh
;; Maintainer:
;; Created: Sun Jun 12 01:30:50 2016 (-0400)
;; Version:
;; Last-Updated:
;;           By:
;;     Update #: 2
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

;; Powerline theme
;; These two lines are just examples
(setq powerline-arrow-shape 'curve)
(setq powerline-default-separator-dir '(right . left))
;; (setq respectful-arrow-shape 'curve)
;; (setq respectful-default-separator-dir '(right . left))
;; These two lines you really need.
(setq sml/theme 'powerline)
;; (setq sml/theme 'respectful)
(sml/setup)
;; (custom-set-faces
;;  '(sml/prefix ((t (:inherit sml/global :background "OliveDrab" :foreground "white"))))
;;  '(sml/process ((t (:inherit sml/prefix :background "orange4")))))
(setq sml/no-confirm-load-theme t)

(require 'smart-mode-line)
;; (setq powerline-arrow-shape 'curve)
;; (setq powerline-default-separator-dir '(right . left))
;; (setq sml/theme 'powerline)
;; (setq sml/mode-width 20)
;; (setq sml/name-width 50)
;; (rich-minority-mode 1)
;; (setf rm-blacklist "")
;; (sml/setup)

;; emacs-powerline
;; (load "~/.emacs.d/elisps/emacs_powerline")

;; telephone line
;; (require 'telephone-line)
;; (telephone-line-mode 1)

;; (require 'powerline)
;; (powerline-center-theme)
;; (sml/setup)
;; (custom-set-faces
;;  '(sml/prefix ((t (:inherit sml/global :background "OliveDrab" :foreground "white"))))
;;  '(sml/process ((t (:inherit sml/prefix :background "orange4")))))
;; (setq sml/no-confirm-load-theme t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; sml_powerline.el ends here
