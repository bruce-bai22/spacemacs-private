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

;; Gtags
(defun spacemacs/counsel-gtags-define-keys-for-mode (mode)
  "为 major mode：mode 设置 counsel-gtags 快捷键"
  (when (fboundp mode)
    (spacemacs/set-leader-keys-for-major-mode mode
      "gc" 'counsel-gtags-create-tags
      "gD" 'counsel-gtags-find-definition
      "gr" 'counsel-gtags-find-reference
      "gs" 'counsel-gtags-find-symbol
      "gf" 'counsel-gtags-find-file
      "gu" 'counsel-gtags-update-tags
      "gd" 'counsel-gtags-dwim)))

;; 设置默认的 company backends
(defun sky-toggle-default-company-backends ()
  (interactive)
  (spacemacs/toggle-auto-completion-on)
  (if company-mode
      (setq company-backends '((company-gtags company-etags company-dabbrev)))))

;; funcs.el ends here.
