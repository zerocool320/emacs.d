;;; startup_options.el ---
;;
;; Filename: startup_options.el
;; Description:
;; Author: Barath Ramesh
;; Maintainer:
;; Created: Sat Jun 11 08:45:33 2016 (-0400)
;; Version:
;; Last-Updated: Sat Oct 17 17:35:25 2020 (-0500)
;;           By: Barath Ramesh
;;     Update #: 2
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

;;Start-up options
;;Splash Screens
(setq inhibit-splash-screen t
      initial-scratch-message nil
      initial-major-mode 'org-mode)

;;Scroll bar, Tool bar, Menu bar, Blinking cursor, display time,..
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(blink-cursor-mode -1)
(display-time)
;;(toggle-frame-fullscreen)

;;Marking text
(delete-selection-mode t)
(transient-mark-mode t)
(setq x-select-enable-clipboard t)

(provide 'startup_options)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; startup_options.el ends here
