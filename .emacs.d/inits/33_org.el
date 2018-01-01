;;; org-mode
;; org-modeの初期化
(require 'org-install)
;; 行の折り返しをしない
(setq org-startup-truncated t)
(setq org-return-follows-link t)
;; org-default-notes-fileのディレクトリ
(setq org-directory "~/Dropbox/org/")
(setq org-default-notes-file (concat org-directory "memo.org"))
;; TODO状態
(setq org-todo-keywords
      '((sequenece "TODO(t)" "NEXT(n)" "WAIT(w)" "|" "DONE(d)" "SOMEDAY(s)")))
(setq org-capture-templates
      '(("t" "Todo" entry
         (file+headline nil "Inbox")
         "** TODO %?\n   %i\n   %a\n   %t")
        ("b" "Bug" entry
         (file+headline nil "Inbox")
         "** TODO %?   :bug:\n   %i\n   %a\n   %t")
        ("n" "Note" entry
         (file+headline nil "New Notes")
         "** %?\n   %i\n   %a\n   %t")))
;; キーバインドの設定
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cc" 'org-capture)

;; 拡張子がorgのファイルを開いた時、自動的にorg-modeにする
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; 拡張子がtxtのファイルを開いた時、自動的にorg-modeにする
(add-to-list 'auto-mode-alist '("\\.txt$" . org-mode))
;; org-modeでの強調表示を可能にする
(add-hook 'org-mode-hook 'turn-on-font-lock)
;; 見出しの余分な*を消す
(setq org-hide-leading-starts t)
;; DONEの時刻を記録
(setq org-log-done 'time)

;; アジェンダ表示の対象ファイル
(setq org-agenda-files (list org-directory))
;; アジェンダ表示で下線を用いる
(add-hook 'org-agenda-mode-hook '(lambda () (hl-line-mode 1)))
(setq hl-line-face 'underline)
;; 標準の祝日を利用しない
(setq calendar-holidays nil)
;; アジェンダ表示の表示順
(setq org-agenda-sorting-strategy
      '((agenda habit-down time-up priority-down category-keep)
        (todo priority-down todo-state-up category-keep)
        (tags priority-down category-keep)
        (search category-keep)))
;; マウスカーソルでハイライトしない
(add-hook 'org-finalize-agenda-hook
          (lambda () (remove-text-properties
                      (point-min) (point-max) '(mouse-face t))))
;; 見出し入力
(defun org-insert-upheading (arg)
  "1レベル上の見出しを入力する"
  (interactive "P")
  (org-insert-heading arg)
  (cond ((org-on-heading-p) (org-do-promote))
        ((org-at-item-p) (org-indent-item -1))))
(defun org-insert-heading-dwim (arg)
  ""
  (interactive "p")
  (case arg
    (4 (org-insert-subheading nil))
    (16 (org-insert-upheading nil))
    (t (org-insert-heading nil))))
(eval-after-load "org"
  '(progn
     (define-key org-mode-map (kbd "<C-return>") 'org-insert-heading-dwim)
     ))
