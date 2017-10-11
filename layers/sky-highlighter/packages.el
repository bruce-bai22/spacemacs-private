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
  ;; ov 这个package写的时候很多方法没有考虑到defer load，所以这里没有延迟加载
  (use-package ov))

(defun sky-highlighter/init-ov-highlighter ()
  (use-package ov-highlighter
    :bind (("H-h" . ov-highlighter/body))
    :config
    (setq ov-highlight-disable-save t)
    ;; config colors
    (ov-make-highlight "red" '(:background "#f08080"))
    (ov-make-highlight "green" '(:background "#c1fcc1"))
    (ov-make-highlight "yellow" '(:background "#ffec8b"))
    (ov-make-highlight "blue" '(:background "#87ceff"))
    (ov-make-highlight "pink" '(:background "#ffb5c5"))))

;;; packages.el ends here
