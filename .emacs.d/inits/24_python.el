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
