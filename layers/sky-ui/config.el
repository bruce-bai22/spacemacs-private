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

(setq spacemacs-show-trailing-whitespace nil)
