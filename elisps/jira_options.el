(use-package helm-jira
  :config

  (setq
   ;; URL of your JIRA instance (should not end in a slash)
   helm-jira-url "https://jira.itg.ti.com"

   ;; The ID of the board you want to interact with
   ;; helm-jira-board-id MMALIB

   ;; The username to use to log in to JIRA
   helm-jira-username "barath.ramesh"

   ;; The JIRA-project you want to interact with
   helm-jira-project "MMALIB"


   ;; URL of the stash/bitbucket API (should not end in a slash)

   ;; helm-jira-stash-url "https://src.yourcompany.com"

   ;; The stash/bitbucket repo you want to interact with
   helm-jira-repo "MMALIB"))
