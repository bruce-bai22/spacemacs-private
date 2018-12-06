;;; packages.el --- sky-highlighter layer packages file for Spacemacs.
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
;; added to `sky-highlighter-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `sky-highlighter/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `sky-highlighter/pre-init-PACKAGE' and/or
;;   `sky-highlighter/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst sky-highlighter-packages
  '(ov
    (ov-highlighter :location local)))

(defun sky-highlighter/init-ov ()
  ;; 虽然 package ov 很多函数没有考虑 autoloads，但是 ov-highlighter package require 了 ov，当加载 ov-highlighter 时会加载 ov
  (use-package ov
    :defer t))

(defun sky-highlighter/init-ov-highlighter ()
  (use-package ov-highlighter
    :bind (("H-h" . ov-highlight/body))
    :config
    ;; config colors
    (ov-highlight-make "red" '(:background "#f08080"))
    (ov-highlight-make "green" '(:background "#c1fcc1"))
    (ov-highlight-make "yellow" '(:background "#ffec8b"))
    (ov-highlight-make "blue" '(:background "#87ceff"))
    (ov-highlight-make "pink" '(:background "#ffb5c5"))))

;;; packages.el ends here
