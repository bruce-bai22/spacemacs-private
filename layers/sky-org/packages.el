;;; packages.el --- sky-org layer packages file for Spacemacs.
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
;; added to `sky-org-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `sky-org/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `sky-org/pre-init-PACKAGE' and/or
;;   `sky-org/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst sky-org-packages
  '(org
    (org-agenda :location built-in)
    ))

(defun sky-org/post-init-org ()
  (with-eval-after-load 'org
    ;; Open org-mode export markdown file.
    (setq org-export-backends (quote (ascii html icalendar latex md)))))

;; 在 org-agenda-mode 下，设置 d 为 dispatch 快捷键
;; 暂时使用 org layer 提供的 C-v 吧
;; (defun sky-org/pre-init-org-agenda ()
;;   (spacemacs|use-package-add-hook org-agenda
;;     :post-config
;;     (evilified-state-evilify-map org-agenda-mode-map
;;       :mode org-agenda-mode
;;       :bindings
;;       "d" 'org-agenda-view-mode-dispatch))
;;   )
(defun sky-org/post-init-org-agenda ()
  (with-eval-after-load 'org-agenda
    (define-key org-agenda-mode-map (kbd "C-c C-e") #'org-agenda-previous-date-line)))

;;; packages.el ends here
