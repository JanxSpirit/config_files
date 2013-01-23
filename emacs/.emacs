;; load path
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; package.el
(require 'package)
(package-initialize)

;; marmalade
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

;; install clojure-mode
(unless (package-installed-p 'clojure-mode)
  (package-refresh-contents)
  (package-install 'clojure-mode))

;; install clojure-test-mode
(unless (package-installed-p 'clojure-test-mode)
  (package-refresh-contents)
  (package-install 'clojure-test-mode))

;; install paredit
(unless (package-installed-p 'paredit)
  (package-refresh-contents)
  (package-install 'paredit))
(add-hook 'clojure-mode-hook 'paredit-mode)

;; install color-theme
(unless (package-installed-p 'color-theme)
  (package-refresh-contents)
  (package-install 'color-theme))
(require 'color-theme)

;; install nREPL.el
(when (not (package-installed-p 'nrepl))
  (package-install 'nrepl))

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
