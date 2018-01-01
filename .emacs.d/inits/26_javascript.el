(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(add-hook 'js2-mode-hook
    (lambda ()
        (tern-mode t)))

(eval-after-load 'tern
    '(progn
        (require 'tern-auto-complete)
        (tern-ac-setup)))
(eval-after-load 'flycheck
  '(custom-set-variables
    '(flycheck-disabled-checkers '(javascript-jshint javascript-jscs))
    ))
