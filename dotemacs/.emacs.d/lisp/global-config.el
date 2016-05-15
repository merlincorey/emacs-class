;;;
;;; Global configuration to set options within emacs
;;;

;; Use the "font-lock" mode globally
; Makes font-colors more consistent between modes
; This is on by default in newer emacs
(global-font-lock-mode t)

;; Uncomment this to suppress welcome message *GNU Emacs* on startup
;(setq inhibit-startup-message t)

;; Settings related to backup files (#unsaved, lastsaved~, etc)
; This setup centralizes the storage of backup files in the home directory
; It also deletes old version and keeps up to 8 versions of a file on hand
; The "version control" is simply within emacs on this machine using these backups
(setq backup-directory-alist `(("." . "~/.emacs.d/auto-saves"))
      backup-by-copying-when-linked t
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)
