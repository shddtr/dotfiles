;;; プリプロセッサを隠す
;; C-c @ C-d カーソル位置のブロックを隠す
;; C-c @ C-s カーソル位置のブロックを展開
(require 'hideif)
(add-hook 'c-mode-common-hook 'hide-ifdef-mode)

;;;; プログラミングの設定
;;; gtags-mode
(setq load-path (cons "/usr/share/emacs/site-lisp/global" load-path))
(autoload 'gtags-mode "gtags" "" t)
;; (require 'gtags)
(add-hook 'c-mode-common-hook 'gtags-mode)
(add-hook 'c++-mode-hook 'gtags-mode)
;; (setq gtags-pop-delete t)
(setq gtags-mode-hook
      '(lambda ()
         (local-set-key "\M-t" 'gtags-find-tag)
         (local-set-key "\M-r" 'gtags-find-rtag)
         (local-set-key "\M-s" 'gtags-find-symbol)
         (local-set-key "\C-t" 'gtags-pop-stack)
         ))
;;; indentの設定
(add-hook 'c-mode-common-hook
          (lambda ()
            (c-set-style "bsd")
            (setq indent-tabs-mode nil)
            (setq c-basic-offset 4)
            ))

