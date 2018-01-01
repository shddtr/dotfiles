;; ;;; auto-complete
;; (require 'auto-complete-config)
;; (ac-config-default)
;; (setq ac-auto-start 4)
;; ;; (setq ac-auto-show-menu nil)
;; (setq ac-use-quick-help nil)

;; (require 'auto-complete)
;; (global-auto-complete-mode t)
;; (setq ac-auto-start nil)
;; ;; TABで補完起動
;; ;; (ac-set-trigger-key "TAB")
;;                                         ;"M-/"で補完中止
;;                                         ;(define-key ac-completing-map "\M-/" 'ac-stop)
;;                                         ;補完メニュー表示時のみC-n/C-pで補完候補を選択する
;; (setq ac-use-menu-map t)
;; (define-key ac-menu-map "\C-n" 'ac-next)
;; (define-key ac-menu-map "\C-p" 'ac-previous)
;; ;;anything
;; ;; (require 'anything-startup)
