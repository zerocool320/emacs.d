(defun efs/lsp-mode-setup ()
  (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
  (lsp-headerline-breadcrumb-mode))

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook
  (lsp-mode . efs/lsp-mode-setup)
  (prog-mode . lspe)
  :init
  (setq lsp-keymap-prefix "C-c l")  ;; Or 'C-l', 's-l'
  :config
  (lsp-enable-which-key-integration t)
  (add-hook 'prog-mode-hook 'lsp-deferred)
  ;; Less chatty for unsupported modes
  (setq lsp-warn-no-matched-clients nil)
  (custom-set-faces
   ;; If there is more than one, they won't work right.
 '(lsp-face-highlight-read ((t (:weight thin :background nil :foreground "PaleGreen3"))))
 ;; '(lsp-face-highlight-textual ((t (:foreground "sky blue" :weight semi-light :background nil))))
 '(lsp-face-highlight-textual ((t (:weight thin :background nil :foreground "CadetBlue"))))
 '(lsp-face-highlight-write ((t (:weight thin :background nil :foreground "LightSalmon2"))))
 '(lsp-ui-doc-background ((t (:background "black"))))))


(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-position 'bottom))

(use-package lsp-treemacs
  :after lsp)

(use-package lsp-ivy
  :after lsp)

(provide 'lsp_settings)
