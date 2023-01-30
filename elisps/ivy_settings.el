(use-package ivy
  :diminish
  :bind (;; ("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (setq ivy-re-builders-alist '((t . ivy--regex-fuzzy)))
  (custom-set-faces
   '(swiper-minibuffer-match-face-1
     ((t :background "#dddddd")))
   '(swiper-minibuffer-match-face-2
     ((t :background "#bbbbbb" :weight bold)))
   '(swiper-minibuffer-match-face-3
     ((t :background "#bbbbff" :weight bold)))
   '(swiper-minibuffer-match-face-4
     ((t :background "#ffbbff" :weight bold))))

  (custom-set-faces
   '(ivy-current-match
     ((((class color) (background dark))
       :background "DimGrey" :foreground nil))))
  (ivy-mode 1))

(use-package ivy-rich
  :after ivy
  :init
  (ivy-rich-mode 1))


(use-package ivy-prescient
  :after counsel
  :custom
  (ivy-prescient-enable-filtering nil)
  :config
  ;; Uncomment the following line to have sorting remembered across sessions!
  ;(prescient-persist-mode 1)
  (ivy-prescient-mode 1))


(use-package all-the-icons-ivy-rich
  :ensure t
  :init (all-the-icons-ivy-rich-mode 1)
  :config
  ;; Whether display the icons
  (setq all-the-icons-ivy-rich-icon t)

  ;; Whether display the colorful icons.
  ;; It respects `all-the-icons-color-icons'.
  (setq all-the-icons-ivy-rich-color-icon t)

  ;; The icon size
  (setq all-the-icons-ivy-rich-icon-size 1.0)

  ;; Whether support project root
  (setq all-the-icons-ivy-rich-project t)

  ;; Definitions for ivy-rich transformers.
  ;; See `ivy-rich-display-transformers-list' for details."
  all-the-icons-ivy-rich-display-transformers-list

  ;; Slow Rendering
  ;; If you experience a slow down in performance when rendering multiple icons simultaneously,
  ;; you can try setting the following variable
  (setq inhibit-compacting-font-caches t))

(provide 'ivy_settings)
