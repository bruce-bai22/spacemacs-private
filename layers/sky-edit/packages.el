;;; packages.el --- sky-edit layer packages file for Spacemacs.
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
;; added to `sky-edit-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `sky-edit/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `sky-edit/pre-init-PACKAGE' and/or
;;   `sky-edit/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst sky-edit-packages
  '(fcitx
    ranger
    dired
    occur-mode
    helm
    evil))

(defun sky-edit/post-init-fcitx ()
  (with-eval-after-load 'fcitx
    (fcitx-aggressive-setup)))

(defun sky-edit/post-init-ranger ()
  ;; ranger 开启后，重命名某文件，默认路径使用当前路径，如果 dired-dwim-target 为 t，则默认为左边一栏所在的路径. 可使用 SPC-d d 开关
  (add-hook 'ranger-mode-hook (setq dired-dwim-target nil))
  (spacemacs/set-leader-keys "ar" 'sky-ranger)
  (with-eval-after-load 'ranger
    ;; 配置 ranger layer的相关属性
    (setq ranger-ignored-extensions '("mkv" "iso" "mp4" "mp3")) ; 不预览 mkv, iso, mp4, mp3 文件
    (setq ranger-max-preview-size 3)        ; 超过 3M 的文件不再预览
    (setq ranger-preview-delay 0.4)
    (define-key ranger-normal-mode-map (kbd "q") 'sky-quit-ranger)))

(defun sky-edit/post-init-dired ()
  ;; 开关 dired-dwim-target
  (spacemacs/set-leader-keys "dd" 'sky-toggle-dired-dwim-target)
  (with-eval-after-load 'dired
    ;; dired-mode 下总是递归拷贝目录
    (setq dired-recursive-copies 'always)
    ;; dired-mode 下总是递归删除目录
    (setq dired-recursive-deletes 'always)
    ;; dired-mode 只使用一个 buffer ，而不是每次都打开一个新 buffer
    (put 'dired-find-alternate-file 'disabled nil)
    (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
    ;; 定义返回上一层目录的快捷键(由于^不好按)
    (define-key dired-mode-map (kbd ")") 'dired-up-directory)))

(defun sky-edit/post-init-occur-mode ()
  (global-set-key (kbd "M-s o") nil)
  (spacemacs/set-leader-keys "od" 'occur-dwim)
  (define-key occur-mode-map (kbd "C-c C-e") 'occur-edit-mode))

(defun sky-edit/post-init-helm ()
  (spacemacs/set-leader-keys "oi" 'helm-imenu))

(defun sky-edit/post-init-evil ()
  ;; 快速替换当前 buffer中的字符
  (spacemacs/set-leader-keys "or" 'evil-visual-quick-replace)
  (with-eval-after-load 'evil
    ;; 解决 evil、mwim和lispy的冲突，目前spacemacs有bug，三者不兼容
    (define-key evil-insert-state-map (kbd "C-e") 'mwim-end-of-code-or-line)
    (define-key evil-motion-state-map (kbd "C-e") 'mwim-end-of-code-or-line)
    (define-key evil-insert-state-map (kbd "C-a") 'mwim-beginning-of-code-or-line)
    (define-key evil-motion-state-map (kbd "C-a") 'mwim-beginning-of-code-or-line)
    (define-key evil-insert-state-map (kbd "C-n") 'evil-next-line)
    (define-key evil-insert-state-map (kbd "C-p") 'evil-previous-line)
    (define-key evil-insert-state-map (kbd "C-k") 'kill-line)
    (define-key evil-insert-state-map (kbd "C-d") 'delete-char)

    ;; 使用 evil-search 和Symbol Highlight Transient State时，自动执行 zz 使光标居中，类似于vim的nzz
    (defadvice evil-search-next (after advice-for-evil-search-next activate)
      (evil-scroll-line-to-center (line-number-at-pos)))
    (defadvice evil-search-previous (after advice-for-evil-search-previous activate)
      (evil-scroll-line-to-center (line-number-at-pos)))
    (defadvice spacemacs/symbol-highlight-transient-state/spacemacs/quick-ahs-forward (after advice-for-ahs-forward activate)
      (evil-scroll-line-to-center (line-number-at-pos)))
    (defadvice spacemacs/symbol-highlight-transient-state/spacemacs/quick-ahs-backward (after advice-for-ahs-backward activate)
      (evil-scroll-line-to-center (line-number-at-pos)))))

;;; packages.el ends here
