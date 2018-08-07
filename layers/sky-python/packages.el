;;; packages.el --- sky-python layer packages file for Spacemacs.
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
;; added to `sky-python-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `sky-python/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `sky-python/pre-init-PACKAGE' and/or
;;   `sky-python/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst sky-python-packages
  '(;; exec-path-from-shell
    ;; python
    ;; company
    )
  )

;; (defun sky-python/init-exec-path-from-shell ()
;;   (use-package exec-path-from-shell
;;     :init
;;     (exec-path-from-shell-initialize)))

;; (defun sky-python/post-init-python ()
;;   (add-hook 'python-mode-hook #'lsp-python-enable)
;;   (add-hook 'python-mode-hook (lambda () (lsp-mode 1))))

;; (defun sky-python/post-init-company ()
;;   (setq company-backends nil)
;;   (spacemacs|add-company-backends
;;     :backends company-lsp
;;     :modes python-mode))

;;; packages.el ends here
