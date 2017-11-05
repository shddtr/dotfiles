;;;; パッケージ設定
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)
(package-refresh-contents)

(package-install 'auto-complete)
(package-install 'bison-mode)
(package-install 'elixir-mode)
(package-install 'go-mode)
(package-install 'helm-ag)
(package-install 'ido-migemo)
(package-install 'ido-ubiquitous)
(package-install 'ido-vertical-mode)
(package-install 'image+)
(package-install 'inf-ruby)
(package-install 'magit)
(package-install 'markdown-mode)
(package-install 'org)
(package-install 'org-plus-contrib)
(package-install 'paredit)
(package-install 'ripgrep)
(package-install 'seeing-is-believing)
(package-install 'smex)
(package-install 'trr)
(package-install 'wgrep)

;; (add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/elisp/")

;;;; 基本
;; locate-libraryはshellのwhich
;; ロードはrequireでよい

;; M-;は空気を読んだコメントアウト
;; C-u M-;は1行コメント削除
;; C-u 3 M-;で;;;コメント

;;; 関数宣言
(defun greeting ()
  "挨拶する関数"                        ;説明 省略可
  (print "hello"))
;; hookは特定のタイミングで実行するコードを登録する変数
;; -hook, -hooks, -functionsという接尾辞
;; (add-hook 'after-init-hook 'greeting)

;;; C-x C-e でカーソル直前のS式を評価
;; コメント内部でもどのバッファでも操作可能なので
;; Lispと関係のないテキストファイルのコメントに入れておいて
;; Emacsで開くとそのS式を評価できる(js2-modeでは動かなかった)
;; (man "ls")

;;; f1でヘルプ!

;;; redo
;; undoで戻しすぎたときは、C-fなどのバッファを変更しないコマンドを
;; はさんだ後でundoすれば逆方向に戻る

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

;;; f3, f4, f4 でキーボードマクロの定義, 終了, 実行

;;; 再帰編集
;; C-r 再帰編集開始
;; C-M-c 終了

;;; M-x re-builder
;; C-c C-i 文法切り換え
;; C-c C-r, C-c C-s マッチした部分へ移動
;; C-c C-w コピー
;; C-c C-q 終了

;;; 左右分割を上下につなげる
;; M-x follow-delete-other-windows-and-split

;; M-g M-n, M-g M-p 次/前のエラーへ occurなどで使用

;;; diff
;; 外部プログラムのdiffが必要
;; (setq diff-switches "-u")
;; C-C C-c で相違点にジャンプできる
;;; ediff
;; M-x ediff-files <-元ファイルに変更を加える
;; M-x ediff-merge-files <-新しいバッファを作ってマージする
;; | 左右表示
;; n, p 移動
;; a, b 元にする方
;; wX Xバッファを保存
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;;; migemo
(require 'migemo)
(setq migemo-command "/usr/bin/cmigemo")
(setq migemo-options '("-q" "--emacs"))
(setq migemo-dictionary "/usr/share/cmigemo/euc-jp/migemo-dict")

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

;;; プリプロセッサを隠す
;; C-c @ C-d カーソル位置のブロックを隠す
;; C-c @ C-s カーソル位置のブロックを展開
(require 'hideif)
(add-hook 'c-mode-common-hook 'hide-ifdef-mode)

(setq make-backup-files nil)
;; (setq backup-inhibited t)

;;;; 見た目の設定
(menu-bar-mode 0)
(tool-bar-mode 0)
(setq inhibit-startup-message t)
;; line number
;; (global-linum-mode t)
(show-paren-mode 1)
(set-scroll-bar-mode 'right)
(global-hl-line-mode 1)
(column-number-mode 1)
(global-font-lock-mode 1)
(transient-mark-mode 1)
(display-time)

;;; scroll行数
;; (setq-default scroll-step 1)
;; (setq-default scroll-conservatively 10000)

;;; タブ
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;;; 空白文字
(require 'whitespace)
(setq whitespace-style '(face tabs lines-tail spaces))
(setq whitespace-line-column 80)
(setq whitespace-space-regexp "\\(\x3000+\\)")
(set-face-background 'whitespace-space "red")
(set-face-background 'whitespace-tab "#000060")
(global-whitespace-mode t)

(if (eq system-type 'windows-nt)
    (progn
      (mouse-avoidance-mode 'banish))
  )
(setq default-frame-alist
      (append (list '(foreground-color . "snow")
                    '(background-color . "#000055")
                    '(cursor-color . "orange")
                    ;; '(alpha . 90)
                    '(width . 82)
                    '(height . 53)
                    '(top . 0)
                    '(left . -1)
                    )
              default-frame-alist))
;;; Fontの設定
(if (eq system-type 'windows-nt)
    (progn
      (add-to-list 'default-frame-alist '(font . "MS Gothic 11"))
      ))
(if (eq system-type 'darwin)
    (progn
      (set-face-attribute 'default nil
                          :family
                          "Migu 1M"
                          :height 160
                          )
      (set-fontset-font nil 'japanese-jisx0208
                        (font-spec :family
                                   "Migu 1M"
                                   :size 16))
      (set-fontset-font nil '(#x3000 . #x30ff)
                        (font-spec :family
                                   "Migu 1M"
                                   :size 16)))
  )
;; (if (eq system-type 'gnu/linux)
;;     (progn
;;       (set-face-attribute 'default nil
;;                           :family
;;                           "Ricty Diminished"
;;                           :height 130
;;                           )
;;       (set-fontset-font nil 'japanese-jisx0208
;;                         (font-spec :family
;;                                    "Ricty Diminished"
;;                                    :size 16))))
(if (eq system-type 'gnu/linux)
    (progn
      (set-face-attribute 'default nil
                          :family
                          "RgGothic-Bd"
                          :height 130
                          )
      (set-fontset-font nil 'japanese-jisx0208
                        ;; (font-spec :family
                        ;;            "Ricty Diminished"
                        ;;            :size 17))))
                        (font-spec :family
                                   "Ricty Diminished"))))
(setq face-font-rescale-alist '(("Ricty.*" . 1)))

;;;; キーの設定
;;; キーマップ
;; global-map
;; majorhoge-mode-map
;; minorhoge-mode-map
;; 以下の2つは等価
;; (define-key global-map (kbd "C-h") 'backward-delete-char)
;; (global-set-key (kbd "C-h") 'backward-delete-char)
;; 以下はlocal-set-keyをtext-mode-hookとかで使うと等価
;; (define-key text-mode-map (kbd "C-i") 'hoge)
;; (local-set-key (kbd "C-i") 'hoge)
;; C-cの慣習
;; C-cのあとにコントロール文字、数字、{}<>:;以外の文字が続く
;; キー列はユーザが自由に定義してよい
;; C-l, C-;, C-:, C-], C-z, C-t, C-@, C-,, C-.のうち使わないものは
;; すきなものを割り当ててもよさそう
(global-set-key "\C-h" 'backward-delete-char)
(global-set-key [(ctrl shift i)] 'imenu)
(global-set-key [(ctrl shift t)] 'toggle-truncate-lines)
(global-set-key [delete] 'delete-char)
;; (global-set-key "\C-cg" 'moccur-grep-find)
(global-set-key "\C-xe" 'eval-region)
(if (eq system-type 'darwin)
    (progn
      (setq mac-command-modifier 'meta))
  )

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

;;; リアルタイムな文法チェックはflymake-modeを使う

;;; indentの設定
(add-hook 'c-mode-common-hook
          (lambda ()
            (c-set-style "bsd")
            (setq indent-tabs-mode nil)
            (setq c-basic-offset 4)
            ))

;;; js2-mode
;;; inf-ruby
(require 'inf-ruby)
(setq inf-ruby-default-implementation "pry")
(setq inf-ruby-eval-binding "Pry.toplevel_binding")
;; riなどのエスケープシーケンスを処理し、色付けする
(add-hook 'inf-ruby-mode-hook 'ansi-color-for-comint-mode-on)

;;; JSPファイルをhtml-modeで開く(微妙)
(add-to-list 'auto-mode-alist '("\\.jsp$" . html-mode))

;;; 関数名表示
(which-function-mode 1)
(setq which-function-modes t)
(delete (assoc 'which-func-mode mode-line-format) mode-line-format)
(setq-default header-line-format '(which-func-mode ("" which-func-format)))
(set-face-foreground 'which-func "red")

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

;;; auto-complete
(require 'auto-complete-config)
(ac-config-default)
(setq ac-auto-start 4)
(setq ac-auto-show-menu nil)
(setq ac-use-quick-help nil)

;;; outline-mode
(add-to-list 'auto-mode-alist '("\\.ol$" . outline-mode))

;;; ignore case
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

;;; settings of sdic
(setq load-path (cons "/usr/share/emacs/site-lisp/sdic" load-path))
(autoload 'sdic-describe-word "sdic" "英単語の意味を調べる" t nil)
(global-set-key "\C-cw" 'sdic-describe-word)
(autoload 'sdic-describe-word-at-point
  "sdic" "カーソルの位置の英単語の意味を調べる" t nil)
(global-set-key "\C-cW" 'sdic-describe-word-at-point)
(setq sdic-eiwa-dictionary-list
      '((sdicf-client "/usr/share/sdic/eijirou.sdic")))
(setq sdic-waei-dictionary-list
      '((sdicf-client "/usr/share/sdic/waeijirou.sdic")))
(setq sdic-default-coding-system 'utf-8-unix)

;;; mzscheme
;; (setq scheme-program-name "gosh")

;;; auto-install
;; (add-to-list 'load-path "~/.emacs.d/auto-install/")
;; (require 'auto-install)
;; (auto-install-update-emacswiki-package-name t)
;; (auto-install-compatibility-setup)
;; (setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; ;;; 試行錯誤用ファイルを開くための設定
;; (require 'open-junk-file)
;; ;; C-x C-zで試行錯誤ファイルを開く
;; (global-set-key (kbd "C-x C-z") 'open-junk-file)
;; ;;; 式の評価結果を注釈するための設定
;; (require 'lispxmp)
;; ;; emacs-lisp-modeでC-c C-dを押すと注釈される
;; (define-key emacs-lisp-mode-map (kbd "C-c C-d") 'lispxmp)
;;; 括弧の対応を保持して編集する設定
;; (require 'paredit)
;; (add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
;; (add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
;; (add-hook 'lisp-mode-hook 'enable-paredit-mode)
;; (add-hook 'ielm-mode-hook 'enable-paredit-mode)
;; (require 'auto-async-byte-compile)
;; 自動バイトコンパイルを無効にするファイル名の正規表現
;; あとで書く

;; find-functionをキー割り当てする
(find-function-setup-keys)

;;; eshell
;; Emacs起動時にEshellを起動
;; (add-hook 'after-init-hook (lambda() (eshell) ))
;; 補完時に大文字小文字を区別しない
(setq eshell-cmpl-ignore-case t)
;; 確認なしでヒストリ保存
(setq eshell-ask-to-save-history (quote always))
;; 補完時にサイクルする
(setq eshell-cmpl-cycle-completions t)
;; 補完候補がこの数値以下だとサイクルせずに候補表示
(setq eshell-cmpl-cycle-cutoff-length 5)
;; 履歴で重複を無視する
(setq eshell-hist-ignoredups t)

;; cygwin-mount
(when (and (featurep 'emacs) (locate-library "cygwin-mount"))
  (require 'cygwin-mount)
  (cygwin-mount-activate))

;;; テンプレートの挿入
;; (auto-insert-mode)
;; (setq auto-insert-directory "~/.emacs.d/insert/")
;; (define-auto-insert "\\.rb" "ruby-template.rb")

;;; Markdown Mode
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;;; python-mode
;; 編集行を目立たせる（現在行をハイライト表示する）
(defface hlline-face
  '((((class color)
      (background dark))
     (:background "dark slate gray"))
    (((class color)
      (background light))
                                        ;(:background "ForestGreen"))
     (:background "LemonChiffon1"))
    (t
     ()))
  "*Face used by hl-line.")
(defface hlline-face-term
  '((((class color)
      (background dark))
     (:background "dark slate gray"))
    (((class color)
      (background light))
     (:background "dark slate gray"))
    (t
     ()))
  "*Face used by hl-line.")
(if window-system
    (setq hl-line-face 'hlline-face)
  (setq hl-line-face 'hlline-face-term))

;; (setq hl-line-face 'underline) ; 下線
(global-hl-line-mode)

;; tab
(setq default-tab-width 4)
(setq-default tab-width 4 indent-tabs-mode nil)

(require 'flymake) 

;; python-mode
;; (require 'python-mode)
;; (setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
;; (setq interpreter-mode-alist (cons '("python" . python-mode)
;;                                    interpreter-mode-alist))
;; (autoload 'python-mode "python-mode" "Python editing mode." t)
 
(add-hook 'python-mode-hook
          (function (lambda ()
                      (setq py-indent-offset 4)
                      (setq indent-tabs-mode nil)
                      (flymake-python-load))))
 
;; flymake python
(defun flymake-python-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list "/opt/local/bin/pyflakes" (list local-file))))

(defconst flymake-allowed-python-file-name-masks '(("\\.py$"
                                                    flymake-python-init)))
(defvar flymake-python-err-line-patterns
  '(("\\(.*\\):\\([0-9]+\\):\\(.*\\)" 1 2 nil 3)))

(defun flymake-python-load ()
  (interactive)
  (defadvice flymake-post-syntax-check
    (before flymake-force-check-was-interrupted)
    (setq flymake-check-was-interrupted t))
  (ad-activate 'flymake-post-syntax-check)
  (setq flymake-allowed-file-name-masks
        (append flymake-allowed-file-name-masks
                flymake-allowed-python-file-name-masks))
  (setq flymake-err-line-patterns flymake-python-err-line-patterns)
  (flymake-mode t))

;;flymake-ler(file line type text &optional full-file)
(defun show-fly-err-at-point ()
  "If the cursor is sitting on a flymake error, display the
message in the minibuffer"
  (interactive)
  (let ((line-no (line-number-at-pos)))
    (dolist (elem flymake-err-info)
      (if (eq (car elem) line-no)
          (let ((err (car (second elem))))
            (message "%s" (fly-pyflake-determine-message err)))))))

(defun fly-pyflake-determine-message (err)
  "pyflake is flakey if it has compile problems, this adjusts the 
message to display, so there is one "
  (cond ((not (or (eq major-mode 'Python) (eq major-mode 'python-mode) t)))
        ((null (flymake-ler-file err))
         ;; normal message do your thing
         (flymake-ler-text err))
        (t ;; could not compile err
         (format "compile error, problem on line %s" (flymake-ler-line err)))))
 
(defadvice flymake-goto-next-error (after display-message activate compile)
  "Display the error in the mini-buffer rather than having to mouse over it"
  (show-fly-err-at-point))
 (global-set-key (kbd "C-c e") 'flymake-goto-next-error)

 (defadvice flymake-goto-prev-error (after display-message activate compile)
   "Display the error in the mini-buffer rather than having to mouse over it"
   (show-fly-err-at-point))
 
(defadvice flymake-mode (before post-command-stuff activate compile)
 "Add functionality to the post command hook so that if the
 cursor is sitting on a flymake error the error information is
 displayed in the minibuffer (rather than having to mouse over
 it)"
  (set (make-local-variable 'post-command-hook)
       (cons 'show-fly-err-at-point post-command-hook)))

;;anything
;; (require 'anything-startup)

;;.pyファイルを開いた際に、文字コード指定がなければ文字コード指定文字列を追加
(defun my-short-buffer-file-coding-system (&optional default-coding)
  (let ((coding-str (format "%S" buffer-file-coding-system)))
   (cond ((string-match "shift-jis" coding-str) 'shift_jis)
         ((string-match "euc-jp" coding-str) 'euc-jp)
         ((string-match "utf-8" coding-str) 'utf-8)
         (t (or default-coding 'utf-8)))))

(defun my-insert-file-local-coding ()
  "ファイルの先頭に `coding:' を自動挿入する"
  (interactive)
  (save-excursion
    (goto-line 2) (end-of-line) ; ２行目の行末の移動
    (let ((limit (point)))
      (goto-char (point-min))
      (unless (search-forward "coding:" limit t) ; 2行目以内に `coding:'がない
        (goto-char (point-min))
        ;; #!で始まる場合２行目に記述
        (when (and (< (+ 2 (point-min)) (point-max))
                   (string= (buffer-substring (point-min) (+ 2 (point-min))) "#!"))
          (unless (search-forward "\n" nil t) ; `#!'で始まり末尾に改行が無い場合
            (insert "\n")))                   ; 改行を挿入
        (let ((st (point)))
          (insert (format "-*- coding: %S -*-\n" (my-short-buffer-file-coding-system)))
          (comment-region st (point)))))))

(add-hook 'python-mode-hook 'my-insert-file-local-coding)

;; auto-complete.el
(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)
(setq ac-auto-start nil)
;; TABで補完起動
(ac-set-trigger-key "TAB")
                                        ;"M-/"で補完中止
                                        ;(define-key ac-completing-map "\M-/" 'ac-stop)
                                        ;補完メニュー表示時のみC-n/C-pで補完候補を選択する
(setq ac-use-menu-map t)
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)

;;; キーバインドに同時押しを追加
(require 'key-chord)
(setq key-chord-two-keys-delay 0.04)
(key-chord-mode 1)
(key-chord-define-global "jk" 'view-mode)

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

;; 拡張子がorg, txtのファイルを開いた時、自動的にorg-modeにする
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(add-to-list 'auto-mode-alist '("\\.txt$" . markdown-mode))
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
;; Markdown
(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
;; Elixir
(require 'elixir-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-follow-mode-persistent t)
 '(helm-source-names-using-follow (quote ("Search at /tmp/testdir/")))
 '(package-selected-packages
   (quote
    (image+ go-mode helm-ag seeing-is-believing wgrep ripgrep inf-ruby magit paredit ido-migemo ido-ubiquitous smex ido-vertical-mode bison-mode trr org-plus-contrib org markdown-mode elixir-mode auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;;; バッファの操作
(ido-mode 1)
(require 'ido)
(ido-everywhere t)
;;; あいまいマッチ
(setq ido-enable-flex-matching t)
;;; M-xをido化
(when (fboundp 'smex)
  (global-set-key (kbd "M-x") 'smex))
;;; 縦に並べる
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)
;;; completing-readをido化
(ido-ubiquitous-mode 1)

;;;; mozc
(add-to-list 'load-path "/usr/share/emacs24/site-lisp/emacs-mozc/")
(require 'mozc)
(setq default-input-method "japanese-mozc")
(global-set-key (kbd "S-SPC") 'toggle-input-method)
(add-hook 'mozc-mode-hook
          (lambda ()
            (define-key mozc-mode-map (kbd "S-SPC") 'toggle-input-method)))
;;; magit
(global-set-key (kbd "C-x g") 'magit-status)

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
(require 'seeing-is-believing)
(add-hook 'ruby-mode-hook 'seeing-is-believing)

;;; ripgrep (helm-agから使うときにはいらないみたい)
;;; rgバイナリの位置
(setq ripgrep-executable "~/bin/rg")
;;; rgに渡すオプション
(setq ripgrep-arguments '("-S"))

;;; helm-ag
(require 'helm)
;;; ag以外の検索コマンドも使える
;; (setq helm-ag-base-command "grep -rin")
;; (setq helm-ag-base-command "csearch -n")
;; (setq helm-ag-base-command "pt --nocolor --nogroup")
(setq helm-ag-base-command "rg --vimgrep --no-heading")
;;; 現在のシンボルをデフォルトのクエリにする
(setq helm-ag-insert-at-point 'symbol)

;;; C-M-gはちょうどあいてる
(global-set-key "\C-cg" 'helm-ag)
(global-set-key (kbd "C-M-k") 'backward-kill-sexp) ;推奨
(define-key helm-map (kbd "C-h") 'delete-backward-char)
;; (define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)

;; (defun helm-ag-dot-emacs ()
;;   ".emacs.d以下を検索"
;;   (interactive)
;;   (helm-ag "~/.emacs.d/"))
(require 'projectile nil t)
(defun helm-projectile-ag ()
  "Projectileと連携"
  (interactive)
  (helm-ag (projectile-project-root)))
;; (helm-ag "~/.emacs.d/")
