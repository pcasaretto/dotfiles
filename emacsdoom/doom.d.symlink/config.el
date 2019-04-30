;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(defadvice evil-inner-word (around underscore-as-word activate)
  (let ((table (copy-syntax-table (syntax-table))))
    (modify-syntax-entry ?_ "w" table)
    (with-syntax-table table
      ad-do-it)))

(setq evil-want-Y-yank-to-eol nil)

(setq doom-font (font-spec :family "Fira Code" :size 16))

(def-package! lsp-mode
  :commands (lsp-mode lsp-define-stdio-client)
  :config
  (setq lsp-enable-eldoc t
        lsp-eldoc-render-all nil
        lsp-highlight-symbol-at-point nil
        lsp-enable-completion-at-point t))

(def-package! lsp-ui
  :hook
  (lsp-mode . lsp-ui-mode)
  :config
  (with-eval-after-load "lsp-mode"
    (setq lsp-ui-flycheck-enable t))
  (setq lsp-ui-sideline-enable t)
  (setq lsp-ui-sideline-show-symbol t)
  (setq lsp-ui-sideline-show-hover t)
  (setq lsp-ui-sideline-show-code-actions t)
  (setq lsp-ui-sideline-update-mode 'point)
  (set-lookup-handlers! 'lsp-ui-mode
    :definition #'lsp-ui-peek-find-definitions
    :references #'lsp-ui-peek-find-references))

(def-package! company-lsp
  :after lsp-mode
  :config
  (set-company-backend! 'lsp-mode 'company-lsp)
  (setq company-transformers nil)
  (setq company-lsp-async t
        company-lsp-enable-recompletion t
        company-lsp-enable-snippet t
        ;; the below and company-transformers when
        ;; enabled can slow things down
        company-lsp-cache-candidates nil))

(def-package! lsp-solargraph
  :when (featurep! :lang ruby)
  :after-call (ruby-mode)
  :hook (ruby-mode . lsp-solargraph-enable)
  :config
  ;; Again, if you're wanting to use inf-ruby and company-inf-ruby
  (set-company-backend! 'ruby-mode '(company-inf-ruby company-lsp)))
