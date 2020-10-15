(use-package emojify
  :hook (after-init . global-emojify-mode))

(use-package company-emoji
  :init
  (add-to-list 'company-backends 'company-emoji))
