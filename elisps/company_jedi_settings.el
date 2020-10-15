
(defun company-jedi-setup ()
  (add-to-list 'company-backends 'company-jedi))

(use-package company-jedi
  :ensure t
  :init
  (add-hook 'python-mode-hook 'company-jedi-setup))
