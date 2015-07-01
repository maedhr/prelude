(require 'jsx-mode)
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . jsx-mode))

(require 'flycheck)
(flycheck-define-checker jsxhint-checker
  "A JSX syntax and style checker based on JSXHint."

  :command ("jsxhint" source)
  :error-patterns
  ((error line-start (1+ nonl) ": line " line ", col " column ", " (message) line-end))
  :modes (jsx-mode))
(add-hook 'jsx-mode-hook (lambda ()
                           (flycheck-select-checker 'jsxhint-checker)
                           (flycheck-mode)))

(add-hook 'jsx-mode-hook
                    (lambda () (auto-complete-mode 1)))
