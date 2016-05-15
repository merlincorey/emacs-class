;;;
;;; Library functions used in `M-x` invocations or bound to keys in bindings.el
;;;

;; Terminal awesomeness
(require 'term)
(defun visit-ansi-term ()
  "If the current buffer is:
     1) a running ansi-term named *ansi-term*, rename it.
     2) a stopped ansi-term, kill it and create a new one.
     3) a non ansi-term, go to an already running ansi-term
        or start a new one while killing a defunt one"
  (interactive)
  (let ((is-term (string= "term-mode" major-mode))
        (is-running (term-check-proc (buffer-name)))
        (term-cmd "/bin/bash")
        (anon-term (get-buffer "*ansi-term*")))
    (if is-term
        (if is-running
            (if (string= "*ansi-term*" (buffer-name))
                (call-interactively 'rename-buffer)
              (if anon-term
                  (switch-to-buffer "*ansi-term*")
                (ansi-term term-cmd)))
          (kill-buffer (buffer-name))
          (ansi-term term-cmd))
      (if anon-term
          (if (term-check-proc "*ansi-term*")
              (switch-to-buffer "*ansi-term*")
            (kill-buffer "*ansi-term*")
            (ansi-term term-cmd))
        (ansi-term term-cmd)))))

;; String in buffer replacements
;; Replace all freakin' ^M chars in the current buffer
;; TODO: Rewrite in emacs lisp instead of keyboard macro
(fset 'replace-ctrlms
      [escape ?< escape ?% ?\C-q ?\C-m return ?\C-q ?\C-j return ?!])

;; Window stuff
(defun nother-window()
  "Switch to the previous window"
  (interactive)
  (other-window -1))

;; Mercilessly stolen from Steve Yegge
(defun swap-windows ()
   "If you have 2 windows, it swaps them."
   (interactive)
   (cond ((not (= (count-windows) 2)) (message "You need exactly 2 windows to do this."))
	 (t
	  (let* ((w1 (first (window-list)))
		 (w2 (second (window-list)))
		 (b1 (window-buffer w1))
		 (b2 (window-buffer w2))
		 (s1 (window-start w1))
		 (s2 (window-start w2)))
	    (set-window-buffer w1 b2)
	    (set-window-buffer w2 b1)
	    (set-window-start w1 s2)
	    (set-window-start w2 s1)))))

(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME." (interactive "sNew name: ")
  (let ((name (buffer-name))
	(filename (buffer-file-name)))
    (if (not filename)
	(message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
	  (message "A buffer named '%s' already exists!" new-name)
	(progn
	  (rename-file name new-name 1)
	  (rename-buffer new-name)
	  (set-visited-file-name new-name)
	  (set-buffer-modified-p nil))))))

(defun move-buffer-file (dir)
  "Moves both current buffer and file it's visiting to DIR." (interactive "DNew directory: ")
  (let* ((name (buffer-name))
	 (filename (buffer-file-name))
	 (dir
	  (if (string-match dir "\\(?:/\\|\\\\)$")
	      (substring dir 0 -1) dir))
	 (newname (concat dir "/" name)))
    (if (not filename)
	(message "Buffer '%s' is not visiting a file!" name)
      (progn
	(copy-file filename newname 1)
	(delete-file filename)
	(set-visited-file-name newname)
	(set-buffer-modified-p nil) t))))
