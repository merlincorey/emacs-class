;;;
;;; NAMENAMENAME's .emacs based on Merlin's emacs class
;;;

;; Require common lisp functions
(require 'cl)

;; Setup load path to load from local 
(defvar emacs-root "HOMEHOMEHOME/.emacs.d/"
  "Root directory of emacs customizations")
(labels ((add-path (p)
		   (add-to-list 'load-path
				(concat emacs-root p))))
  (add-path "lisp")
  (add-path "site-lisp")
  (add-path "slime"))

;; Load up local lisp code
(load-library "global-config")
(load-library "modes")
(load-library "library")
(load-library "bindings")

;; Local customizations
(setq custom-file "~/.emacs-custom")
(load custom-file)

;; Start up a terminal when emacs starts
; If you are a "quick editor" this can become very annoying since you have to quit the terminal
;(ansi-term)
