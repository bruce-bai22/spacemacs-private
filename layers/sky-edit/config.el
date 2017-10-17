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


;; 防止开启输入法输入时，字体的闪烁
(setq redisplay-dont-pause nil)

;; 编程模式和文本模式下开启 which-function-mode. 就是底部显示的当前光标位于哪个函数下面
(add-hook 'prog-mode-hook 'which-function-mode)
(add-hook 'text-mode-hook 'which-function-mode)

;; 在 finder 中双击某文件使用 emacs 打开时，不需要打开新的 frame.
(when (spacemacs/window-system-is-mac)
  (setq ns-pop-up-frames nil))

;; 打开文件时，检查大文件，若文件过大，则使用 fundamental-mode 打开，不再开启各种 minor-mode，提升速度.
(add-hook 'find-file-hook 'spacemacs/check-large-file)

;; 设置 org-mode 下的自动换行
(add-hook 'org-mode-hook
          (lambda () (setq truncate-lines nil)))
