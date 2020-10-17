;;; org_settings.el ---
;;
;; Filename: org_settings.el
;; Description:
;; Author: Barath Ramesh
;; Maintainer:
;; Created: Sat Jun 11 18:49:25 2016 (-0400)
;; Version:
;; Last-Updated: Sat Oct 17 17:37:50 2020 (-0500)
;;           By: Barath Ramesh
;;     Update #: 5
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

(setq org-log-done t
      org-todo-keywords '((sequence "TODO" "INPROGRESS" "DONE"))
      org-todo-keyword-faces '(("INPROGRESS" . (:foreground "blue" :weight bold))))
(add-hook 'org-mode-hook
          (lambda ()
            (flyspell-mode)))
(add-hook 'org-mode-hook
          (lambda ()
            (writegood-mode)))

;;org-agenda
(global-set-key (kbd "C-c a") 'org-agenda)
(setq org-agenda-show-log t
      org-agenda-todo-ignore-scheduled t
      org-agenda-todo-ignore-deadlines t)
(setq org-agenda-files (list "~/Dropbox/org/personal.org"
                             "~/Dropbox/org/groupon.org"))

;;org-habit
(require 'org)
(require 'org-install)
(require 'org-habit)
(add-to-list 'org-modules "org-habit")
(setq org-habit-preceding-days 7
      org-habit-following-days 1
      org-habit-graph-column 80
      org-habit-show-habits-only-for-today t
      org-habit-show-all-today t)


;; active Babel languages

(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)
   (org . t)
   (ditaa . t)
   (latex . t)
   (dot . t)
   (emacs-lisp . t)
   (gnuplot . t)
   (screen . nil)
   (sql . nil)
   (sqlite . t)))


(setq org-confirm-babel-evaluate nil)
(add-hook 'org-babel-after-execute-hook 'org-display-inline-images)
(add-hook 'org-mode-hook 'org-display-inline-images)


;; set key for agenda
(global-set-key (kbd "C-c a") 'org-agenda)

(define-key global-map "\C-cl" 'org-store-link)
(setq org-log-done t)
(setq rainbow-mode t)

;;file to save todo items
;; (setq org-agenda-files (quote ("/Users/bjm/todo.org")))

;;set priority range from A to C with default A
(setq org-highest-priority ?A)
(setq org-lowest-priority ?C)
(setq org-default-priority ?A)

;;set colours for priorities
(setq org-priority-faces '((?A . (:foreground "DarkOrange4" :weight bold))
                           (?B . (:foreground "turquoise4"))
                           (?C . (:foreground "OliveDrab4"))))


;;open agenda in current window
(setq org-agenda-window-setup (quote current-window))

;;capture todo items using C-c c t
(defun capture-report-data-file (path)
  (let ((name (read-string "Name: ")))
    (expand-file-name (format "%s-%s.txt"
                              (format-time-string "%Y-%m-%d")
                              name) path)))

(define-key global-map (kbd "C-c c") 'org-capture)
(setq org-capture-templates
      '(("t" "todo" entry    (file (capture-report-date-file  "~/path/path/name"))
         "* TODO [#A] %?")))

(setq org-agenda-files (list "~/org/mmalib.org"
                             "~/org/sys_admin.org"
                             "~/org/misc.org"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org-mode agenda options                                                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;open agenda in current window
(setq org-agenda-window-setup (quote current-window))
;;warn me of any deadlines in next 7 days
(setq org-deadline-warning-days 7)
;;show me tasks scheduled or due in next fortnight
(setq org-agenda-span (quote fortnight))
;;don't show tasks as scheduled if they are already shown as a deadline
(setq org-agenda-skip-scheduled-if-deadline-is-shown t)
;;don't give awarning colour to tasks with impending deadlines
;;if they are scheduled to be done
(setq org-agenda-skip-deadline-prewarning-if-scheduled (quote pre-scheduled))
;;don't show tasks that are scheduled or have deadlines in the
;;normal todo list
(setq org-agenda-todo-ignore-deadlines (quote all))
(setq org-agenda-todo-ignore-scheduled (quote all))
;;sort tasks in order of when they are due and then by priority
(setq org-agenda-sorting-strategy
      (quote
       ((agenda deadline-up priority-down)
        (todo priority-down category-keep)
        (tags priority-down category-keep)
        (search category-keep))))


;; add additional languages with '((language . t)))

(provide 'org_settings)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; org_settings.el ends here
