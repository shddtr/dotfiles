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
