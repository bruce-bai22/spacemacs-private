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
  '((sky-gtags :location local)
    ggtags
    flycheck
    company
    hungry-delete))

(defun sky-prog-basis/init-sky-gtags ()
  (use-package sky-gtags
    :init
    (setq ggtags-global-window-height 18)
    :commands (sky-gtags-create-tags
               sky-gtags-update-tags
               sky-gtags-mode)))

(defun sky-prog-basis/init-ggtags ()
  (use-package ggtags
    :defer t
    :init
    (progn
      ;; modes that do not have a layer, add here.
      (add-hook 'awk-mode-local-vars-hook #'spacemacs/ggtags-mode-enable)
      (add-hook 'shell-mode-local-vars-hook #'spacemacs/ggtags-mode-enable)
      (add-hook 'tcl-mode-local-vars-hook #'spacemacs/ggtags-mode-enable)
      (add-hook 'vhdl-mode-local-vars-hook #'spacemacs/ggtags-mode-enable))
    :config
    (sky-gtags-mode 1)))

(defun sky-prog-basis/post-init-flycheck ()
  (setq flycheck-display-errors-delay 1.0)
  (setq flycheck-idle-change-delay 3.0))

(defun sky-prog-basis/post-init-company ()
  ;; 某些没有开启auto-complete的mode下，使用SPC-t a开启补全后，需要设置backends，否则无法补全
  (spacemacs/set-leader-keys "ob" 'sky-toggle-default-company-backends)
  (with-eval-after-load 'company
    ;; 定义 company mode 上下选择补全项时使用 C-n/C-p 替换 M-n/M-p
    (define-key company-active-map (kbd "C-n") #'company-select-next)
    (define-key company-active-map (kbd "C-p") #'company-select-previous)
    (spacemacs/diminish-undo 'company-mode)
    (setq company-minimum-prefix-length 1)
    (setq company-idle-delay 0.1)))

(defun sky-prog-basis/post-init-hungry-delete ()
  (add-hook 'prog-mode-hook 'hungry-delete-mode))

;;; packages.el ends here
