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
  '(display-line-numbers
    ;; hungry-delete
    ;; lispy
    ;; mmm-mode
    ;; tide
    whitespace
    spaceline))

(defun sky-ui/post-init-display-line-numbers ()
  (add-hook 'prog-mode-hook 'display-line-numbers-mode))

;; 下面的配置都是在 space-line 中为不同模式提供 minor-mode 的字符表示
;; 但是现在不再在 mode-line 中显示 minor modes 了，所以都注释掉了
;; (defun sky-ui/pre-init-hungry-delete ()
;;   (spacemacs|use-package-add-hook hungry-delete
;;     :post-init
;;     (spacemacs|diminish hungry-delete-mode "ⓗ" "h")))

;; (defun sky-ui/pre-init-lispy ()
;;   (spacemacs|use-package-add-hook lispy
;;     :post-init
;;     (spacemacs|diminish lispy-mode "Ⓛ" "L")))

;; ;; 这里只是为了将 mmm-mode 的 mode 标识 diminish 为 M
;; (defun sky-ui/pre-init-mmm-mode ()
;;   (spacemacs|use-package-add-hook mmm-mode
;;     :post-init
;;     (spacemacs|diminish mmm-mode "Ⓜ" "M")))

;; (defun sky-ui/pre-init-tide ()
;;   (spacemacs|use-package-add-hook tide
;;     :post-init
;;     (spacemacs|diminish tide-mode "Ⓣ" "T")))

(defun sky-ui/post-init-spaceline ()
  (defun set-header-line ()
    (setq header-line-format
          '((which-func-mode ("" which-func-format " ")))))
  (add-hook 'prog-mode-hook 'set-header-line)
  (add-hook 'text-mode-hook 'set-header-line)
  (add-hook 'js2-mode-hook 'set-header-line)
  (add-hook 'web-mode-hook 'set-header-line)
  (spaceline-toggle-minor-modes-off)
  (spaceline-toggle-which-function-off))

;; 配置默认不显示空白字符
(defun sky-ui/post-init-whitespace ()
  (setq spacemacs-show-trailing-whitespace nil))

;;; packages.el ends here
