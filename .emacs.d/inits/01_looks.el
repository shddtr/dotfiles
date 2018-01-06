;;;; 見た目の設定
(menu-bar-mode 0)
(tool-bar-mode 0)
(setq inhibit-startup-message t)
;; (global-linum-mode t) ; line number
(show-paren-mode 1)
(set-scroll-bar-mode 'right)
(global-hl-line-mode 1)
(column-number-mode 1)
(global-font-lock-mode 1)
(transient-mark-mode 1)
(display-time)
;;; タブ
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
;; tab
(setq default-tab-width 4)

;;; 空白文字
(require 'whitespace)
(setq whitespace-style '(face tabs lines-tail spaces))
(setq whitespace-line-column 80)
(setq whitespace-space-regexp "\\(\x3000+\\)")
(set-face-background 'whitespace-space "red")
(set-face-background 'whitespace-tab "#000060")
(global-whitespace-mode t)

(setq default-frame-alist
      (append (list '(foreground-color . "snow")
                    ;; '(background-color . "#000055")
                    '(background-color . "#232323")
                    '(cursor-color . "orange")
                    ;; '(alpha . 90)
                    '(width . 82)
                    '(height . 53)
                    '(top . 0)
                    '(left . -1)
                    )
              default-frame-alist))
;;; Fontの設定
(setq face-font-rescale-alist '(("Ricty.*" . 1)))
