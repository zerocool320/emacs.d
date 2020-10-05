;; fix make header and make header

(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")

;; (global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)

(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)

(setq ivy-wrap t)
(setq ivy-mode t)


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

;; (defface ivy-current-match
;;   '((((class color) (background light))
;;      :background "red" :foreground "white")
;;     (((class color) (background dark))
;;      :background "green" :foreground "black"))
;;   "Face used by Ivy for highlighting first match.")

(setq ivy-format-function 'ivy-format-function-line)

(custom-set-faces
 '(ivy-highlight-face ((t (:background "red")))))


(use-package ivy

  :ensure nil

  :defines
  (zenburn/bg-0
   zenburn/blue)

  :config
  ;; (setq-default
  ;;  ivy-count-format ""
  ;;  ivy-format-function 'ivy-format-function-line
  ;;  ivy-height 16
  ;;  ivy-use-virtual-buffers)
  ;; (set-face-attribute 'ivy-current-match nil :background)
  ;; (set-face-attribute 'ivy-subdir :foreground zenburn)
  (ivy-mode 1))

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
   ((((class color) (background light))
     :background nil :foreground nil)
    (((class color) (background dark))
     :background "DimGrey" :foreground nil))))
