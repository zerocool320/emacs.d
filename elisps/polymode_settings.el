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
;;     Update #: 10
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

;; 20190220 version of poly-R seems to be broken
;; invoking stable poly-R version, which is 0.1.5

(use-package polymode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.Snw" . poly-noweb+r-mode))
  (add-to-list 'auto-mode-alist '("\\.Rnw" . poly-noweb+r-mode))
  (add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode))
  (add-to-list 'auto-mode-alist '("\\.rapport" . poly-rapport-mode))
  (add-to-list 'auto-mode-alist '("\\.Rhtml" . poly-html+r-mode))
  (add-to-list 'auto-mode-alist '("\\.Rbrew" . poly-brew+r-mode))
  (add-to-list 'auto-mode-alist '("\\.Rcpp" . poly-r+c++-mode))
  (add-to-list 'auto-mode-alist '("\\.cppR" . poly-c++r-mode))
  (add-to-list 'auto-mode-alist '("\\.md" . poly-markdown-mode)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; polymode_settings.el ends here
