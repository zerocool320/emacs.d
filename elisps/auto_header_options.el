;;; auto_header_options.el ---
;;
;; Filename: auto_header_options.el
;; Description:
;; Author: Barath Ramesh
;; Maintainer:
;; Created: Sat Jun 11 19:07:33 2016 (-0400)
;; Version:
;; Last-Updated: Sat Oct 17 17:42:38 2020 (-0500)
;;           By: Barath Ramesh
;;     Update #: 9
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

(load "~/.emacs.d/elisps/header2.el")
(add-hook 'write-file-hooks 'auto-update-file-header)

;; (add-hook 'emacs-lisp-mode-hook 'auto-make-header)
;; (add-hook 'c-mode-common-hook   'auto-make-header)

(setq make-header-hook '(
                         header-title
                         header-blank
                         header-file-name
                         header-description
                         ;;header-status
                         header-author
                         header-maintainer
                         ;;header-copyright
                         header-creation-date
                         ;;header-rcs-id
                         header-version
                         ;;header-pkg-requires
                         ;;header-sccs
                         header-modification-date
                         header-modification-author
                         header-update-count
                         ;;header-url
                         ;;header-doc-url
                         ;;header-keywords
                         ;;header-compatibility
                         header-blank
                         ;;header-lib-requires
                         header-end-line
                         ;;header-commentary
                         ;;header-blank
                         ;;header-blank
                         ;;header-blank
                         ;;header-end-line
                         ;;header-history
                         ;;header-blank
                         ;;header-blank
                         ;; header-rcs-log
                         ;;header-end-line
                         ;;header-free-software
                         header-code
                         header-eof
                         ))

(provide 'auto_header_options)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; auto_header_options.el ends here
