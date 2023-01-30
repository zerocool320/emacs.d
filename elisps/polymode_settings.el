;;; polymode_settings.el ---
;;
;; Filename: polymode_settings.el
;; Description:
;; Author: Barath Ramesh
;; Maintainer:
;; Created: Mon Feb  6 20:09:12 2017 (-0500)
;; Version:
;; Last-Updated:
;;           By:
;;     Update #: 16
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

(use-package ess
  :ensure t
  :init (require 'ess-site))

(use-package poly-R
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.Snw" . poly-noweb+r-mode))
  (add-to-list 'auto-mode-alist '("\\.Rnw" . poly-noweb+r-mode))
  (add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode))
  (add-to-list 'auto-mode-alist '("\\.Rhtml" . poly-html+r-mode))
  (add-to-list 'auto-mode-alist '("\\.Rbrew" . poly-brew+r-mode))
  (add-to-list 'auto-mode-alist '("\\.Rcpp" . poly-r+c++-mode))
  (add-to-list 'auto-mode-alist '("\\.cppR" . poly-c++r-mode)))

(use-package poly-markdown
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.md" . poly-markdown-mode)))

(provide 'polymode_settings)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; polymode_settings.el ends here
