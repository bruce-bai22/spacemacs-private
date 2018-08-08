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

;; 取消搜索高亮
(spacemacs/set-leader-keys "nl" 'evil-ex-nohighlight)

;; 上一位置、下一位置修改快捷键
(global-set-key (kbd "C-o") nil)
(global-set-key (kbd "C-;") 'evil-jump-backward)
(global-set-key (kbd "C-'") 'evil-jump-forward)
