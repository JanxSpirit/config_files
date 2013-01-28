(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(starter-kit
                      starter-kit-lisp
                      starter-kit-bindings
                      starter-kit-ruby
                      starter-kit-eshell
                      clojure-mode
                      clojure-test-mode
                      auto-complete
                      nrepl
                      ac-nrepl
                      color-theme
                      color-theme-solarized))
;;this is a hack needed to make nrepl perform as expected when
;;ac-nrepl is installed
(setq nrepl-connected-hook (reverse nrepl-connected-hook))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; fix the PATH variable
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(if window-system (set-exec-path-from-shell-PATH))

(load-theme 'solarized-dark t)
