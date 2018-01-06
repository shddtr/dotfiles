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
(global-set-key "\C-cg" 'moccur-grep-find)
(global-set-key "\C-cr" 'helm-ag)
(global-set-key "\C-xe" 'eval-region)
(if (eq system-type 'darwin)
    (progn
      (setq mac-command-modifier 'meta))
  )
(global-set-key "\C-cw" 'sdic-describe-word)
(global-set-key "\C-cW" 'sdic-describe-word-at-point)
(global-set-key (kbd "S-SPC") 'toggle-input-method)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-M-k") 'backward-kill-sexp) ;推奨
;; (define-key helm-map (kbd "C-h") 'delete-backward-char)
;; (define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)

;;; キーバインドに同時押しを追加
(require 'key-chord)
(setq key-chord-two-keys-delay 0.04)
(key-chord-mode 1)
(key-chord-define-global "jk" 'view-mode)
