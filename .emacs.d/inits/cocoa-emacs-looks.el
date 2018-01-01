;; (if (eq system-type 'darwin)
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
  ;; )
