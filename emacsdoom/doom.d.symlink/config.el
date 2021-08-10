;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
(setq doom-font (font-spec :family "Fira Code" :size 16))

(evil-add-command-properties 'evil-yank-line :motion 'evil-line)

(add-hook 'go-mode-hook #'lsp!)
(add-hook 'ruby-mode-hook #'lsp!)
(setq-default evil-escape-key-sequence "fd")

(defun er-switch-to-previous-buffer ()
  "Switch to previously open buffer.
Repeated invocations toggle between the two most recently open buffers."
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(map! :leader
      :desc "Search projetct"       "/"    #'+default/search-project
      :desc "Switch to previous buffer"       "`"    #'er-switch-to-previous-buffer
      (:prefix-map ("p" . "project")
                   :desc "Find file in project"  "f"  #'projectile-find-file)
                   
      (:prefix-map ("b" . "buffer")
                   :desc "Kill buffer"                 "d"   #'kill-this-buffer)
                   
      (:prefix-map ("f" . "file")
                   (:when (featurep! :ui neotree)
                     :desc "Find file in project sidebar" "T" #'+neotree/find-this-file)
                   (:when (featurep! :ui treemacs)
                     :desc "Find file in project sidebar" "T" #'+treemacs/find-file)))
                   
      

(add-to-list 'company-backends #'company-tabnine)

(setq org-journal-time-prefix "* "
      org-journal-date-format "%a, %Y-%m-%d"
      org-journal-file-type 'weekly
      org-journal-file-format "%Y-%V.org")


(setq mac-command-key-is-meta nil)
(setq mac-command-modifier 'super)
(setq mac-option-key-is-meta t)
(setq mac-option-modifier t)
