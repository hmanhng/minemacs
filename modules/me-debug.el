;;; me-debug.el --- Debugging stuff -*- lexical-binding: t; -*-

;; Copyright (C) 2022-2024  Abdelhak Bougouffa

;; Author: Abdelhak Bougouffa (rot13 "nobhtbhssn@srqbencebwrpg.bet")

;;; Commentary:

;;; Code:

(use-package dape
  :straight (:host github :repo "svaante/dape")
  :commands +dape-transient
  :custom
  (dape-inline-variables t)
  (dape-adapter-dir (concat minemacs-local-dir "dape/"))
  :config
  (transient-define-prefix +dape-transient ()
    "Transient for dape."
    [["Stepping"
      ("n"  "Next" dape-next :transient t)
      ("s"  "Step in" dape-step-in :transient t)
      ("o"  "Step out" dape-step-out :transient t)
      ("c"  "Continue" dape-continue :transient t)
      ("r"  "Restart" dape-restart :transient t)]
     ["Breakpoints"
      ("bb" "Toggle" dape-breakpoint-toggle :transient t)
      ("be" "Expression" dape-breakpoint-expression :transient t)
      ("bd" "Remove at pt" dape-remove-breakpoint-at-point :transient t)
      ("bD" "Remove all" dape-breakpoint-face :transient t)
      ("bl" "Log" dape-breakpoint-log :transient t)]
     ["Info"
      ("ii" "Info" dape-info :transient t)
      ("im" "Memory" dape-read-memory :transient t)
      ("is" "Select Stack" dape-select-stack :transient t)
      ("R"  "Repl" dape-repl :transient t)]
     ["Quit"
      ("qq" "Quit" dape-quit :transient nil)
      ("qk" "Kill" dape-kill :transient nil)]]))

(use-package disaster
  :straight t)

(use-package rmsbolt
  :straight t
  :config
  (+mode-alist-add-ts-modes! rmsbolt-languages))

(use-package beardbolt
  :straight (:host github :repo "abougouffa/beardbolt" :files ("*.el" "starters"))
  :hook (beardbolt--asm-mode . flymake-mode-off)
  :config
  (+mode-alist-add-ts-modes! beardbolt-languages))

(use-package objdump-disassemble
  :straight (:host github :repo "abougouffa/objdump-disassemble"))


(provide 'me-debug)

;;; me-debug.el ends here
