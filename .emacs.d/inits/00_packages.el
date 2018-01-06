;;;; パッケージ設定
;; (require 'package)
;; (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
;; (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;; (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
;; (package-initialize)
;; (package-refresh-contents)

(el-get-bundle exec-path-from-shell)
(exec-path-from-shell-initialize)

(el-get-bundle auto-complete)
(el-get-bundle pkg-info)

;;; Elixir
(el-get-bundle elixir-mode)

;;; Go
(el-get-bundle go-mode)

;;; Grep
(el-get-bundle color-moccur)
(el-get-bundle moccur-edit)
(el-get-bundle helm-ag)
(el-get-bundle projectile)

;;; Ido
(el-get-bundle ido-ubiquitous)
(el-get-bundle ido-vertical-mode)
(el-get-bundle smex) ; あいまいマッチ

;;; Migemo
(el-get-bundle migemo)
;; (el-get-bundle ido-migemo)

(el-get-bundle image+)

(el-get-bundle markdown-mode)

(el-get-bundle key-chord)

;;; Org
;; (el-get-bundle org)
;; (el-get-bundle org-plus-contrib)

;;; Lisp
;; (el-get-bundle paredit)

;;; Ruby
(el-get-bundle inf-ruby)
;; (el-get-bundle seeing-is-believing)

;; (el-get-bundle wgrep)

;;; C++
;; (el-get-bundle flycheck)

;;; EditorConfig
(el-get-bundle editorconfig)

;;; Plant UML
(el-get-bundle plantuml-mode)

;;; JavaScript
(el-get-bundle web-beautify)
;; npm -g install js-beautify
(el-get-bundle js2-mode)
(el-get-bundle tern)
(el-get-bundle tern-auto-complete)
;; $ sudo npm install jshint -g
;; $ sudo npm install -g tern
;; キーバインド 	内容
;; C-c C-c 	カーソル位置のワードの型（type）を表示する
;; C-c C-d 	カーソル位置のワードのドキュメントを表示する
;; M-. 	カーソル位置のワードを定義している場所へジャンプする
;; M-, 	ジャンプした場所から元の場所へ戻る
;; C-c C-r 	カーソル位置の変数名を変更する


;; (add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/elisp/")

;; locate-libraryはshellのwhich
;; ロードはrequireでよい


