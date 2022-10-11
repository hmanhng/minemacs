;; -*- lexical-binding: t; -*- Garbage collector


(use-package gcmh
  :straight t
  :after minemacs-loaded
  :custom
  (gcmh-idle-delay 'auto)
  (gcmh-auto-idle-delay-factor 10)
  (gcmh-high-cons-threshold (* 16 1024 1024))
  :config
  (gcmh-mode 1))


(provide 'me-gc)
