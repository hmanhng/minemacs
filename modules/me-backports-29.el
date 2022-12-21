;; -*- lexical-binding: t; -*-


(defalias 'string-split #'split-string)

(defalias 'loaddefs-generate #'make-directory-autoloads)

(defmacro with-memoization (place &rest code)
  "Return the value of CODE and stash it in PLACE.
If PLACE's value is non-nil, then don't bother evaluating CODE
and return the value found in PLACE instead."
  (declare (indent 1) (debug (gv-place body)))
  (gv-letplace (getter setter) place
    `(or
      ,getter
      ,(macroexp-let2 nil val (macroexp-progn code)
        `(progn
           ,(funcall setter val)
           ,val)))))

(defun native-compile-prune-cache ()
  "Remove .eln files that aren't applicable to the current Emacs invocation."
  (interactive)
  (unless (featurep 'native-compile)
    (user-error "This Emacs isn't built with native-compile support"))
  ;; The last item in native-comp-eln-load-path is assumed to be a system
  ;; directory, so don't try to delete anything there (bug#59658).
  (dolist (dir (butlast native-comp-eln-load-path))
    ;; If a directory is non absolute it is assumed to be relative to
    ;; `invocation-directory'.
    (setq dir (expand-file-name dir invocation-directory))
    (when (file-exists-p dir)
      (dolist (subdir (seq-filter
                       (lambda (f) (not (string-match (rx "/." (? ".") eos) f)))
                       (directory-files dir t)))
        (when (and (file-directory-p subdir)
                   (file-writable-p subdir)
                   (not (equal (file-name-nondirectory
                                (directory-file-name subdir))
                               comp-native-version-dir)))
          (message "Deleting `%s'..." subdir)
          ;; We're being overly cautious here -- there shouldn't be
          ;; anything but .eln files in these directories.
          (dolist (eln (directory-files subdir t "\\.eln\\(\\.tmp\\)?\\'"))
            (when (file-writable-p eln)
              (delete-file eln)))
          (when (directory-empty-p subdir)
            (delete-directory subdir))))))
  (message "Cache cleared"))

(defmacro setopt (&rest pairs)
  "Set VARIABLE/VALUE pairs, and return the final VALUE.
This is like `setq', but is meant for user options instead of
plain variables.  This means that `setopt' will execute any
`custom-set' form associated with VARIABLE.

\(fn [VARIABLE VALUE]...)"
  (declare (debug setq))
  (unless (zerop (mod (length pairs) 2))
    (error "PAIRS must have an even number of variable/value members"))
  (let ((expr nil))
    (while pairs
      (unless (symbolp (car pairs))
        (error "Attempting to set a non-symbol: %s" (car pairs)))
      (push `(setopt--set ',(car pairs) ,(cadr pairs))
            expr)
      (setq pairs (cddr pairs)))
    (macroexp-progn (nreverse expr))))

(defun setopt--set (variable value)
  (custom-load-symbol variable)
  ;; Check that the type is correct.
  (when-let ((type (get variable 'custom-type)))
    (unless (widget-apply (widget-convert type) :match value)
      (warn "Value `%S' does not match type %s" value type)))
  (put variable 'custom-check-value (list value))
  (funcall (or (get variable 'custom-set) #'set-default) variable value))

(provide 'me-backports-29)
