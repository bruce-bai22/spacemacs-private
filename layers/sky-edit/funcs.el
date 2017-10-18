;;; funcs.el --- sky-edit layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Baitianyu <Baitianyu@Baitianyu-MacBook-Pro.local>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:


;; 解决 Ranger 与 golden ratio 不兼容
;; 顺便在开启 ranger 时，自动将 dired-dwim-target 置为 nil，根据需求可使用 SPC-d d 切换
(when (configuration-layer/package-usedp 'ranger)
  (defun sky-ranger ()
    (interactive)
    (if dired-dwim-target
        (progn
          (setq dired-dwim-target nil)
          (setq dired-dwim-target-previous-enable t))
      (progn
        (setq dired-dwim-target nil)
        (setq dired-dwim-target-previous-enable nil)))
    (if golden-ratio-mode
        (progn
          (setq golden-ratio-mode nil)
          (setq golden-ration-previous-enable t)
          (ranger))
      (progn
        (setq golden-ration-previous-enable nil)
        (ranger))))

  (defun sky-quit-ranger ()
    (interactive)
    (if dired-dwim-target-previous-enable
        (setq dired-dwim-target t))
    (if golden-ration-previous-enable
        (progn
          (setq golden-ratio-mode t)
          (ranger-close))
      (ranger-close))))

;; 快速调整 dired-mode 下 copy、rename 的提示目录是当前目录还是其余 dired 的目录
(defun sky-toggle-dired-dwim-target ()
  (interactive)
  (if dired-dwim-target
      (setq dired-dwim-target nil)
    (setq dired-dwim-target t)))

;; 增强 occur-mode，当光标位于某单词中时，M-s o 直接抓取当前的单词进行查找匹配. dwim --> do what I mean.
(when (configuration-layer/package-usedp 'occur-mode)
  (defun occur-dwim ()
    "Call `occur' with a sane default."
    (interactive)
    (push (if (region-active-p)
              (buffer-substring-no-properties
               (region-beginning)
               (region-end))
            (let ((sym (thing-at-point 'symbol)))
              (when (stringp sym)
                (regexp-quote sym))))
          regexp-history)
    (call-interactively 'occur)))

;; 检查大文件
(defun spacemacs/check-large-file ()
  (when (> (buffer-size) 500000)
    (progn (fundamental-mode)
           (hl-line-mode nil))))

;; 快速替换当前 buffer 中的字符
(when (configuration-layer/package-usedp 'evil)
  (defun evil-visual-quick-replace (begin end)
    (interactive "r")
    (when (evil-visual-state-p)
      (evil-exit-visual-state)
      (let ((selection (regexp-quote (buffer-substring-no-properties begin end))))
        (setq command-string (format "%%s /%s//g" selection))
        (minibuffer-with-setup-hook
            (lambda () (backward-char 2))
          (evil-ex command-string))))))

;;; funcs.el ends here
