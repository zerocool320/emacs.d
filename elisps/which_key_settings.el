;;; which_key_settings.el ---
;;
;; Filename: which_key_settings.el
;; Description:
;; Author: Barath Ramesh
;; Maintainer:
;; Created: Mon May 18 13:45:49 2020 (-0500)
;; Version:
;; Last-Updated: Sat Oct 17 17:50:55 2020 (-0500)
;;           By: Barath Ramesh
;;     Update #: 20
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:


;; From https://github.com/justbur/emacs-which-key

(use-package which-key
  :ensure t
  :config
  ;; (setq which-key-popup-type 'side-window)
  (setq which-key-mode t)
  (setq which-key-popup-type 'minibuffer)

  ;; Allow C-h to trigger which-key before it is done automatically
  ;; (setq which-key-show-early-on-C-h t)
  ;; make sure which-key doesn't show normally but refreshes quickly after it is
  ;; triggered.
  ;; (setq which-key-idle-delay 10000)
  ;; (setq which-key-idle-secondary-delay 0.05)
  ;; location of which-key window. valid values: top, bottom, left, right,
  ;; or a list of any of the two. If it's a list, which-key will always try
  ;; the first location first. It will go to the second location if there is
  ;; not enough room to display any keys in the first location
  ;; (setq which-key-side-window-location 'bottom)

  ;; max width of which-key window, when displayed at left or right.
  ;; valid values: number of columns (integer), or percentage out of current
  ;; frame's width (float larger than 0 and smaller than 1)
  ;; (setq which-key-side-window-max-width 0.33)
  ;; max height of which-key window, when displayed at top or bottom.
  ;; valid values: number of lines (integer), or percentage out of current
  ;; frame's height (float larger than 0 and smaller than 1)
  ;; (setq which-key-side-window-max-height 0.25)

  ;; frame
  ;; (setq which-key-popup-type 'frame)

  ;; max width of which-key frame: number of columns (an integer)
  ;; (setq which-key-frame-max-width 60)

  ;; max height of which-key frame: number of lines (an integer)
  ;; (setq which-key-frame-max-height 20)
  (setq which-key-paging-prefixes '("C-x"))
  (setq which-key-paging-key "<f5>")

  ;; (set-face-attribute 'which-key-command-description-face nil :inherit nil)
  ;; (set-face-attribute 'which-key-local-map-description-face nil :weight 'bold)

  ;; Set the time delay (in seconds) for the which-key popup to appear. A value of
  ;; zero might cause issues so a non-zero value is recommended.
  (setq which-key-idle-delay 1.0)

  ;; Set the maximum length (in characters) for key descriptions (commands or
  ;; prefixes). Descriptions that are longer are truncated and have ".." added.
  (setq which-key-max-description-length 27)

  ;; Use additional padding between columns of keys. This variable specifies the
  ;; number of spaces to add to the left of each column.
  (setq which-key-add-column-padding 0)

  ;; The maximum number of columns to display in the which-key buffer. nil means
  ;; don't impose a maximum.
  (setq which-key-max-display-columns nil)

  ;; Set the separator used between keys and descriptions. Change this setting to
  ;; an ASCII character if your font does not show the default arrow. The second
  ;; setting here allows for extra padding for Unicode characters. which-key uses
  ;; characters as a means of width measurement, so wide Unicode characters can
  ;; throw off the calculation.
  (setq which-key-separator " → " )
  (setq which-key-unicode-correction 3)

  ;; Set the prefix string that will be inserted in front of prefix commands
  ;; (i.e., commands that represent a sub-map).
  (setq which-key-prefix-prefix "+" )

  ;; Set the special keys. These are automatically truncated to one character and
  ;; have which-key-special-key-face applied. Disabled by default. An example
  ;; setting is
  ;; (setq which-key-special-keys '("SPC" "TAB" "RET" "ESC" "DEL"))
  (setq which-key-special-keys nil)

  ;; Show the key prefix on the left, top, or bottom (nil means hide the prefix).
  ;; The prefix consists of the keys you have typed so far. which-key also shows
  ;; the page information along with the prefix.
  (setq which-key-show-prefix 'left)

  ;; Set to t to show the count of keys shown vs. total keys in the mode line.
  (setq which-key-show-remaining-keys nil)

  )

(provide 'which_key_settings)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; which_key_settings.el ends here
