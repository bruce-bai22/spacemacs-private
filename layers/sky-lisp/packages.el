;;; packages.el --- sky-lisp layer packages file for Spacemacs.
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
;; added to `sky-lisp-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `sky-lisp/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `sky-lisp/pre-init-PACKAGE' and/or
;;   `sky-lisp/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst sky-lisp-packages
  '(lispy))

(defun sky-lisp/init-lispy ()
  (use-package lispy
    :defer t
    :init
    (add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1)))
    (add-hook 'lisp-interaction-mode-hook (lambda () (lispy-mode 1)))))

;;; packages.el ends here
