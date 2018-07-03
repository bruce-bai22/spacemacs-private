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
      '((sequence "TODO(t@/!)"
                  "NEXT(n@/!)"
                  "WAITTING(w@/!)"
                  "SOMEDAY(s@/!)" "|" "DONE(d@/!)" "ABORT(a@/!)")))

;; 定义 org-capture 模板
(setq org-directory "~/Org/GTD")
(setq org-capture-templates
      '(
        ;; Inbox 存放临时想起的事情，之后需要处理 Inbox 中的内容，重新归类(如放入 Project、Ideas、Tasks等)
        ("n" "New" entry (file+headline "~/Org/GTD/inbox.org" "Inbox")
         "** %? %^g\n   %T\n   %i\n")
        ;; Tasks 存放自己学习待办事项
        ("t" "Task" entry (file+headline "~/Org/GTD/task.org" "Tasks")
         "** TODO %? %^g\n   %T\n   %i\n")
        ;; Ideas 存放工作学习过程中的一些想法
        ("s" "Someday" entry (file+headline "~/Org/GTD/task.org" "Someday")
         "** %? %^g\n   %T\n   %i\n")
        ;; 存放工作中会议日程等
        ("c" "Calendar" entry (file+headline "~/Org/GTD/calendar.org" "Calendar")
         "** TODO %?\n   %T\n   %i\n")
        ;; Loan 存放借出的钱
        ("l" "Loan" entry (file+headline "~/Org/GTD/financial.org" "Loan")
         "** TODO %?\n   %T\n   %i\n")
        ;; Project 存放工作项目有关事宜
        ("p" "Project" entry (file+headline "~/Org/GTD/project.org" "Project")
         "** TODO %? %^g%^g%^g\n   %T\n   %i\n")
        ;; DailyLife 存放个人的日程以及杂事
        ("d" "DailyLife" entry (file+headline "~/Org/GTD/dailylife.org" "DailyLife")
         "** TODO %?\n   %T\n   %i\n")
        ;; Note 存放一些记录，如一些工作账号、重要链接、记录等
        ("N" "Note" entry (file+headline "~/Org/GTD/note.org" "Note")
         "** %? %^g\n   %T\n   %i\n")))

(setq org-default-notes-file (concat org-directory "/inbox.org"))

;; 设置 agenda files
(setq org-agenda-files '("~/Org/GTD"))

;; 打开 diary 功能，记录纪念日、节日，查找日出日落等信息。暂时不需要
;; (setq org-agenda-include-diary t)
