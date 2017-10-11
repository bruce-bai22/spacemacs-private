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
  '(ggtags
    flycheck
    company
    hungry-delete))

(defun sky-prog-basis/post-init-ggtags ()
  (spacemacs/declare-prefix "og" "gtags")
  (spacemacs/declare-prefix "ogf" "gtags-find")
  (spacemacs/declare-prefix "ogq" "gtags-query")
  (spacemacs/declare-prefix "ogm" "gtags-mark")
  (spacemacs/declare-prefix "ogh" "gtags-history")
  (spacemacs/set-leader-keys "ogc" 'helm-gtags-create-tags)
  (spacemacs/set-leader-keys "ogu" 'helm-gtags-update-tags)
  (spacemacs/set-leader-keys "ogft" 'ggtags-find-tag-dwim)
  (spacemacs/set-leader-keys "ogfd" 'ggtags-find-definition)
  (spacemacs/set-leader-keys "ogfr" 'ggtags-find-reference)
  (spacemacs/set-leader-keys "ogff" 'ggtags-find-file)
  (spacemacs/set-leader-keys "ogfs" 'ggtags-find-other-symbol)
  (spacemacs/set-leader-keys "ogg" 'ggtags-grep)
  (spacemacs/set-leader-keys "ogqr" 'ggtags-query-replace)
  (spacemacs/set-leader-keys "ogqi" 'ggtags-idutils-query)
  (spacemacs/set-leader-keys "ogmp" 'ggtags-prev-mark)
  (spacemacs/set-leader-keys "ogmn" 'ggtags-next-mark)
  (spacemacs/set-leader-keys "oght" 'ggtags-view-tag-history)
  (spacemacs/set-leader-keys "oghs" 'ggtags-view-search-history)
  (spacemacs/set-leader-keys "ogkb" 'ggtags-kill-file-buffers)
  (spacemacs/set-leader-keys "ogro" 'ggtags-toggle-project-read-only)
  (spacemacs/set-leader-keys "ogpr" 'ggtags-visit-project-root)
  (spacemacs/set-leader-keys "ogtd" 'ggtags-delete-tags)
  (spacemacs/set-leader-keys "ogte" 'ggtags-explain-tags)
  (spacemacs/set-leader-keys "ogbh" 'ggtags-browse-file-as-hypertext)

  (with-eval-after-load 'ggtags
    (setq ggtags-global-window-height 18)))

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
