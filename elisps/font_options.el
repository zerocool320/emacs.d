;;; font_options.el ---
;;
;; Filename: font_options.el
;; Description:
;; Author: Barath Ramesh
;; Maintainer:
;; Created: Sat Jun 11 18:45:11 2016 (-0400)
;; Version:
;; Last-Updated:
;;           By:
;;     Update #: 65
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

;;Display Settings
;; (when window-system
;;   (setq frame-title-format '(buffer-file-name "%f" ("%b")))
;;   (set-face-attribute 'default nil
;;        :family "DejaVu Sans Mono"
;;        :height 124
;;        :weight 'normal
;;        :width 'normal)

;;   (when (functionp 'set-fontset-font)
;;     (set-fontset-font "fontset-default"
;;        'unicode
;;        (font-spec :family "DejaVu Sans Mono"
;;       :width 'normal
;;       :size 12.4
;;       :weight 'normal))))

;; (set-frame-font "DejaVu Sans Mono" nil t)
;; (set-face-attribute 'default nil :height 160)

(if (equal system-type 'darwin)
    (progn
      (set-frame-font "Monaco" nil t)
           ;; (set-frame-font "MesloLGS Nerd Font Mono" nil t)
           ;; (set-frame-font "Hack Nerd Font Mono" nil t)
      (set-face-attribute 'default nil :height 180))
  (progn
    (set-frame-font "Ubuntu Mono" nil t)
       ;; (set-frame-font "MesloLGS Nerd Font Mono" nil t)
    ;; (set-frame-font "Hack Nerd Font Mono" nil t)
    (set-face-attribute 'default nil :height 160)))




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; font_options.el ends here
