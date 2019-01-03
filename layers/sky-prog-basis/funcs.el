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

(defun sky-dash ()
  (interactive)
  (require 'dom)
  (ivy-read
   "Search Dash: "
   (lambda (str)
     (or
      (ivy-more-chars)
      (with-temp-buffer
        ;; dashAlfredWorkflow 'c:puts' | xmllint --format -
        (if (zerop (call-process "dashAlfredWorkflow" nil t nil str))
            (let* ((dom (libxml-parse-xml-region (point-min) (point-max)))
                   (items (dom-by-tag dom 'item)))
              (cl-loop for item in items
                       for uid = (dom-attr item 'uid)
                       for quicklookurl = (dom-text (dom-child-by-tag item 'quicklookurl))
                       for title = (dom-text (dom-child-by-tag item 'title))
                       for subtitle = (dom-text (car (last (dom-by-tag item 'subtitle))))
                       for subtitle+face = (propertize subtitle 'face 'font-lock-comment-face)
                       collect (propertize (concat title " " subtitle+face)
                                           'uid uid
                                           'quicklookurl quicklookurl)))
          (list
           "Error: dashAlfredWorkflow fails"
           ""
           (split-string (buffer-string) "\n"))))))
   :dynamic-collection t
   :action (lambda (x)
             (call-process "open" nil nil nil (get-text-property 0 'uid x)))))

;; funcs.el ends here.
