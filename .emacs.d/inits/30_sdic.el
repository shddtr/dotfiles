;;; settings of sdic
(setq load-path (cons "/usr/share/emacs/site-lisp/sdic" load-path))
(autoload 'sdic-describe-word "sdic" "英単語の意味を調べる" t nil)
(autoload 'sdic-describe-word-at-point
  "sdic" "カーソルの位置の英単語の意味を調べる" t nil)
(setq sdic-eiwa-dictionary-list
      '((sdicf-client "/usr/share/sdic/eijirou.sdic")))
(setq sdic-waei-dictionary-list
      '((sdicf-client "/usr/share/sdic/waeijirou.sdic")))
(setq sdic-default-coding-system 'utf-8-unix)
