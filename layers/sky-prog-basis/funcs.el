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
(defun sky-gtags-define-keys-for-major-mode (mode)
  "为major mode：mode 设置ggtags快捷键"
  (spacemacs/declare-prefix-for-mode mode "mg" "gtags")
  (spacemacs/set-leader-keys-for-major-mode mode
    "gc" 'sky-gtags-create-tags
    "gu" 'sky-gtags-update-tags
    "gft" 'ggtags-find-tag-dwim
    "gfd" 'ggtags-find-definition
    "gfr" 'ggtags-find-reference
    "gff" 'ggtags-find-file
    "gfr" 'ggtags-find-tag-regexp
    "gfs" 'ggtags-find-other-symbol
    "gg" 'ggtags-grep
    "gqr" 'ggtags-query-replace
    "gqi" 'ggtags-idutils-query
    "gmp" 'ggtags-prev-mark
    "gmn" 'ggtags-next-mark
    "ght" 'ggtags-view-tag-history
    "ghs" 'ggtags-view-search-history
    "gkb" 'ggtags-kill-file-buffers
    "gro" 'ggtags-toggle-project-read-only
    "gpr" 'ggtags-visit-project-root
    "gtd" 'ggtags-delete-tags
    "gte" 'ggtags-explain-tags
    "gbh" 'ggtags-browse-file-as-hypertext))

(defun sky-toggle-default-company-backends ()
  (interactive)
  (spacemacs/toggle-auto-completion-on)
  (if company-mode
      (setq company-backends '((company-gtags company-etags)))))

;; funcs.el ends here.
