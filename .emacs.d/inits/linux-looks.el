;;;; mozc
(add-to-list 'load-path "/usr/share/emacs24/site-lisp/emacs-mozc/")
(require 'mozc)
(setq default-input-method "japanese-mozc")
(add-hook 'mozc-mode-hook
          (lambda ()
            (define-key mozc-mode-map (kbd "S-SPC") 'toggle-input-method)))

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
                               "Ricty Diminished")))
