;;; modules.el -*- lexical-binding: t; -*-

;; Copyright (C) 2022 Abdelhak Bougouffa

;; This file can be used to override `minemacs-modules'
;; and `minemacs-core-modules'

;; Ordered list of enabled core modules
(setq minemacs-core-modules
      '(me-defaults      ;; Tweak Emacs defaults
        me-splash        ;; Simple splash screen (inspired by emacs-splash)
        me-bootstrap     ;; Bootstrap straight.el
        me-core-ui       ;; Theme and modeline
        me-keybindings   ;; general.el, which-key, hydra, ...
        me-evil          ;; evil, evil-collection, evil-mc, ...
        me-completion))  ;; vertico, marginalia, corfu, cape, consult, ...

;; List of enabled modules
(setq minemacs-modules
      '(me-ui            ;; focus, writeroom-mode, emojify, ...
        me-editor        ;; tempel, unicode-fonts, ligature, ...
        me-extra         ;; better-jumper, ...
        me-undo          ;; undo-fu-session, vundo, ...
        me-multi-cursors ;; iedit, evil-mc, ...
        me-vc            ;; magit, forge, core-review, diff-hl, ...
        me-project       ;; project, projectile, ...
        me-prog          ;; tree-sitter, eglot, editorconfig, ...
        me-checkers      ;; flymake, ...
        ;; me-lsp        ;; lsp-mode, dap-mode, consult-lsp, ...
        me-debug         ;; realgud, disaster, ...
        me-lisp          ;; parinfer-rust, macrostep, geiser, elisp, ...
        me-data          ;; csv, yaml, toml, json, ...
        me-org           ;; org, org-modern, ...
        me-notes         ;; org-roam, deft, ...
        me-email         ;; mu4e, mu4e-alert, org-msg, ...
        ;; me-lifestyle  ;; awqat, ...
        me-docs          ;; pdf-tools, nov, ...
        me-latex         ;; tex, auctex, reftex, ...
        me-natural-langs ;; spell-fu, eglot-ltex, ...
        me-files         ;; dirvish, dired, ...
        me-tools         ;; vterm, tldr, rg, ...
        me-biblio        ;; org-cite, citar, ...
        me-daemon        ;; Emacs daemon tweaks
        me-tty           ;; Emacs from terminal
        me-rss           ;; elfeed, ...
        me-robot         ;; Robotics stuff (ros, robot-mode, ...)
        me-embedded      ;; Embedded systems (arduino, openocd, bitbake, ...)
        me-eaf           ;; EAF apps (browser, jupyter, file-sender, ...)
        me-math          ;; maxima, ess, ...
        me-modeling      ;; OpenSCAD, ...
        ;; me-workspaces ;; tab-bar-mode, tabspaces-mode ... NOTE: This is a WIP
        me-window        ;; frame & window tweaks, ...
        me-media         ;; empv, ...
        me-fun           ;; xkcd, speed-type, ...
        me-binary))      ;; hexl, decompile (using objdump)...
