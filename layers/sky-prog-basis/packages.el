;;; packages.el --- sky-prog-basis layer packages file for Spacemacs.
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
;; added to `sky-prog-basis-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `sky-prog-basis/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `sky-prog-basis/pre-init-PACKAGE' and/or
;;   `sky-prog-basis/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst sky-prog-basis-packages
  '(
    flycheck
    company
    hungry-delete))

(defun sky-prog-basis/post-init-flycheck ()
  (setq flycheck-display-errors-delay 1.0)
  (setq flycheck-idle-change-delay 3.0))

(defun sky-prog-basis/post-init-company ()
  ;; 某些没有开启 auto-complete 的 mode 下，使用 SPC-t a 开启补全后，需要设置 backends，否则无法补全
  ;; (spacemacs/set-leader-keys "ob" 'sky-toggle-default-company-backends)
  (with-eval-after-load 'company
    ;; 定义 company mode 上下选择补全项时使用 C-n/C-p 替换 M-n/M-p
    (define-key company-active-map (kbd "C-n") #'company-select-next)
    (define-key company-active-map (kbd "C-p") #'company-select-previous)
    ;; (spacemacs/diminish-undo 'company-mode)
    (setq company-minimum-prefix-length 1)
    (setq company-idle-delay 0.1)))

(defun sky-prog-basis/post-init-hungry-delete ()
  (add-hook 'prog-mode-hook 'hungry-delete-mode))

;;; packages.el ends here
