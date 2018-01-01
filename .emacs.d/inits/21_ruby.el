;;; inf-ruby
(require 'inf-ruby)
(setq inf-ruby-default-implementation "pry")
(setq inf-ruby-eval-binding "Pry.toplevel_binding")
;; riなどのエスケープシーケンスを処理し、色付けする
(add-hook 'inf-ruby-mode-hook 'ansi-color-for-comint-mode-on)
;;; seeing-is-believing
;; (defun seeing-is-believing ()
;;   "Replace the current region (or the whole buffer, if none) with the output
;; of seeing_is_believing."
;;   (interactive)
;;   (let ((beg (if (region-active-p) (region-beginning) (point-min)))
;;         (end (if (region-active-p) (region-end) (point-max)))
;;         (origin (point)))
;;     (shell-command-on-region beg end "seeing_is_believing" nil 'replace)
;;     (goto-char origin)))
;; (require 'seeing-is-believing)
;; (add-hook 'ruby-mode-hook 'seeing-is-believing)
