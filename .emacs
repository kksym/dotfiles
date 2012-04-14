(load (expand-file-name "~/quicklisp/slime-helper.el"))

(setq x-super-keysym 'meta)

(setq inferior-lisp-program "sbcl")

(require 'quack)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(quack-default-program "csi")
 '(quack-fontify-style (quote plt))
 '(quack-pretty-lambda-p nil)
 '(quack-run-scheme-always-prompts-p nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
