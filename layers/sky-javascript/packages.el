;;; packages.el --- sky-javascript layer packages file for Spacemacs.
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
;; added to `sky-javascript-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `sky-javascript/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `sky-javascript/pre-init-PACKAGE' and/or
;;   `sky-javascript/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst sky-javascript-packages
  '(sky-gtags))

(defun sky-javascript/post-init-sky-gtags ()
  (sky-gtags-define-keys-for-major-mode 'js2-mode))

;;; packages.el ends here
