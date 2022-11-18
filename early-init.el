;;; early-init.el -*- lexical-binding: t; -*-

;;; Garbage collection
;; Increase the GC threshold for faster startup
;; This will be overriten when `gcmh' is loaded
(setq gc-cons-threshold (* 1 1024 1024 1024)) ;; 1GB

;; Prefer loading newest compiled .el file
(setq load-prefer-newer t)

;;; UI configuration
;; Inhibit startup messages
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)

;; Remove some unneeded UI elements
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)
(push '(mouse-color . "blue") default-frame-alist)
(push '(left-fringe . 8)  default-frame-alist)
(push '(right-fringe . 8) default-frame-alist)

(when (and (>= emacs-major-version 29) nil)
  (push '(alpha-background . 90) default-frame-alist))

(setq tool-bar-mode nil
      menu-bar-mode nil
      scroll-bar-mode nil)

;; Load MinEmacs variables first
(load (concat user-emacs-directory "core/me-vars.el") nil t)

;;; Load the early config file if it exists
(let ((early-config-path (concat minemacs-config-dir "early-config.el")))
  (when (file-exists-p early-config-path)
    (load early-config-path nil 'nomessage)))
