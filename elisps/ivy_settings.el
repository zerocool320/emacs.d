(use-package hydra
  :ensure t
  :load-path "site-lisp/hydra")

(use-package popup
  :ensure t
  :load-path "site-lisp/popup")

(use-package historian
  :ensure t)
(use-package ivy-historian
  :ensure t)


;; (use-package ivy-prescient
;;   :ensure t
;;   :config
;;   (ivy-prescient-mode t))

(use-package ivy
  :ensure t
  ;; :defines
  ;; (zenburn/bg-0
  ;;  ;; zenburn/blue
  ;;  )
  :init
  (historian-mode +1)
  :config
  (ivy-historian-mode +1)
  (setq ivy-mode 1)
  (setq ivy-wrap t)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  ;; (setq enable-recursive-minibuffers t)
  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  (global-set-key (kbd "<f6>") 'ivy-resume)

  ;; (global-set-key (kbd "C-s") 'swiper)
  (require 'lv)
  (defun ivy-display-function-lv (text)
    (let ((lv-force-update t))
      (lv-message
       (if (string-match "\\`\n" text)
           (substring text 1)
         text))))

  (require 'popup)

  (defun ivy-display-function-popup (text)
    (with-ivy-window
      (popup-tip
       (setq ivy-insert-debug
             (substring text 1))
       :nostrip t)))


  (setq ivy-re-builders-alist '((t . ivy--regex-fuzzy)))

  (setq ivy-re-builders-alist
        '((swiper . ivy--regex-plus)
          (t      . ivy--regex-fuzzy)))

  (with-eval-after-load 'ivy
    (push (cons #'swiper (cdr (assq t ivy-re-builders-alist)))
          ivy-re-builders-alist)
    (push (cons t #'ivy--regex-fuzzy) ivy-re-builders-alist))

  ;; (setq ivy-prescient-mode t)
  (setq ivy-format-function 'ivy-format-function-line)

  ;; (custom-set-faces
  ;;  '(ivy-highlight-face ((t (:background "red")))))

  (provide 'ivy-init)

  (setq ivy-display-style 'fancy)
  (setq ivy-display-function 'ivy-display-function-lv)

  ;; (setq ivy-display-functions-alist
  ;;       '((counsel-M-x . ivy-display-function-lv)
  ;;         (ivy-completion-in-region . ivy-display-function-overlay)))

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
  )


;; '(ivy-current-match ((t (:background "#00AF00"))))
;; '(ivy-highlight-face ((t (:background "#AF0000"))))


(use-package counsel
  :ensure t
  :config
  (counsel-mode 1)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "<f1> f") 'counsel-describe-function)
  (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
  (global-set-key (kbd "<f1> l") 'counsel-find-library)
  (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
  (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
  (global-set-key (kbd "C-c g") 'counsel-git)
  (global-set-key (kbd "C-c j") 'counsel-git-grep)
  (global-set-key (kbd "C-c a") 'counsel-ag)
  (global-set-key (kbd "C-x l") 'counsel-locate)
  (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
  (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history))

(use-package ivy-hydra
  :ensure t
  :after (ivy hydra))


(use-package ivy-rich
  :after ivy
  :init
  (ivy-rich-mode 1))

(provide 'ivy_settings)
