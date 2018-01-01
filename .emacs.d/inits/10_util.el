;;; 同じ名前のファイルを開いているときにバッファ名にディレクトリ名を含める
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffres-re "*[^*]+*")

;;; wdired
;; diredバッファで r
;; C-x C-sで保存, C-c C-kで取り消し
;; string-rectangleと一緒に使うと便利
(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

;;; bookmark
;; C-x r m で設定
;; C-x r l で一覧表示
;; 一覧で d で削除マーク, xで実行
(setq bookmark-save-flag 1)
(progn
  (setq bookmark-sort-flag nil)
  (defun bookmark-arrange-latest-top ()
    (let ((latest (bookmark-get-bookmark bookmark)))
      (setq bookmark-alist (cons latest (delq latest bookmark-alist))))
    (bookmark-save))
  (add-hook 'bookmark-after-jump-hook 'bookmark-arrange-latest-top))

;;; migemo
(require 'migemo)
(if (eq system-type 'gnu/linux)
    (progn
      (setq migemo-command "/usr/bin/cmigemo")
      (setq migemo-dictionary "/usr/share/cmigemo/euc-jp/migemo-dict")))
(if (eq system-type 'darwin)
    (progn
      (setq migemo-command "/usr/local/bin/cmigemo")
      (setq migemo-dictionary "/usr/local/share/migemo/euc-jp/migemo-dict")))
(setq migemo-options '("-q" "--emacs"))

;; (require 'ido-migemo)
;; (ido-mode 1)
;; (ido-migemo-mode 1)
;; ;;; 無効にするコマンド
;; (setq ido-migemo-exclude-command '(smex ido-switch-buffer))
;; ;;; Migemoが効いていることを示すプロンプト
;; (setq ido-migemo-prompt-string "Migemo|")

;; ;;; grep
;; (require 'color-moccur)
;; (load "moccur-edit")
;; helm-ag + ripgrepに移行
;;; ripgrep (helm-agから使うときにはいらないみたい)
;;; rgバイナリの位置
(setq ripgrep-executable "~/bin/rg")
;;; rgに渡すオプション
(setq ripgrep-arguments '("-S"))

;; ;;; helm-ag
;; (require 'helm)
;; ;;; ag以外の検索コマンドも使える
;; ;; (setq helm-ag-base-command "grep -rin")
;; ;; (setq helm-ag-base-command "csearch -n")
;; ;; (setq helm-ag-base-command "pt --nocolor --nogroup")
;; (setq helm-ag-base-command "rg --vimgrep --no-heading")
;; ;;; 現在のシンボルをデフォルトのクエリにする
;; (setq helm-ag-insert-at-point 'symbol)

;;; C-M-gはちょうどあいてる

;; (defun helm-ag-dot-emacs ()
;;   ".emacs.d以下を検索"
;;   (interactive)
;;   (helm-ag "~/.emacs.d/"))
(require 'projectile nil t)
;; (defun helm-projectile-ag ()
;;   "Projectileと連携"
;;   (interactive)
;;   (helm-ag (projectile-project-root)))
;; (helm-ag "~/.emacs.d/")

(setq make-backup-files nil)
;; (setq backup-inhibited t)

;;; outline-mode
(add-to-list 'auto-mode-alist '("\\.ol$" . outline-mode))

;;; ignore case
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

;;; テンプレートの挿入
;; (auto-insert-mode)
;; (setq auto-insert-directory "~/.emacs.d/insert/")
;; (define-auto-insert "\\.rb" "ruby-template.rb")

;;;; バッファの操作
(ido-mode 1)
(require 'ido)
(ido-everywhere t)
;;; あいまいマッチ
(setq ido-enable-flex-matching t)
;;; M-xをido化
(when (fboundp 'smex)
  (global-set-key (kbd "M-x") 'smex))
(defun smex-prepare-ido-bindings ()
  (define-key ido-completion-map (kbd "C-h") #'delete-backward-char))
;;; 縦に並べる
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

;;; completing-readをido化
;; 'Variable binding depth exceeds max-specpdl-size'のエラーとなるため
;; 使うのをやめておく
;; (ido-ubiquitous-mode 1)

;;;; 補完のための機能
;;; M-/ バッファから補完する(目的のものでないときは再度 M-/)

;;; M-x hippie-expand で補完するときに使う方法
(setq hippie-expand-try-functions-list
      '(try-complete-file-name-partially
        try-complete-file-name
        try-expand-all-abbrevs
        try-expand-dabbrev               
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol
        ))

;;; sort
;; M-x sort-lines
;; C-u fieldnum M-x sort-fields
;; C-u fieldnum M-x sort-numeric-fields

;;; 行揃え
;; C-u M-x align <-region指定後
;; C-u M-x align-current <-空行まで
;; M-x align-regexp <-自動でやってくれないとき
;; int a   = 3;                // hoge
;; int abc = 4;                // fuga


;;; scroll行数
;; (setq-default scroll-step 1)
;; (setq-default scroll-conservatively 10000)

;;; EditorConfig
(editorconfig-mode 1)

;;; Plant UML
(add-to-list 'auto-mode-alist '("\\.puml$" . plantuml-mode))
