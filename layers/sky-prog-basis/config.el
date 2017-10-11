
;; -------------------------------------------------------------------------------------------
;; Set company-backends for different modes.


(add-hook 'emacs-lisp-mode-hook (lambda ()
                                  (setq company-backends-emacs-lisp-mode '((company-capf
                                                                            company-dabbrev-code
                                                                            company-gtags
                                                                            company-etags
                                                                            company-keywords)
                                                                           company-files company-dabbrev))))

(add-hook 'js2-mode-hook (lambda ()
                           (setq company-backends-js2-mode '((company-dabbrev-code
                                                              company-gtags
                                                              company-etags
                                                              company-keywords)
                                                             company-tern company-files company-dabbrev))))

(add-hook 'vimrc-mode-hook (lambda ()
                             (setq company-backends-vimrc-mode '((company-dabbrev-code
                                                                  company-dabbrev
                                                                  company-gtags
                                                                  company-etags
                                                                  company-keywords)
                                                                  company-files))))
(add-hook 'c++-mode-hook (lambda ()
                           (message "hellohello")))

(add-hook 'c++-mode-hook (lambda ()
                           (setq company-backends-c++-mode '((company-c-headers
                                                             company-gtags
                                                             company-etags
                                                             company-keywords
                                                             company-files
                                                             company-dabbrev-code
                                                             company-dabbrev)))))

(add-hook 'c-mode-hook (lambda ()
                         (setq company-backends-c-mode '((company-c-headers
                                                            company-gtags
                                                            company-etags
                                                            company-keywords
                                                            company-files
                                                            company-dabbrev-code
                                                            company-dabbrev)))))

;; config.el ends here.
