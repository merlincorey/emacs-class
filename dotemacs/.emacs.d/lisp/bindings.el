;;;
;;; Keybindings and rebindings
;;;

;; Enter will make a newline and "indent" for the mode, which is helpful for programming
(global-set-key "\C-m" 'newline-and-indent)

;; BSD Compatability
;(global-set-key "\C-h" 'backward-delete-char)    

;; Create a terminal with F2, name it by pressing again, create another by pressing again
(global-set-key (kbd "<f2>") 'visit-ansi-term)

;; Replace ^M characters from windows files
(global-set-key "\C-cm" 'replace-ctrlms)

;; Go to previous window (complements C-x p)
(global-set-key (kbd "C-x p") 'nother-window)

;; Move between windows with arrow keys (may need adjustment on your machine)
(global-set-key (kbd "M-[ D") 'windmove-left)
(global-set-key (kbd "M-[ C") 'windmove-right)
(global-set-key (kbd "M-[ A") 'windmove-up)
(global-set-key (kbd "M-[ B") 'windmove-down)

;; "Chop" the window with binary searching!
(load-library "chop")
(global-set-key (kbd "ESC <up>") 'chop-move-up)
(global-set-key (kbd "ESC <down>") 'chop-move-down)

;; Recommended Org mode keybindings
; Install org-mode with `M-x list-packages`
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)
