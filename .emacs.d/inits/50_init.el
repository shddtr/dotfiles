;;;; 基本

;; M-;は空気を読んだコメントアウト
;; C-u M-;は1行コメント削除
;; C-u 3 M-;で;;;コメント

;; hookは特定のタイミングで実行するコードを登録する変数
;; -hook, -hooks, -functionsという接尾辞
;; (add-hook 'after-init-hook 'greeting)

;;; C-x C-e でカーソル直前のS式を評価
;; コメント内部でもどのバッファでも操作可能なので
;; Lispと関係のないテキストファイルのコメントに入れておいて
;; Emacsで開くとそのS式を評価できる(js2-modeでは動かなかった)
;; (man "ls")

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
