;;; display_settings.el ---
;;
;; Filename: display_settings.el
;; Description:
;; Author: Barath Ramesh
;; Maintainer:
;; Created: Sat Jun 11 18:52:50 2016 (-0400)
;; Version:
;; Last-Updated: Fri Oct  9 16:21:04 2020 (-0500)
;;           By: Barath Ramesh
;;     Update #: 64
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

;;Column number mode, column rule
;; Highlight lines with 80+ characters
(use-package column-enforce-mode
  :ensure t
  :config
  (set-face-attribute 'column-enforce-face nil :foreground "#ff0000")
  (setq column-enforce-column 90)
  (add-hook 'prog-mode-hook 'column-enforce-mode))

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
;; (load-theme 'doom-zenburn t)
;; (load-theme 'doom-monokai-pro t)
(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  ;; (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
  ;;       doom-themes-enable-italic t) ; if nil, italics is universally disabled
  ;; (load-theme 'doom-one t)
  (load-theme 'doom-zenburn t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)

  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
  (doom-themes-treemacs-config)

  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))
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
(set-face-foreground 'show-paren-match "grey100")
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


;; more useful frame title, that show either a file or a
;; buffer name (if the buffer isn't visiting a file)
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

;; highlight the current line
;; (use-package hl-line
;;   :ensure t
;;   :config
;;   (global-hl-line-mode -1)
;;   )

(use-package anzu
  :ensure t
  :bind (("M-%" . anzu-query-replace)
         ("C-M-%" . anzu-query-replace-regexp))
  :config
  (global-anzu-mode))


(use-package hl-todo
  :ensure t
  :config
  (setq hl-todo-highlight-punctuation ":")
  (global-hl-todo-mode))

;; temporarily highlight changes from yanking, etc
(use-package volatile-highlights
  :ensure t
  :config
  (volatile-highlights-mode +1))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; display_settings.el ends here
