;; grph-mode.el    -*- lexical-binding: t; -*-

(require 'lsp)

(defcustom lsp-grph-executable "grph-lsp"
  "Path of the GRPH LSP executable"
  :type 'file)

(defconst grph-keywords
  (list
   '("#[A-Za-z]+" . font-lock-preprocessor-face))
  "Highlight commands")

(define-derived-mode grph-mode nil "GRPH"
  (setq-local comment-start "//")
  (setq-local indent-tabs-mode t)
  (set (make-local-variable 'font-lock-defaults) '(grph-keywords)))

(add-to-list 'auto-mode-alist (cons "\\.grph\\'" 'grph-mode))

(with-eval-after-load 'lsp-mode
  (add-to-list 'lsp-language-id-configuration '(grph-mode . "grph"))
  (lsp-register-client
   (make-lsp-client
    :new-connection (lsp-stdio-connection (lambda () lsp-grph-executable))
    :activation-fn (lsp-activate-on "grph")
    :server-id 'grphlsp)))

(provide 'grph-mode)
