;;;
;;; Modes available in site-lisp or on the system should be required in here
;;;

;; Display whitespace
(require 'blank-mode)

;; NginX configuration syntax and colors
(require 'nginx-mode)

;; Present an org-mode file as slides
(require 'org-present)
(autoload 'org-present "org-present" nil t)
(setq org-log-done t)
(eval-after-load "org-present"
  '(progn
     (add-hook 'org-present-mode-hook
	       (lambda ()
		 (org-present-big)
		 (org-display-inline-images)
		 (org-present-hide-cursor)
		 (org-present-read-only)))
     (add-hook 'org-present-mode-quit-hook
	       (lambda ()
		 (org-present-small)
		 (org-remove-inline-images)
		 (org-present-show-cursor)
		 (org-present-read-write)))))

;; PHP syntax highlighting and colors
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
; Autoload the php-mode for files ending in ".php"
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
