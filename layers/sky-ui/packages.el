;;; packages.el --- sky-ui layer packages file for Spacemacs.
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

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `sky-ui-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `sky-ui/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `sky-ui/pre-init-PACKAGE' and/or
;;   `sky-ui/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst sky-ui-packages
  '(linum
    hungry-delete
    lispy
    whitespace
    mmm-mode))

(defun sky-ui/post-init-linum ()
  ;; 配置 linum 只有在编程模式下开启
  (add-hook 'prog-mode-hook 'linum-mode))

;; 下面的配置都是在 space-line 中为不同模式提供 minor-mode 的字符表示
(defun sky-ui/pre-init-hungry-delete ()
  (spacemacs|use-package-add-hook hungry-delete
    :post-init
    (spacemacs|diminish hungry-delete-mode "ⓗ" "h")))

(defun sky-ui/pre-init-lispy ()
  (spacemacs|use-package-add-hook lispy
    :post-init
    (spacemacs|diminish lispy-mode "Ⓛ" "L")))

(defun sky-ui/pre-init-mmm-mode ()
  (spacemacs|use-package-add-hook mmm-mode
    :post-init
    (spacemacs|diminish mmm-mode "Ⓜ" "M")))

;; 配置默认不显示空白字符
(defun sky-ui/post-init-whitespace ()
  (setq spacemacs-show-trailing-whitespace nil))

;;; packages.el ends here
