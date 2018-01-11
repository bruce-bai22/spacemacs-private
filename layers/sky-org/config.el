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

;;; commentary:

;; TODO 状态定义
(setq org-todo-keywords
      '((sequence "TODO(t!)"
                  "NEXT(n)"
                  "WAITTING(w)"
                  "SOMEDAY(s)" "|" "DONE(d@/!)" "ABORT(a@/!)")
        ))

;; 定义 org-capture 模板
(setq org-directory "~/Org/GTD")
(setq org-capture-templates
      '(("n" "New" entry (file "~/Org/GTD/inbox.org")
         "* %? %^g\n %T\n %i\n")
        ("t" "Task" entry (file+headline "~/Org/GTD/task.org" "Tasks")
         "** TODO %?\n %T\n %i\n")
        ("i" "Idea" entry (file+headline "~/Org/GTD/task.org" "Ideas")
         "** %? %^g\n %T\n %i\n")
        ("c" "Calendar" entry (file "~/Org/GTD/calendar.org")
         "* TODO %?\n %T\n %i\n")
        ("pi" "POCT-iOS" entry (file+headline "~/Org/GTD/poct.org" "iOS")
         "** TODO %?\n %T\n %i\n")
        ("ps" "POCT-Server" entry (file+headline "~/Org/GTD/poct.org" "Server")
         "** TODO %?\n %T\n %i\n")
        ("f" "Financial" entry (file "~/Org/GTD/financial.org")
         "** %?\n %T\n %i\n")
        ("d" "DailyLife" entry (file "~/Org/GTD/dailylife.org")
         "* %?\n %T\n %i\n")
        ("n" "Note" entry (file "~/Org/GTD/note.org")
         "* %?\n %T\n %i\n")))

(setq org-default-notes-file (concat org-directory "/inbox.org"))

;; 设置 org 文件中优先级显示的样式
