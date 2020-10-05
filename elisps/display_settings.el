;;; display_settings.el ---
;;
;; Filename: display_settings.el
;; Description:
;; Author: Barath Ramesh
;; Maintainer:
;; Created: Sat Jun 11 18:52:50 2016 (-0400)
;; Version:
;; Last-Updated: Fri Sep 11 13:28:40 2020 (-0500)
;;           By: Barath Ramesh
;;     Update #: 56
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

;;Column number mode, column rule
(setq column-number-mode t)
(setq column-enforce-mode t)
(setq column-enforce-column 90)
(add-hook 'prog-mode-hook 'column-enforce-mode)

;; line number mode
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))

;; (set-face-foreground 'linum "ivory")


;;Themes
;; (load-theme 'tangotango t)
;; (set-foreground-color "#dcdccc")
;; (set-background-color "#2e3436")

;; (add-hook 'after-init-hook
;;	  (lambda () (load-theme 'cyberpunk t)))


;; (load-theme 'organic-green t)
;; (load-theme 'zenburn t)
;; (load-theme 'doom-sourcerer t)
;; (load-theme 'spacemacs-dark t)
;; (load-theme 'afternoon t)
;; (load-theme 'alect-dark t)
;; (load-theme 'planet t)
;; (load-theme 'solarized-dark t)
;; (load-theme 'zen-and-art t)
;; (load-theme 'sanityinc-tomorrow-night t)
;; (load-theme 'doom-one)
;; (load-theme 'doom-spacegrey)
;; (load-theme 'doom-moonlight)
;; (load-theme 'doom-vibrant)
(load-theme 'doom-zenburn t)
;; (load-theme 'doom-monokai-pro t)

;; Add proper word wrapping
(global-visual-line-mode t)

;; (set-cursor-color "#eeeee0")

(setq-default indicate-empty-lines t)
(when (not indicate-empty-lines)
  (toggle-indicate-empty-lines))

;; Paranthesis matching
(require 'paren)
(show-paren-mode t)
(defun lispy-parens ()
  "Setup parens display for lisp modes"
  (setq show-paren-delay 0)
  (setq show-paren-style 'parenthesis)
  (make-variable-buffer-local 'show-paren-mode)
  (show-paren-mode 1)
  (set-face-background 'show-paren-match-face (face-background 'default))
  (if (boundp 'font-lock-comment-face)
      (set-face-foreground 'show-paren-match-face
			   (face-foreground 'font-lock-comment-face))
    (set-face-foreground 'show-paren-match-face
			 (face-foreground 'default)))
  (set-face-attribute 'show-paren-match-face nil :weight 'extra-bold))
(set-face-background 'show-paren-match (face-background 'default))
(set-face-foreground 'show-paren-match "#def")
(set-face-attribute 'show-paren-match nil :weight 'extra-bold)

(defadvice show-paren-function
    (after show-matching-paren-offscreen activate)
  "If the matching paren is offscreen, show the matching line in the
	echo area. Has no effect if the character before point is not of
	the syntax class ')'."
  (interactive)
  (let* ((cb (char-before (point)))
	 (matching-text (and cb
			     (char-equal (char-syntax cb) ?\) )
			     (blink-matching-open))))
    (when matching-text (message matching-text))))


;; text wrap
(add-hook 'text-mode-hook 'auto-fill-mode)
(setq-default fill-column 64)

;; (set-face-foreground 'linum "gray70")

;; (custom-set-faces
;;  '(default ((t (:foreground "gray85" :slant italic)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; display_settings.el ends here
