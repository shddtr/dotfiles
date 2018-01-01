;;; 関数名表示
(which-function-mode 1)
(setq which-function-modes t)
(delete (assoc 'which-func-mode mode-line-format) mode-line-format)
(setq-default header-line-format '(which-func-mode ("" which-func-format)))
(set-face-foreground 'which-func "red")

;;; リアルタイムな文法チェックはflymake-modeを使う
(require 'flymake) 

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
